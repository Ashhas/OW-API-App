part of 'initialization_bloc.dart';

@immutable
abstract class InitializationState extends Equatable {}

class InitializationInitial extends InitializationState {
  @override
  List<Object> get props => [];
}

class Uninitialized extends InitializationState {
  @override
  List<Object> get props => [];
}

class Initialized extends InitializationState {
  @override
  List<Object> get props => [];
}

class NoNetworkOnStartup extends InitializationState {
  @override
  List<Object> get props => [];
}
