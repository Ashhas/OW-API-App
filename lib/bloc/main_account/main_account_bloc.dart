import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/util/shared_pref_service.dart';

part 'main_account_event.dart';

part 'main_account_state.dart';

class MainAccountBloc extends Bloc<MainAccountEvent, MainAccountState> {
  MainAccountBloc() : super(InitialMainAccountState());

  @override
  Stream<MainAccountState> mapEventToState(MainAccountEvent event) async* {
    if (event is LoadAccountData) {
      yield* _mapLoadAccountDataToState(event, state);
    } else if (event is SaveMainAccount) {
      yield* _mapSaveMainAccountToState(event, state);
    }
  }

  Stream<MainAccountState> _mapLoadAccountDataToState(
      LoadAccountData event, MainAccountState state) async* {
    //Open DB
    Box _profileBox = await Hive.openBox('accountBox');

    yield AccountDataLoaded(
      allAccountBox: _profileBox,
    );
  }

  Stream<MainAccountState> _mapSaveMainAccountToState(
      SaveMainAccount event, MainAccountState state) async* {
    //Save MainAccount in SharedPref
    final sharedPrefService = await SharedPreferencesService.instance;
    sharedPrefService.setMainAccountName(event.battleNetId);
    sharedPrefService.setMainAccountPlatform(event.platformId);
  }
}
