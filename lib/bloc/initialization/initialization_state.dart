part of 'initialization_bloc.dart';

@immutable
abstract class InitializationState extends Equatable {}

class InitializationStartedState extends InitializationState {
  @override
  List<Object> get props => [];
}

class UninitializedState extends InitializationState {
  @override
  List<Object> get props => [];
}

class NoNetworkOnStartup extends InitializationState {
  @override
  List<Object> get props => [];
}

class InitializedState extends InitializationState {

  InitializedState();

  @override
  List<Object> get props => [];
}
