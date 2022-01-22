part of 'main_account_bloc.dart';

@immutable
abstract class MainAccountEvent extends Equatable {}

class LoadAccountData extends MainAccountEvent {
  @override
  List<Object> get props => [];
}

class SaveMainAccount extends MainAccountEvent {
  final String battleNetId;
  final String platformId;

  SaveMainAccount({@required this.battleNetId, @required this.platformId});

  @override
  List<Object> get props => [battleNetId];
}
