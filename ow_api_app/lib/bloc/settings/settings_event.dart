part of 'package:ow_api_app/bloc/settings/settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsStarted extends SettingsEvent {
  final PersistentTabController navBarController;

  SettingsStarted({this.navBarController});

  @override
  List<Object> get props => [];
}

class ChangeProfileEvent extends SettingsEvent {
  final String profileId;
  final String platformId;

  ChangeProfileEvent({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => null;
}

class AddProfileEvent extends SettingsEvent {
  final String profileId;
  final String platformId;

  AddProfileEvent({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [profileId, platformId];
}

class SaveMainAccount extends SettingsEvent {
  final String battleNetId;

  SaveMainAccount({@required this.battleNetId});

  @override
  List<Object> get props => [battleNetId];
}
