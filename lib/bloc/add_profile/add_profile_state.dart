part of 'package:ow_api_app/bloc/add_profile/add_profile_bloc.dart';

abstract class AddProfileState extends Equatable {}

class AddProfileInitial extends AddProfileState {
  @override
  List<Object> get props => [];
}

class ValidatingProfile extends AddProfileState {
  @override
  List<Object> get props => [];
}

class ProfileValidated extends AddProfileState {
  @override
  List<Object> get props => [];
}

class ProfileNotValidated extends AddProfileState {
  @override
  List<Object> get props => [];
}

class DuplicatedProfileFound extends AddProfileState {
  @override
  List<Object> get props => [];
}
