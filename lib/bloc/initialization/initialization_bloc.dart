import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/utils/shared_preferences_service.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(InitializationStartedState()) {
    on<StartApp>((event, emit) => _initializeApp(event, emit));
    on<ReloadWithNetwork>((event, emit) => _reloadWithNetwork(event, emit));
    on<FinishOnBoarding>((event, emit) => _finishOnBoarding(event, emit));
  }

  void _initializeApp(StartApp event, Emitter<InitializationState> emit) async {
    //Delay for Splash Screen
    await Future.delayed(const Duration(seconds: 1));

    //Initializing and open Hive DB
    await Hive.initFlutter();
    Hive.registerAdapter(AccountModelAdapter());
    await Hive.openBox<AccountModel>('accountBox');

    //Check if OnBoarding has been finished
    await SharedPreferencesService().init();
    final isOnBoarded = SharedPreferencesService().isOnboarded;

    //Network
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      if (isOnBoarded == true) {
        emit(InitializedState());
      } else if (isOnBoarded == false) {
        emit(UninitializedState());
      }
    } else {
      emit(NoNetworkOnStartup());
    }
  }

  void _reloadWithNetwork(
      ReloadWithNetwork event, Emitter<InitializationState> emit) async {
    //Check if OnBoarding has been finished
    await SharedPreferencesService().init();
    final onBoardingSeenBefore = SharedPreferencesService().isOnboarded;

    //Network
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      if (onBoardingSeenBefore == true) {
        emit(UninitializedState());
      } else if (onBoardingSeenBefore == false) {
        emit(InitializedState());
      }
    } else {
      emit(NoNetworkOnStartup());
    }
  }

  void _finishOnBoarding(
      FinishOnBoarding event, Emitter<InitializationState> emit) async {
    //Check if OnBoarding has been finished
    await SharedPreferencesService().init();
    final isOnBoarded = SharedPreferencesService().isOnboarded;

    if (isOnBoarded == true) {
      emit(InitializedState());
    } else if (isOnBoarded == false) {
      emit(UninitializedState());
    }
  }
}
