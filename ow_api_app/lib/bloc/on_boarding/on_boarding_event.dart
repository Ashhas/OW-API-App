part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingEvent extends Equatable {}

class OnBoardingOpened extends OnBoardingEvent {
  @override
  List<Object> get props => [];
}

class AddFirstProfile extends OnBoardingEvent {
  final String profileId;
  final String platformId;

  AddFirstProfile({this.profileId, this.platformId});

  @override
  List<Object> get props => [];
}
