part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingState extends Equatable {}

class InitialOnBoardingState extends OnBoardingState {
  @override
  List<Object> get props => [];
}

class FirstProfileValidated extends OnBoardingState {
  final bool isVerified;

  FirstProfileValidated({this.isVerified});

  @override
  List<Object> get props => [];
}

class FirstNotProfileValidated extends OnBoardingState {
  @override
  List<Object> get props => [];
}

class OnBoardingErrorState extends OnBoardingState {
  final Exception exception;

  OnBoardingErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
