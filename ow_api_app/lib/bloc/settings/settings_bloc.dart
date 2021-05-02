import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/data/util/api_exception.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ProfileRepository repository;
  PersistentTabController _navBarController;

  SettingsBloc({@required this.repository}) : super(SettingsInitialState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsStarted) {
      yield* _mapSettingsStartedToState(event, state);
    } else if (event is ChangeProfileEvent) {
      yield* _mapChangeProfileEventToState(event, state);
    } else if (event is AddProfileEvent) {
      yield* _mapAddProfileEventToState(event, state);
    }
  }

  Stream<SettingsState> _mapSettingsStartedToState(
      SettingsStarted event, SettingsState state) async* {
    //Set NavBar Controller
    _navBarController = event.navBarController;

    //Open DB
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

    yield SettingsLoadedState(allAccounts: _profileBox);
  }

  Stream<SettingsState> _mapChangeProfileEventToState(
      ChangeProfileEvent event, SettingsState state) async* {
    //Open DB for saving
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

    //Navigate back to Home w/ Data
    _navBarController.jumpToTab(0);
    yield ProfileSwitchedState(
        profileId: event.profileId, platformId: event.platformId);
    yield SettingsLoadedState(allAccounts: _profileBox);
  }

  Stream<SettingsState> _mapAddProfileEventToState(
      AddProfileEvent event, SettingsState state) async* {
    yield ProfileValidatingState();

    //Open DB for saving
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

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

      yield ProfileValidatedState(isValidated: profileValidated);
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
  }
}
