part of 'package:ow_api_app/bloc/more/more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();
}

class LoadSavedProfiles extends MoreEvent {
  const LoadSavedProfiles();

  @override
  List<Object> get props => [];
}
