part of 'package:ow_api_app/bloc/home/home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeOpenedState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingProfileState extends HomeState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends HomeState {
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

  ProfileLoadedState({@required this.profileStats, this.topHeroes, this.supportGamesPlayed, this.supportGamesWon, this.supportWinRate, this.damageGamesPlayed, this.damageGamesWon, this.damageWinRate, this.tankGamesPlayed, this.tankGamesWon, this.tankWinRate});

  @override
  List<Object> get props => [profileStats];
}

class HomeErrorState extends HomeState {
  final Exception exception;

  HomeErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}
