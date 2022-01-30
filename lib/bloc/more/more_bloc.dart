import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/utils/shared_preferences_service.dart';

part 'more_event.dart';

part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final ProfileRepository repository;

  MoreBloc({required this.repository}) : super(MoreInitial()) {
    on<LoadSavedProfiles>((event, emit) => onLoadSavedProfiles(event, emit));
    // on<ChangeSelectedProfile>(
    //     (event, emit) => onChangeSelectedProfile(event, emit));
  }

  void onLoadSavedProfiles(
      LoadSavedProfiles event, Emitter<MoreState> emit) async {
    emit(LoadingProfiles());
    //Open DB
    Box _profileBox = Hive.box<AccountModel>('accountBox');
    var savedAccounts = _profileBox.values.cast<AccountModel>().toList();
    print(savedAccounts);

    //Fetch MainAccount
    await SharedPreferencesService().init();
    final mainAccount = SharedPreferencesService().getMainAccountName;

    emit(
      ProfilesLoaded(
        allAccounts: savedAccounts,
        mainAccount: mainAccount,
      ),
    );
  }
}
