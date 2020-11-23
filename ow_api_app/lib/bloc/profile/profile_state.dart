import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ow_api_app/data/model/profile_model.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final Profile profileStats;

  ProfileLoadedState({@required this.profileStats});

  @override
  List<Object> get props => [profileStats];
}

class ProfileErrorState extends ProfileState {
  final Exception exception;

  ProfileErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
