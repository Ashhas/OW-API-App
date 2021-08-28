part of 'navigation_bar_bloc.dart';

@immutable
abstract class NavigationBarEvent extends Equatable {}

class NavigateToScreen extends NavigationBarEvent {
  final int selectedIndex;

  NavigateToScreen({this.selectedIndex});

  @override
  List<Object> get props => [];
}
