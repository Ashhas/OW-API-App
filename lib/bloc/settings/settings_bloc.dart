import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/util/shared_pref_service.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/util/api_exception.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ProfileRepository repository;
  PersistentTabController _navBarController;

  SettingsBloc({@required this.repository}) : super(SettingsOpenedState());


  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsOpened) {
      yield* _mapSettingsStartedToState(event, state);
    } else if (event is ChangeLoadedProfile) {
      yield* _mapChangeProfileEventToState(event, state);
    } else if (event is AddProfile) {
      yield* _mapAddProfileEventToState(event, state);
    } else if (event is SaveMainAccount) {
      yield* _mapSaveMainAccountToState(event, state);
    }
  }

  Stream<SettingsState> _mapSettingsStartedToState(
      SettingsOpened event, SettingsState state) async* {
    //Set NavBar Controller
    _navBarController = event.navBarController;

    //Open DB
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

    //Fetch MainAccount
    final sharedPrefService = await SharedPreferencesService.instance;
    final mainAccount = sharedPrefService.getMainAccount;

    //Fetch App Version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    yield SettingsLoadedState(
      allAccounts: _profileBox,
      mainAccount: mainAccount,
      appVersion: version,
    );
  }

  Stream<SettingsState> _mapChangeProfileEventToState(
      ChangeLoadedProfile event, SettingsState state) async* {
    //Open DB for saving
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

    //Fetch MainAccount
    final sharedPrefService = await SharedPreferencesService.instance;
    final mainAccount = sharedPrefService.getMainAccount;

    //Fetch App Version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    //Navigate back to Home w/ Data
    _navBarController.jumpToTab(0);
    yield ProfileChangedState(
        profileId: event.profileId, platformId: event.platformId);

    yield SettingsLoadedState(
      allAccounts: _profileBox,
      mainAccount: mainAccount,
      appVersion: version,
    );
  }

  Stream<SettingsState> _mapAddProfileEventToState(
      AddProfile event, SettingsState state) async* {
    yield ValidatingProfileState();

    //Open DB for saving
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

    //Fetch MainAccount
    final sharedPrefService = await SharedPreferencesService.instance;
    final mainAccount = sharedPrefService.getMainAccount;

    //Fetch App Version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

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
        appVersion: version,
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
  }

  Stream<SettingsState> _mapSaveMainAccountToState(
      SaveMainAccount event, SettingsState state) async* {
    //Save MainAccount in SharedPref
    final sharedPrefService = await SharedPreferencesService.instance;
    sharedPrefService.setMainAccount(event.battleNetId);
  }
}
