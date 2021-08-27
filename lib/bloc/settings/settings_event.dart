part of 'package:ow_api_app/bloc/settings/settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsOpened extends SettingsEvent {
  SettingsOpened();

  @override
  List<Object> get props => [];
}

class ChangeLoadedProfile extends SettingsEvent {
  final String profileId;
  final String platformId;

  ChangeLoadedProfile({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => null;
}

class AddProfile extends SettingsEvent {
  final String profileId;
  final String platformId;

  AddProfile({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [profileId, platformId];
}

class SaveMainAccount extends SettingsEvent {
  final String battleNetId;
  final String platformId;

  SaveMainAccount({@required this.battleNetId, @required this.platformId});

  @override
  List<Object> get props => [battleNetId];
}
