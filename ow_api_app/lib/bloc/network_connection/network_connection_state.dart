part of 'network_connection_bloc.dart';

@immutable
abstract class NetworkConnectionState extends Equatable {}

class InitialNetworkConnectionState extends NetworkConnectionState {
  @override
  List<Object> get props => [];
}

class NetworkConnectionUpdatedState extends NetworkConnectionState {
  final ConnectivityResult connectivityResult;

  NetworkConnectionUpdatedState({@required this.connectivityResult});

  @override
  List<Object> get props => [];
}

class NoNetworkConnectionState extends NetworkConnectionState {
  final ConnectivityResult connectivityResult;

  NoNetworkConnectionState({@required this.connectivityResult});

  @override
  List<Object> get props => [];
}
