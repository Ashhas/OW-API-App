import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/util/api_exception.dart';
import 'package:ow_api_app/util/shared_pref_service.dart';
import 'package:path_provider/path_provider.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final ProfileRepository repository;

  OnBoardingBloc({@required this.repository}) : super(OnBoardingOpenedState());

  @override
  Stream<OnBoardingState> mapEventToState(OnBoardingEvent event) async* {
    if (event is AddFirstProfile) {
      yield* _mapFirstProfileAddedToState(event, state);
    }
  }

  Stream<OnBoardingState> _mapFirstProfileAddedToState(
      AddFirstProfile event, OnBoardingState state) async* {
    //Open DB for saving
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box _profileBox = await Hive.openBox('accountBox');

    //Verify Account
    try {
      // Add profile ID and Platform ID to the request
      bool profileValidated = await repository.validateProfileId(
          event.profileId.replaceAll("#", "-"), event.platformId);

      if (profileValidated) {
        var newAccount = AccountModel(
            1,
            event.profileId,
            event.profileId.replaceAll("#", "-"),
            event.platformId,
            DateTime.now());
        _profileBox.add(newAccount);

        //Determines that setup is done
        final sharedPrefService = await SharedPreferencesService.instance;
        sharedPrefService.setOnBoardingSeenBefore(false);
        sharedPrefService.setMainAccountName(event.profileId);
        sharedPrefService.setMainAccountPlatform(event.platformId);

        yield FirstProfileValidatedState();
      } else {
        yield FirstProfileNotValidatedState();
      }
    } on EmptyResultException catch (e) {
      yield OnBoardingErrorState(exception: e);
    } on ClientErrorException catch (e) {
      yield OnBoardingErrorState(exception: e);
    } on ServerErrorException catch (e) {
      yield OnBoardingErrorState(exception: e);
    } on ConnectionException catch (e) {
      yield OnBoardingErrorState(exception: e);
    } on UnknownException catch (e) {
      yield OnBoardingErrorState(exception: e);
    }
  }
}
