part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingEvent extends Equatable {}

class OnBoardingStarted extends OnBoardingEvent {
  @override
  List<Object> get props => [];
}

class FirstProfileAdded extends OnBoardingEvent {
  final String profileId;
  final String platformId;

  FirstProfileAdded({this.profileId, this.platformId});

  @override
  List<Object> get props => [];
}
