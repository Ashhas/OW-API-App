import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'network_connection_event.dart';

part 'network_connection_state.dart';

class NetworkConnectionBloc
    extends Bloc<NetworkConnectionEvent, NetworkConnectionState> {
  NetworkConnectionBloc() : super(InitialNetworkState()) {
    on<CheckNetworkConnection>(_onNetworkUpdated);
    on<UpdateNetworkConnectionFromStream>(_onNetworkUpdatedFromStream);

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      add(UpdateNetworkConnectionFromStream(connectivityResult: result));
    });
  }

  Future<void> _onNetworkUpdated(CheckNetworkConnection event,
      Emitter<NetworkConnectionState> emit) async {
    emit(CheckingNetworkConnection());

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(
        NoNetworkConnection(
          connectivityResult: connectivityResult,
        ),
      );
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(
        NetworkConnectionUpdated(
          connectivityResult: connectivityResult,
        ),
      );
    }
  }

  void _onNetworkUpdatedFromStream(UpdateNetworkConnectionFromStream event,
      Emitter<NetworkConnectionState> emit) {
    if (event.connectivityResult == ConnectivityResult.none) {
      emit(
        NoNetworkConnection(
          connectivityResult: event.connectivityResult,
        ),
      );
    } else if (event.connectivityResult == ConnectivityResult.mobile ||
        event.connectivityResult == ConnectivityResult.wifi) {
      emit(
        NetworkConnectionUpdated(
          connectivityResult: event.connectivityResult,
        ),
      );
    }
  }
}
