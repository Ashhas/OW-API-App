import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/bloc/profile/profile_state.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';

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
        Profile profile = await repository.getProfileStats();
        yield ProfileLoadedState(profileStats:  profile);
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
  }
}
