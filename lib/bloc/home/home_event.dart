part of 'package:ow_api_app/bloc/home/home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeOpened extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LoadProfile extends HomeEvent {
  final String profileId;
  final String platformId;

  LoadProfile({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [];
}
