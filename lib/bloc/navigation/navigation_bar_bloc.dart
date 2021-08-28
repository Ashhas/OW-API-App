import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_event.dart';

part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(InitialNavigationState());

  @override
  Stream<NavigationBarState> mapEventToState(NavigationBarEvent event) async* {
    if (event is NavigateToScreen) {
      yield* _mapNavigateToScreenToState(event, state);
    }
  }

  Stream<NavigationBarState> _mapNavigateToScreenToState(
      NavigateToScreen event, NavigationBarState state) async* {
    yield ScreenSelected();
    yield PushedToNewScreen(tabId: event.selectedIndex);
  }
}
