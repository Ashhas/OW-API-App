part of 'navigation_bar_bloc.dart';

@immutable
abstract class NavigationBarState extends Equatable {
  final int tabId = 0;
}

class InitialNavigationState extends NavigationBarState {
  @override
  List<Object> get props => [];
}

class ScreenSelected extends NavigationBarState {
  @override
  List<Object> get props => [];
}

class PushedToNewScreen extends NavigationBarState {
  final int tabId;

  PushedToNewScreen({this.tabId});

  @override
  List<Object> get props => [];
}
