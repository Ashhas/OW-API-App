part of 'main_account_bloc.dart';

@immutable
abstract class MainAccountState extends Equatable {}

class InitialMainAccountState extends MainAccountState {
  @override
  List<Object> get props => [];
}

class AccountDataLoaded extends MainAccountState {
  final Box allAccountBox;

  AccountDataLoaded({
    @required this.allAccountBox,
  });

  @override
  List<Object> get props => [];
}
