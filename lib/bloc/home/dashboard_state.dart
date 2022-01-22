part of 'package:ow_api_app/bloc/home/dashboard_bloc.dart';

abstract class DashboardState extends Equatable {}

class DashboardOpened extends DashboardState {
  @override
  List<Object> get props => [];
}

class LoadingProfile extends DashboardState {
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends DashboardState {
  final Profile profileStats;
  final List<Map<String, TopHero>> topHeroes;
  final int supportGamesPlayed;
  final int supportGamesWon;
  final double supportWinRate;
  final int damageGamesPlayed;
  final int damageGamesWon;
  final double damageWinRate;
  final int tankGamesPlayed;
  final int tankGamesWon;
  final double tankWinRate;

  ProfileLoaded(
      {@required this.profileStats,
      this.topHeroes,
      this.supportGamesPlayed,
      this.supportGamesWon,
      this.supportWinRate,
      this.damageGamesPlayed,
      this.damageGamesWon,
      this.damageWinRate,
      this.tankGamesPlayed,
      this.tankGamesWon,
      this.tankWinRate});

  @override
  List<Object> get props => [profileStats];
}

class ProfileError extends DashboardState {
  final Exception exception;

  ProfileError({@required this.exception});

  @override
  List<Object> get props => [exception];
}
