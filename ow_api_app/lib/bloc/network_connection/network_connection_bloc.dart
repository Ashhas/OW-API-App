import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity/connectivity.dart';

part 'network_connection_event.dart';

part 'network_connection_state.dart';

class NetworkConnectionBloc
    extends Bloc<NetworkConnectionEvent, NetworkConnectionState> {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  NetworkConnectionBloc() : super(InitialNetworkConnectionState()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      add(UpdateNetworkConnection(connectivityResult: result));
    });
  }

  @override
  Stream<NetworkConnectionState> mapEventToState(
      NetworkConnectionEvent event) async* {
    if (event is UpdateNetworkConnection) {
      yield* _mapUpdateNetworkConnectionToState(event);
    }
  }

  Stream<NetworkConnectionState> _mapUpdateNetworkConnectionToState(
      UpdateNetworkConnection event) async* {
    if (event.connectivityResult == ConnectivityResult.none) {
      yield NoNetworkConnectionState(
        connectivityResult: event.connectivityResult,
      );
    } else if (event.connectivityResult == ConnectivityResult.mobile ||
        event.connectivityResult == ConnectivityResult.wifi) {
      yield NetworkConnectionUpdatedState(
        connectivityResult: event.connectivityResult,
      );
    }
  }

  @override
  Future<void> close() {
    connectionStatusController.close();
    return super.close();
  }
}
