import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class FetchProfileEvent extends ProfileEvent {
  final String profileId;
  final String platformId;

  FetchProfileEvent({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => null;
}
