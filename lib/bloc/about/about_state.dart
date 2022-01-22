part of 'about_bloc.dart';

@immutable
abstract class AboutState extends Equatable {
  final String appVersion = "";
}

class InitialAboutState extends AboutState {
  @override
  List<Object> get props => [];
}

class AboutLoaded extends AboutState {
  final String appVersion;

  AboutLoaded({this.appVersion});

  @override
  List<Object> get props => [];
}
