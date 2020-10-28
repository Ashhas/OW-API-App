import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class FetchProfileEvent extends ProfileEvent {
  String profileId;
  String platformId;

  FetchProfileEvent({this.profileId, this.platformId});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
