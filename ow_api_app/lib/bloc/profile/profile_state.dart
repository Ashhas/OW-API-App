import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProfileLoadedState extends ProfileState {
  Profile profileStats;

  ProfileLoadedState({@required this.profileStats});

  @override
  // TODO: implement props
  List<Object> get props => [profileStats];
}

class ProfileErrorState extends ProfileState {
  Exception exception;

  ProfileErrorState({@required this.exception});

  @override
  // TODO: implement props
  List<Object> get props => [exception];
}
