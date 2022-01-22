part of 'package:ow_api_app/bloc/home/dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class OpenDashboard extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class LoadProfile extends DashboardEvent {
  final String profileId;
  final String platformId;

  LoadProfile({@required this.profileId, @required this.platformId});

  @override
  List<Object> get props => [];
}
