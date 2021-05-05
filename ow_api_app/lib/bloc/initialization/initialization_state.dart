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

class InitializedState extends InitializationState {
  final PersistentTabController navBarController;

  InitializedState({@required this.navBarController});

  @override
  List<Object> get props => [];
}
