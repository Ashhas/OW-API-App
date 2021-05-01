part of 'initialization_bloc.dart';

@immutable
abstract class InitializationState extends Equatable {}

class Uninitialized extends InitializationState {
  @override
  List<Object> get props => [];
}

class Initialized extends InitializationState {
  @override
  List<Object> get props => [];
}
