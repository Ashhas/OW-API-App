part of 'main_account_bloc.dart';

@immutable
abstract class MainAccountState extends Equatable {}

class InitialMainAccountState extends MainAccountState {
  @override
  List<Object> get props => [];
}

class AccountDataLoaded extends MainAccountState {
  final Box allAccountBox;
  final String mainAccount;

  AccountDataLoaded({
    @required this.allAccountBox,
    @required this.mainAccount,
  });

  @override
  List<Object> get props => [];
}
