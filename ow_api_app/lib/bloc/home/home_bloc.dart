import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/data/util/api_exception.dart';

part 'package:ow_api_app/bloc/home/home_event.dart';

part 'package:ow_api_app/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProfileRepository repository;

  HomeBloc({@required this.repository}) : super(null) {
    Hive.registerAdapter(AccountModelAdapter());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnlineConnectionEvent) {
      yield* _mapOnlineConnectionToState(event, state);
    }
    if (event is OfflineConnectionEvent) {
      yield* _mapOfflineConnectionToState(event, state);
    }
    if (event is FetchProfileEvent) {
      yield* _mapFetchProfileEventToState(event, state);
    }
  }

  Stream<HomeState> _mapOnlineConnectionToState(
    OnlineConnectionEvent event,
    HomeState state,
  ) async* {
    yield OnlineConnectionState();
  }

  Stream<HomeState> _mapOfflineConnectionToState(
    OfflineConnectionEvent event,
    HomeState state,
  ) async* {
    yield OfflineConnectionState();
  }

  Stream<HomeState> _mapFetchProfileEventToState(
    FetchProfileEvent event,
    HomeState state,
  ) async* {
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
