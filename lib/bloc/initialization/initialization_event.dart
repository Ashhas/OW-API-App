part of 'initialization_bloc.dart';

@immutable
abstract class InitializationEvent extends Equatable {}

class StartApp extends InitializationEvent {
  @override
  List<Object> get props => [];
}

class FinishOnBoarding extends InitializationEvent {
  @override
  List<Object> get props => [];
}

class ReloadWithNetwork extends InitializationEvent {
  @override
  List<Object> get props => [];
}
