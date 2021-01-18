import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/data/util/api_exception.dart';
import 'package:path_provider/path_provider.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  ProfileRepository repository;

  SettingsBloc({@required this.repository}) : super(null);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ChangeProfileEvent) {
      yield ProfileSwitchedState(
          platformId: event.platformId, profileId: event.profileId);
    } else if (event is AddProfileEvent) {
      yield ProfileValidatingState();

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
          event.accountBox.add(newAccount);
        }

        yield ProfileValidatedState(isValidated: profileValidated);
      } on EmptyResultException catch (e) {
        yield SettingsErrorState(exception: e);
      } on ClientErrorException catch (e) {
        yield SettingsErrorState(exception: e);
      } on ServerErrorException catch (e) {
        yield SettingsErrorState(exception: e);
      } on ConnectionException catch (e) {
        yield SettingsErrorState(exception: e);
      } on UnknownException catch (e) {
        yield SettingsErrorState(exception: e);
      }
    }
  }
}
