import 'dart:async';

import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/data/util/api_exception.dart';
import 'package:path_provider/path_provider.dart';

part 'package:ow_api_app/bloc/home/home_event.dart';

part 'package:ow_api_app/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProfileRepository repository;

  HomeBloc({@required this.repository}) : super(HomeOpenedState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeOpened) {
      yield* _mapHomeStartedToState(event, state);
    }
    if (event is LoadProfile) {
      yield* _mapFetchProfileEventToState(event, state);
    }
  }

  Stream<HomeState> _mapHomeStartedToState(
      HomeOpened event, HomeState state) async* {
    List<Map<String, TopHero>> selectedTopHeroes;
    yield LoadingProfileState();

    //Get first account to Fetch
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');
    AccountModel fetchedAccount = _profileBox.getAt(0);

    //Fetch Data from repo
    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          fetchedAccount.battleNetId.replaceAll("#", "-"),
          fetchedAccount.platformId);

      if (profile.competitiveStats.topHeroes != null) {
        //Sort TopHero List
        selectedTopHeroes = _sortTopHeroes(profile);
      }
      yield ProfileLoadedState(
          profileStats: profile, topHeroes: selectedTopHeroes);
    } on EmptyResultException catch (e) {
      yield HomeErrorState(exception: e);
    } on ClientErrorException catch (e) {
      yield HomeErrorState(exception: e);
    } on ServerErrorException catch (e) {
      yield HomeErrorState(exception: e);
    } on ConnectionException catch (e) {
      yield HomeErrorState(exception: e);
    } on UnknownException catch (e) {
      yield HomeErrorState(exception: e);
    }
  }

  Stream<HomeState> _mapFetchProfileEventToState(
      LoadProfile event, HomeState state) async* {
    List<Map<String, TopHero>> selectedTopHeroes;
    yield LoadingProfileState();
    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          event.profileId.replaceAll("#", "-"), event.platformId);

      if (profile.competitiveStats.topHeroes != null) {
        //Sort TopHero List
        selectedTopHeroes = _sortTopHeroes(profile);
      }
      yield ProfileLoadedState(
          profileStats: profile, topHeroes: selectedTopHeroes);
    } on EmptyResultException catch (e) {
      yield HomeErrorState(exception: e);
    } on ClientErrorException catch (e) {
      yield HomeErrorState(exception: e);
    } on ServerErrorException catch (e) {
      yield HomeErrorState(exception: e);
    } on ConnectionException catch (e) {
      yield HomeErrorState(exception: e);
    } on UnknownException catch (e) {
      yield HomeErrorState(exception: e);
    }
  }

  List<Map<String, TopHero>> _sortTopHeroes(Profile profile) {
    List<Map<String, TopHero>> allTopHeroes = [];

    if (profile.competitiveStats.topHeroes.baptiste is TopHero) {
      allTopHeroes
          .add({"Baptiste": profile.competitiveStats.topHeroes.baptiste});
    }
    if (profile.competitiveStats.topHeroes.zarya is TopHero) {
      allTopHeroes.add({"Zarya": profile.competitiveStats.topHeroes.zarya});
    }
    if (profile.competitiveStats.topHeroes.winston is TopHero) {
      allTopHeroes.add({"Winston": profile.competitiveStats.topHeroes.winston});
    }
    if (profile.competitiveStats.topHeroes.widowmaker is TopHero) {
      allTopHeroes
          .add({"Widowmaker": profile.competitiveStats.topHeroes.widowmaker});
    }
    if (profile.competitiveStats.topHeroes.tracer is TopHero) {
      allTopHeroes.add({"Tracer": profile.competitiveStats.topHeroes.tracer});
    }
    if (profile.competitiveStats.topHeroes.torbjorn is TopHero) {
      allTopHeroes
          .add({"Torbjorn": profile.competitiveStats.topHeroes.torbjorn});
    }
    if (profile.competitiveStats.topHeroes.symmetra is TopHero) {
      allTopHeroes
          .add({"Symmetra": profile.competitiveStats.topHeroes.symmetra});
    }
    if (profile.competitiveStats.topHeroes.sombra is TopHero) {
      allTopHeroes.add({"Sombra": profile.competitiveStats.topHeroes.sombra});
    }
    if (profile.competitiveStats.topHeroes.soldier76 is TopHero) {
      allTopHeroes
          .add({"Soldier76": profile.competitiveStats.topHeroes.soldier76});
    }
    if (profile.competitiveStats.topHeroes.sigma is TopHero) {
      allTopHeroes.add({"Sigma": profile.competitiveStats.topHeroes.sigma});
    }
    if (profile.competitiveStats.topHeroes.roadhog is TopHero) {
      allTopHeroes.add({"Roadhog": profile.competitiveStats.topHeroes.roadhog});
    }
    if (profile.competitiveStats.topHeroes.reinhardt is TopHero) {
      allTopHeroes
          .add({"Reinhardt": profile.competitiveStats.topHeroes.reinhardt});
    }
    if (profile.competitiveStats.topHeroes.reaper is TopHero) {
      allTopHeroes.add({"Reaper": profile.competitiveStats.topHeroes.reaper});
    }
    if (profile.competitiveStats.topHeroes.pharah is TopHero) {
      allTopHeroes.add({"Pharah": profile.competitiveStats.topHeroes.pharah});
    }
    if (profile.competitiveStats.topHeroes.orisa is TopHero) {
      allTopHeroes.add({"Orisa": profile.competitiveStats.topHeroes.orisa});
    }
    if (profile.competitiveStats.topHeroes.moira is TopHero) {
      allTopHeroes.add({"Moira": profile.competitiveStats.topHeroes.moira});
    }
    if (profile.competitiveStats.topHeroes.mercy is TopHero) {
      allTopHeroes.add({"Mercy": profile.competitiveStats.topHeroes.mercy});
    }
    if (profile.competitiveStats.topHeroes.mei is TopHero) {
      allTopHeroes.add({"Mei": profile.competitiveStats.topHeroes.mei});
    }
    if (profile.competitiveStats.topHeroes.mccree is TopHero) {
      allTopHeroes.add({"McCree": profile.competitiveStats.topHeroes.mccree});
    }
    if (profile.competitiveStats.topHeroes.lucio is TopHero) {
      allTopHeroes.add({"Lucio": profile.competitiveStats.topHeroes.lucio});
    }
    if (profile.competitiveStats.topHeroes.junkrat is TopHero) {
      allTopHeroes.add({"Junkrat": profile.competitiveStats.topHeroes.junkrat});
    }
    if (profile.competitiveStats.topHeroes.hanzo is TopHero) {
      allTopHeroes.add({"Hanzo": profile.competitiveStats.topHeroes.hanzo});
    }
    if (profile.competitiveStats.topHeroes.doomfist is TopHero) {
      allTopHeroes
          .add({"Doomfist": profile.competitiveStats.topHeroes.doomfist});
    }
    if (profile.competitiveStats.topHeroes.brigitte is TopHero) {
      allTopHeroes
          .add({"Brigitte": profile.competitiveStats.topHeroes.brigitte});
    }
    if (profile.competitiveStats.topHeroes.ashe is TopHero) {
      allTopHeroes.add({"Ashe": profile.competitiveStats.topHeroes.ashe});
    }
    if (profile.competitiveStats.topHeroes.ana is TopHero) {
      allTopHeroes.add({"Ana": profile.competitiveStats.topHeroes.ana});
    }
    if (profile.competitiveStats.topHeroes.bastion is TopHero) {
      allTopHeroes.add({"Bastion": profile.competitiveStats.topHeroes.bastion});
    }
    if (profile.competitiveStats.topHeroes.dVa is TopHero) {
      allTopHeroes.add({"Diva": profile.competitiveStats.topHeroes.dVa});
    }
    if (profile.competitiveStats.topHeroes.echo is TopHero) {
      allTopHeroes.add({"Echo": profile.competitiveStats.topHeroes.echo});
    }
    if (profile.competitiveStats.topHeroes.genji is TopHero) {
      allTopHeroes.add({"Genji": profile.competitiveStats.topHeroes.genji});
    }
    if (profile.competitiveStats.topHeroes.wreckingBall is TopHero) {
      allTopHeroes.add(
          {"WreckingBall": profile.competitiveStats.topHeroes.wreckingBall});
    }
    if (profile.competitiveStats.topHeroes.zenyatta is TopHero) {
      allTopHeroes
          .add({"Zenyatta": profile.competitiveStats.topHeroes.zenyatta});
    }

    //Sort List based on TimePlayed
    allTopHeroes.sort((h1, h2) {
      return h2.entries.single.value.timePlayed
          .compareTo(h1.entries.single.value.timePlayed);
    });

    return allTopHeroes.sublist(0, 3);
  }
}
