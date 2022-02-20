import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/utils/exception/api_exception.dart';
import 'package:ow_api_app/utils/shared_preferences_service.dart';
import 'package:ow_api_app/utils/statistics_filter.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ProfileRepository repository;

  DashboardBloc({required this.repository}) : super(LoadingProfile()) {
    on<OpenDashboard>((event, emit) => onOpenDashboard(event, emit));
    on<ChangeSelectedProfile>(
        (event, emit) => onChangeSelectedProfile(event, emit));
  }

  void onOpenDashboard(
      OpenDashboard event, Emitter<DashboardState> emit) async {
    late List<Map<String, TopHero?>> selectedTopHeroes;
    late int supportGamesPlayed;
    late int supportGamesWon;
    late double supportWinRate;
    late int damageGamesPlayed;
    late int damageGamesWon;
    late double damageWinRate;
    late int tankGamesPlayed;
    late int tankGamesWon;
    late double tankWinRate;
    emit(LoadingProfile());

    await SharedPreferencesService().init();
    String mainAccount = SharedPreferencesService().getMainAccountName;
    String mainAccountPlatform =
        SharedPreferencesService().getMainAccountPlatform;

    //Fetch Data from repo
    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          mainAccount.replaceAll("#", "-"), mainAccountPlatform);

      if (profile.competitiveStats?.topHeroes != null) {
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
      emit(ProfileLoaded(
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
          damageWinRate: damageWinRate));
    } on EmptyResultException catch (e) {
      emit(ProfileError(exception: e));
    } on ClientErrorException catch (e) {
      emit(ProfileError(exception: e));
    } on ServerErrorException catch (e) {
      emit(ProfileError(exception: e));
    } on ConnectionException catch (e) {
      emit(ProfileError(exception: e));
    } on UnknownException catch (e) {
      emit(ProfileError(exception: e));
    }
  }

  void onChangeSelectedProfile(
      ChangeSelectedProfile event, Emitter<DashboardState> emit) async {
    late List<Map<String, TopHero?>> selectedTopHeroes;
    late int supportGamesPlayed;
    late int supportGamesWon;
    late double supportWinRate;
    late int damageGamesPlayed;
    late int damageGamesWon;
    late double damageWinRate;
    late int tankGamesPlayed;
    late int tankGamesWon;
    late double tankWinRate;
    emit(LoadingProfile());

    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          event.profileId.replaceAll("#", "-"), event.platformId);

      if (!profile.private) {
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

        emit(
          ProfileLoaded(
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
              damageWinRate: damageWinRate),
        );
      } else {
        emit(
          ProfileLoaded(
            profileStats: profile,
          ),
        );
      }
    } on EmptyResultException catch (e) {
      emit(ProfileError(exception: e));
    } on ClientErrorException catch (e) {
      emit(ProfileError(exception: e));
    } on ServerErrorException catch (e) {
      emit(ProfileError(exception: e));
    } on ConnectionException catch (e) {
      emit(ProfileError(exception: e));
    } on UnknownException catch (e) {
      emit(ProfileError(exception: e));
    }
  }
}
