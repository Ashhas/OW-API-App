part of 'network_connection_bloc.dart';

abstract class NetworkConnectionEvent extends Equatable {
  const NetworkConnectionEvent();
}

class CheckNetworkConnection extends NetworkConnectionEvent {
  const CheckNetworkConnection();

  @override
  List<Object> get props => [];
}

class UpdateNetworkConnectionFromStream extends NetworkConnectionEvent {
  final ConnectivityResult connectivityResult;

  const UpdateNetworkConnectionFromStream({required this.connectivityResult});

  @override
  List<Object> get props => [];
}
