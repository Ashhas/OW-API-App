import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/bloc/profile/profile_state.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/data/util/ApiException.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository repository;

  ProfileBloc({@required this.repository}) : super(null);

  @override
  // TODO: implement initialState
  ProfileState get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileEvent) {
      yield ProfileLoadingState();
      try {
        Profile profile = await repository.getProfileStats(
            event.profileId.replaceAll("#", "-"), "pc");
        yield ProfileLoadedState(profileStats: profile);
      } on EmptyResultException catch (e) {
        yield ProfileErrorState(exception: e);
      } on ClientErrorException catch (e) {
        yield ProfileErrorState(exception: e);
      } on ServerErrorException catch (e) {
        yield ProfileErrorState(exception: e);
      } on ConnectionException catch (e) {
        yield ProfileErrorState(exception: e);
      } on UnknownException catch (e) {
        yield ProfileErrorState(exception: e);
      }
    }
  }
}
