import 'package:equatable/equatable.dart';

abstract class NavBarEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class HomeStarted extends NavBarEvent{
  @override
  String toString() => 'Event App Started';
}

class MenuTapped extends NavBarEvent{
  final int index;

  MenuTapped({this.index});

  @override
  String toString() => 'Event Menu Tapped Index: $index';
}