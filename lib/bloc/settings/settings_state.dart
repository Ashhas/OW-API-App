part of 'package:ow_api_app/bloc/settings/settings_bloc.dart';

abstract class SettingsState extends Equatable {}

class SettingsOpenedState extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingsLoadedState extends SettingsState {
  final Box allAccounts;
  final String mainAccount;
  final String appVersion;

  SettingsLoadedState(
      {@required this.allAccounts,
      @required this.mainAccount,
      @required this.appVersion});

  @override
  List<Object> get props => [];
}

class ValidatingProfileState extends SettingsState {
  @override
  List<Object> get props => [];
}

class ProfileValidatedState extends SettingsState {
  @override
  List<Object> get props => [];
}

class ProfileNotValidatedState extends SettingsState {
  @override
  List<Object> get props => [];
}

class ProfileChangedState extends SettingsState {
  final String profileId;
  final String platformId;

  ProfileChangedState({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [profileId, platformId];
}

class SettingsErrorState extends SettingsState {
  final Exception exception;

  SettingsErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
