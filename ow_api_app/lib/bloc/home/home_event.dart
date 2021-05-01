part of 'package:ow_api_app/bloc/home/home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeStarted extends HomeEvent {
  final PersistentTabController navBarController;

  HomeStarted({this.navBarController});

  @override
  List<Object> get props => [];
}

class FetchProfile extends HomeEvent {
  final String profileId;
  final String platformId;

  FetchProfile({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [];
}
