import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/util/shared_pref_service.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(InitializationStartedState());

  @override
  Stream<InitializationState> mapEventToState(
      InitializationEvent event) async* {
    if (event is InitializeApp) {
      yield* _mapAppStartedEventToState();
    } else if (event is ReloadWithNetwork) {
      yield* _mapNoNetworkOnStartupEventToState();
    } else if (event is FinishOnBoarding) {
      yield* _mapOnBoardingFinishedEventToState();
    }
  }

  Stream<InitializationState> _mapAppStartedEventToState() async* {
    //Delay for Splash Screen
    await Future.delayed(Duration(seconds: 1));

    //Initializing and open Hive DB
    await Hive.initFlutter();
    Hive.registerAdapter(AccountModelAdapter());
    await Hive.openBox('accountBox');

    //Check if OnBoarding has been finished
    final sharedPrefService = await SharedPreferencesService.instance;
    final onBoardingSeenBefore = sharedPrefService.getOnBoardingSeenBefore;

    //Network
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      if (onBoardingSeenBefore == null) {
        yield UninitializedState();
      } else if (onBoardingSeenBefore == true) {
        yield UninitializedState();
      } else if (onBoardingSeenBefore == false) {
        yield InitializedState();
      }
    } else {
      yield NoNetworkOnStartup();
    }
  }

  Stream<InitializationState> _mapNoNetworkOnStartupEventToState() async* {
    //Check if OnBoarding has been finished
    final sharedPrefService = await SharedPreferencesService.instance;
    final onBoardingSeenBefore = sharedPrefService.getOnBoardingSeenBefore;

    //Network
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      if (onBoardingSeenBefore == null) {
        yield UninitializedState();
      } else if (onBoardingSeenBefore == true) {
        yield UninitializedState();
      } else if (onBoardingSeenBefore == false) {
        yield InitializedState();
      }
    } else {
      yield NoNetworkOnStartup();
    }
  }

  Stream<InitializationState> _mapOnBoardingFinishedEventToState() async* {
    //Check if OnBoarding has been finished
    final sharedPrefService = await SharedPreferencesService.instance;
    final onBoardingSeenBefore = sharedPrefService.getOnBoardingSeenBefore;

    if (onBoardingSeenBefore == null) {
      yield UninitializedState();
    } else if (onBoardingSeenBefore == true) {
      yield UninitializedState();
    } else if (onBoardingSeenBefore == false) {
      yield InitializedState();
    }
  }
}
