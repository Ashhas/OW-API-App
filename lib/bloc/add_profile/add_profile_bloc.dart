import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';

part 'add_profile_event.dart';

part 'add_profile_state.dart';

class AddProfileBloc extends Bloc<AddProfileEvent, AddProfileState> {
  final ProfileRepository repository;

  AddProfileBloc({required this.repository}) : super(AddProfileInitial()) {
    on<AddNewProfile>((event, emit) => onAddNewProfile(event, emit));
  }

  void onAddNewProfile(
      AddNewProfile event, Emitter<AddProfileState> emit) async {
    emit(ValidatingProfile());

    //Open DB for saving
    Box _profileBox = Hive.box<AccountModel>('accountBox');
    var foundList = _profileBox.values
        .where((element) => element.battleNetId == event.profileId)
        .toList();

    //Check if profileID is already saved
    if (foundList == null || foundList.isEmpty) {
      //Verify Account
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
      }

      emit(ProfileValidated());
    }
  }
}
