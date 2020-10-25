import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class FetchProfileEvent extends ProfileEvent {
  String profileId;

  FetchProfileEvent({this.profileId});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
