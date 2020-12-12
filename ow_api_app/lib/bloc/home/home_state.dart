part of 'package:ow_api_app/bloc/home/home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends HomeState {
  final Profile profileStats;

  ProfileLoadedState({@required this.profileStats});

  @override
  List<Object> get props => [profileStats];
}

class HomeErrorState extends HomeState {
  final Exception exception;

  HomeErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
