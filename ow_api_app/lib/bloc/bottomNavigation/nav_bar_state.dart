import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NavBarState extends Equatable{
  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends NavBarState{
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex});

  @override
  String toString() => 'Nav Bar State => Current Index Change to $currentIndex';
}

class PageLoading extends NavBarState{
  @override
  String toString() => 'Nav Bar State => Page Loading';
}

class FirstPageLoaded extends NavBarState{
  @override
  String toString() => 'Nav Bar State => First Page Loaded';
}

class SecondPageLoaded extends NavBarState {
  @override
  String toString() => 'Nav Bar State => Second Page Loaded';
}