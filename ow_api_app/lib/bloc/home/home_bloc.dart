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

  HomeBloc({@required this.repository}) : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeStarted) {
      yield* _mapHomeStartedToState(event, state);
    }
    if (event is FetchProfile) {
      yield* _mapFetchProfileEventToState(event, state);
    }
  }

  Stream<HomeState> _mapHomeStartedToState(
      HomeStarted event, HomeState state) async* {
    yield ProfileLoadingState();

    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    // Open DB
    Box _profileBox = await Hive.openBox('accountBox');

    // Start FetchDataEvent with mainAccountId
    AccountModel fetchedAccount = _profileBox.getAt(0);

    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          fetchedAccount.battleNetId.replaceAll("#", "-"),
          fetchedAccount.platformId);
      yield ProfileLoadedState(profileStats: profile);
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
      FetchProfile event, HomeState state) async* {
    yield ProfileLoadingState();
    try {
      // Add profile ID and Platform ID to the request
      Profile profile = await repository.getProfileStats(
          event.profileId.replaceAll("#", "-"), event.platformId);
      yield ProfileLoadedState(profileStats: profile);
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
}
