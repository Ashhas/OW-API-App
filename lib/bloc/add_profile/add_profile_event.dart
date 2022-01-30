part of 'package:ow_api_app/bloc/add_profile/add_profile_bloc.dart';

abstract class AddProfileEvent extends Equatable {
  const AddProfileEvent();
}

class AddNewProfile extends AddProfileEvent {
  final String profileId;
  final String platformId;

  const AddNewProfile({required this.profileId, required this.platformId});

  @override
  List<Object> get props => [profileId, platformId];
}
