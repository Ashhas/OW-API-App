part of 'network_connection_bloc.dart';

abstract class NetworkConnectionEvent extends Equatable {
  const NetworkConnectionEvent();
}

class UpdateNetworkConnection extends NetworkConnectionEvent {
  final ConnectivityResult connectivityResult;

  UpdateNetworkConnection({@required this.connectivityResult});

  @override
  List<Object> get props => [];
}
