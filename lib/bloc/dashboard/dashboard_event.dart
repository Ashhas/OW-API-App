part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class OpenDashboard extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class ChangeSelectedProfile extends DashboardEvent {
  final String profileId;
  final String platformId;

  const ChangeSelectedProfile({
    required this.profileId,
    required this.platformId,
  });

  @override
  List<Object> get props => [];
}
