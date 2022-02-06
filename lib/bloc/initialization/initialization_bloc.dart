import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ow_api_app/utils/shared_preferences_service.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(InitializationInitial()) {
    on<StartApp>((event, emit) => _initializeApp(event, emit));
    on<FinishOnBoarding>((event, emit) => _finishOnBoarding(event, emit));
  }

  void _initializeApp(StartApp event, Emitter<InitializationState> emit) async {
    //Delay for Splash Screen
    await Future.delayed(const Duration(seconds: 1));

    //Check if OnBoarding has been finished
    await SharedPreferencesService().init();
    final isOnBoarded = SharedPreferencesService().isOnboarded;

    //Network
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      if (isOnBoarded) {
        emit(Initialized());
      } else {
        emit(Uninitialized());
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

    if (isOnBoarded) {
      emit(Initialized());
    } else {
      emit(Uninitialized());
    }
  }
}
