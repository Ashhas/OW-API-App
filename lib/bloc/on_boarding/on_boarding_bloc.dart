import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/utils/exception/api_exception.dart';
import 'package:ow_api_app/utils/shared_preferences_service.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final ProfileRepository repository;

  OnBoardingBloc({required this.repository}) : super(OnBoardingOpenedState()) {
    on<AddFirstProfile>((event, emit) => onAddFirstProfile(event, emit));
  }

  void onAddFirstProfile(
      AddFirstProfile event, Emitter<OnBoardingState> emit) async {
    emit(ValidatingFirstProfileState());

    //Open DB for saving
    Box _profileBox = Hive.box<AccountModel>('accountBox');

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
        SharedPreferencesService().init();
        SharedPreferencesService().setIsOnboarded = true;
        SharedPreferencesService().setMainAccountName = event.profileId;
        SharedPreferencesService().setMainAccountPlatform = event.platformId;

        emit(FirstProfileValidatedState());
      } else {
        emit(FirstProfileNotValidatedState());
      }
    } on EmptyResultException catch (e) {
      emit(OnBoardingErrorState(exception: e));
    } on ClientErrorException catch (e) {
      emit(OnBoardingErrorState(exception: e));
    } on ServerErrorException catch (e) {
      emit(OnBoardingErrorState(exception: e));
    } on ConnectionException catch (e) {
      emit(OnBoardingErrorState(exception: e));
    } on UnknownException catch (e) {
      emit(OnBoardingErrorState(exception: e));
    }
  }
}
