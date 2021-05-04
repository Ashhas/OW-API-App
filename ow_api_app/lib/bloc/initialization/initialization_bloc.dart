import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/util/shared_pref_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(StartInitialization());

  @override
  Stream<InitializationState> mapEventToState(
      InitializationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedEventToState();
    } else if (event is OnBoardingFinished) {
      yield* _mapOnBoardingFinishedEventToState();
    }
  }

  Stream<InitializationState> _mapAppStartedEventToState() async* {
    //Creating NavBar Controller
    PersistentTabController navBarController =
        PersistentTabController(initialIndex: 0);

    //Delay for Splash Screen
    await Future.delayed(Duration(seconds: 1));

    //Initializing and open Hive DB
    await Hive.initFlutter();
    Hive.registerAdapter(AccountModelAdapter());

    //Check if firstTime
    final sharedPrefService = await SharedPreferencesService.instance;
    final isFirstTime = sharedPrefService.getOnBoardingSeenBefore;

    if (isFirstTime == null) {
      yield Uninitialized();
    } else if (isFirstTime == true) {
      yield Uninitialized();
    } else if (isFirstTime == false) {
      yield Initialized(navBarController: navBarController);
    }
  }

  Stream<InitializationState> _mapOnBoardingFinishedEventToState() async* {
    //Creating NavBar Controller
    PersistentTabController navBarController =
        PersistentTabController(initialIndex: 0);

    //Check if OnBoarding has been finished
    final sharedPrefService = await SharedPreferencesService.instance;
    final onBoardingSeenBefore = sharedPrefService.getOnBoardingSeenBefore;

    if (onBoardingSeenBefore == null) {
      yield Uninitialized();
    } else if (onBoardingSeenBefore == true) {
      yield Uninitialized();
    } else if (onBoardingSeenBefore == false) {
      yield Initialized(navBarController: navBarController);
    }
  }
}
