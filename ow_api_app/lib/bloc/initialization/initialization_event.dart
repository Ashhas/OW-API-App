part of 'initialization_bloc.dart';

@immutable
abstract class InitializationEvent extends Equatable {}

class AppStarted extends InitializationEvent {
  @override
  List<Object> get props => [];
}
