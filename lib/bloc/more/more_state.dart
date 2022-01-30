part of 'package:ow_api_app/bloc/more/more_bloc.dart';

abstract class MoreState extends Equatable {}

class MoreInitial extends MoreState {
  @override
  List<Object> get props => [];
}

class LoadingProfiles extends MoreState {
  @override
  List<Object> get props => [];
}

class ProfilesLoaded extends MoreState {
  final List<AccountModel> allAccounts;
  final String mainAccount;

  ProfilesLoaded({
    required this.allAccounts,
    required this.mainAccount,
  });

  @override
  List<Object> get props => [];
}

class ProfileChangedState extends MoreState {
  final String profileId;
  final String platformId;

  ProfileChangedState({required this.profileId, required this.platformId});

  @override
  List<Object> get props => [profileId, platformId];
}

class SettingsErrorState extends MoreState {
  final Exception exception;

  SettingsErrorState({required this.exception});

  @override
  List<Object> get props => [exception];
}
