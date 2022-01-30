part of 'network_connection_bloc.dart';

@immutable
abstract class NetworkConnectionState extends Equatable {}

class InitialNetworkState extends NetworkConnectionState {
  @override
  List<Object> get props => [];
}

class NetworkConnectionUpdated extends NetworkConnectionState {
  final ConnectivityResult connectivityResult;

  NetworkConnectionUpdated({required this.connectivityResult});

  @override
  List<Object> get props => [];
}

class CheckingNetworkConnection extends NetworkConnectionState {
  @override
  List<Object> get props => [];
}

class NoNetworkConnection extends NetworkConnectionState {
  final ConnectivityResult connectivityResult;

  NoNetworkConnection({required this.connectivityResult});

  @override
  List<Object> get props => [];
}
