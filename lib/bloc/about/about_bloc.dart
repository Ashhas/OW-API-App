import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info/package_info.dart';

part 'about_event.dart';

part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(InitialAboutState());

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if (event is LoadAboutData) {
      yield* _mapLoadAboutDataToState(event, state);
    }
  }

  Stream<AboutState> _mapLoadAboutDataToState(
      LoadAboutData event, AboutState state) async* {
    //Fetch App Version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    yield AboutLoaded(appVersion: version);
  }
}
