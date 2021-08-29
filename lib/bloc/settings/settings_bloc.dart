import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/util/shared_pref_service.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/util/exception/api_exception.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ProfileRepository repository;

  SettingsBloc({@required this.repository}) : super(SettingsOpenedState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsOpened) {
      yield* _mapSettingsStartedToState(event, state);
    } else if (event is ChangeLoadedProfile) {
      yield* _mapChangeProfileEventToState(event, state);
    } else if (event is AddProfile) {
      yield* _mapAddProfileEventToState(event, state);
    }
  }

  Stream<SettingsState> _mapSettingsStartedToState(
      SettingsOpened event, SettingsState state) async* {
    //Open DB
    Box _profileBox = await Hive.openBox('accountBox');

    //Fetch MainAccount
    final sharedPrefService = await SharedPreferencesService.instance;
    final mainAccount = sharedPrefService.getMainAccountName;

    yield SettingsLoadedState(
      allAccounts: _profileBox,
      mainAccount: mainAccount,
    );
  }

  Stream<SettingsState> _mapChangeProfileEventToState(
      ChangeLoadedProfile event, SettingsState state) async* {
    //Open DB for saving
    Box _profileBox = await Hive.openBox('accountBox');

    //Fetch MainAccount
    final sharedPrefService = await SharedPreferencesService.instance;
    final mainAccount = sharedPrefService.getMainAccountName;

    //Navigate back to Home w/ Data
    yield ProfileChangedState(
        profileId: event.profileId, platformId: event.platformId);

    yield SettingsLoadedState(
      allAccounts: _profileBox,
      mainAccount: mainAccount,
    );
  }

  Stream<SettingsState> _mapAddProfileEventToState(
      AddProfile event, SettingsState state) async* {
    yield ValidatingProfileState();

    //Open DB for saving
    Box _profileBox = Hive.box('accountBox');
    var foundList = _profileBox.values
        .where((element) => element.battleNetId == event.profileId)
        .toList();

    //Check if profileID is already saved
    if (foundList == null || foundList.isEmpty) {
      //Fetch MainAccount
      final sharedPrefService = await SharedPreferencesService.instance;
      final mainAccount = sharedPrefService.getMainAccountName;

      //Verify Account
      try {
        // Add profile ID and Platform ID to the request
        bool profileValidated = await repository.validateProfileId(
            event.profileId.replaceAll("#", "-"), event.platformId);

        if (profileValidated) {
          var newAccount = AccountModel(
              1,
              event.profileId,
              event.profileId.replaceAll("#", "-"),
              event.platformId,
              DateTime.now());
          _profileBox.add(newAccount);
        }

        yield ProfileValidatedState();

        yield SettingsLoadedState(
          allAccounts: _profileBox,
          mainAccount: mainAccount,
        );
      } on EmptyResultException catch (e) {
        yield SettingsErrorState(exception: e);
      } on ClientErrorException catch (e) {
        yield SettingsErrorState(exception: e);
      } on ServerErrorException catch (e) {
        yield SettingsErrorState(exception: e);
      } on ConnectionException catch (e) {
        yield SettingsErrorState(exception: e);
      } on UnknownException catch (e) {
        yield SettingsErrorState(exception: e);
      }
    } else {
      yield DuplicateProfileState();
    }
  }
}
