import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/util/exception/api_exception.dart';
import 'package:ow_api_app/util/shared_pref_service.dart';
import 'package:ow_api_app/util/statistics_filter.dart';

part 'package:ow_api_app/bloc/dashboard/dashboard_event.dart';

part 'package:ow_api_app/bloc/dashboard/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ProfileRepository repository;

  DashboardBloc({@required this.repository}) : super(DashboardOpened());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is OpenDashboard) {
      yield* _mapOpenDashboardToState(event, state);
    }
    if (event is LoadProfile) {
      yield* _mapFetchProfileEventToState(event, state);
    }
  }

  Stream<DashboardState> _mapOpenDashboardToState(
      OpenDashboard event, DashboardState state) async* {
    List<Map<String, TopHero>> selectedTopHeroes;
    int supportGamesPlayed;
    int supportGamesWon;
    double supportWinRate;
    int damageGamesPlayed;
    int damageGamesWon;
    double damageWinRate;
    int tankGamesPlayed;
    int tankGamesWon;
    double tankWinRate;

    yield LoadingProfile();

    //Save MainAccount in SharedPref
    final sharedPrefService = await SharedPreferencesService.instance;
    String mainAccount = sharedPrefService.getMainAccountName;
    String mainAccountPlatform = sharedPrefService.getMainAccountPlatform;

    //Fetch Data from repo
    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          mainAccount.replaceAll("#", "-"), mainAccountPlatform);

      if (profile.competitiveStats.topHeroes != null) {
        selectedTopHeroes = StatisticsFilter.sortTopHeroes(profile);
        supportGamesPlayed =
            StatisticsFilter.calculateSupportGamesPlayed(profile);
        supportGamesWon = StatisticsFilter.calculateSupportGamesWon(profile);
        supportWinRate = StatisticsFilter.calculateSupportGamesWinRate(profile);
        damageGamesPlayed =
            StatisticsFilter.calculateDamageGamesPlayed(profile);
        damageGamesWon = StatisticsFilter.calculateDamageGamesWon(profile);
        damageWinRate = StatisticsFilter.calculateDamageGamesWinRate(profile);
        tankGamesPlayed = StatisticsFilter.calculateTankGamesPlayed(profile);
        tankGamesWon = StatisticsFilter.calculateTankGamesWon(profile);
        tankWinRate = StatisticsFilter.calculateTankGamesWinRate(profile);
      }
      yield ProfileLoaded(
          profileStats: profile,
          topHeroes: selectedTopHeroes,
          supportGamesPlayed: supportGamesPlayed,
          supportGamesWon: supportGamesWon,
          supportWinRate: supportWinRate,
          tankGamesPlayed: tankGamesPlayed,
          tankGamesWon: tankGamesWon,
          tankWinRate: tankWinRate,
          damageGamesPlayed: damageGamesPlayed,
          damageGamesWon: damageGamesWon,
          damageWinRate: damageWinRate);
    } on EmptyResultException catch (e) {
      yield ProfileError(exception: e);
    } on ClientErrorException catch (e) {
      yield ProfileError(exception: e);
    } on ServerErrorException catch (e) {
      yield ProfileError(exception: e);
    } on ConnectionException catch (e) {
      yield ProfileError(exception: e);
    } on UnknownException catch (e) {
      yield ProfileError(exception: e);
    }
  }

  Stream<DashboardState> _mapFetchProfileEventToState(
      LoadProfile event, DashboardState state) async* {
    List<Map<String, TopHero>> selectedTopHeroes;
    int supportGamesPlayed;
    int supportGamesWon;
    double supportWinRate;
    int damageGamesPlayed;
    int damageGamesWon;
    double damageWinRate;
    int tankGamesPlayed;
    int tankGamesWon;
    double tankWinRate;
    yield LoadingProfile();

    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          event.profileId.replaceAll("#", "-"), event.platformId);

      if (profile.competitiveStats.topHeroes != null) {
        selectedTopHeroes = StatisticsFilter.sortTopHeroes(profile);
        supportGamesPlayed =
            StatisticsFilter.calculateSupportGamesPlayed(profile);
        supportGamesWon = StatisticsFilter.calculateSupportGamesWon(profile);
        supportWinRate = StatisticsFilter.calculateSupportGamesWinRate(profile);
        damageGamesPlayed =
            StatisticsFilter.calculateDamageGamesPlayed(profile);
        damageGamesWon = StatisticsFilter.calculateDamageGamesWon(profile);
        damageWinRate = StatisticsFilter.calculateDamageGamesWinRate(profile);
        tankGamesPlayed = StatisticsFilter.calculateTankGamesPlayed(profile);
        tankGamesWon = StatisticsFilter.calculateTankGamesWon(profile);
        tankWinRate = StatisticsFilter.calculateTankGamesWinRate(profile);
      }
      yield ProfileLoaded(
          profileStats: profile,
          topHeroes: selectedTopHeroes,
          supportGamesPlayed: supportGamesPlayed,
          supportGamesWon: supportGamesWon,
          supportWinRate: supportWinRate,
          tankGamesPlayed: tankGamesPlayed,
          tankGamesWon: tankGamesWon,
          tankWinRate: tankWinRate,
          damageGamesPlayed: damageGamesPlayed,
          damageGamesWon: damageGamesWon,
          damageWinRate: damageWinRate);
    } on EmptyResultException catch (e) {
      yield ProfileError(exception: e);
    } on ClientErrorException catch (e) {
      yield ProfileError(exception: e);
    } on ServerErrorException catch (e) {
      yield ProfileError(exception: e);
    } on ConnectionException catch (e) {
      yield ProfileError(exception: e);
    } on UnknownException catch (e) {
      yield ProfileError(exception: e);
    }
  }
}
