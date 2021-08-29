part of 'about_bloc.dart';

@immutable
abstract class AboutEvent extends Equatable {}

class LoadAboutData extends AboutEvent {
  @override
  List<Object> get props => [];
}
