part of 'package:ow_api_app/bloc/home/home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeOpenedState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingProfileState extends HomeState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends HomeState {
  final Profile profileStats;
  final List<Map<String, TopHero>> topHeroes;

  ProfileLoadedState({@required this.profileStats, this.topHeroes});

  @override
  List<Object> get props => [profileStats];
}

class HomeErrorState extends HomeState {
  final Exception exception;

  HomeErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
