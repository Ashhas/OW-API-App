part of 'package:ow_api_app/bloc/settings/settings_bloc.dart';

abstract class SettingsState extends Equatable {}

class SettingsInitialState extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingsLoadedState extends SettingsState {
  final Box allAccounts;

  SettingsLoadedState({@required this.allAccounts});

  @override
  List<Object> get props => [];
}

class ProfileSwitchedState extends SettingsState {
  final String profileId;
  final String platformId;

  ProfileSwitchedState({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [profileId, platformId];
}

class ProfileValidatingState extends SettingsState {
  @override
  List<Object> get props => [];
}

class ProfileValidatedState extends SettingsState {
  final bool isValidated;

  ProfileValidatedState({@required this.isValidated});

  @override
  List<Object> get props => [isValidated];
}

class SettingsErrorState extends SettingsState {
  final Exception exception;

  SettingsErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
