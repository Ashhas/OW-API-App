import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(Uninitialized());

  @override
  Stream<InitializationState> mapEventToState(
      InitializationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedEventToState();
    }
  }

  Stream<InitializationState> _mapAppStartedEventToState() async* {
    //Creating NavBar Controller
    PersistentTabController navBarController =
    PersistentTabController(initialIndex: 0);

    //Delay for Splash Screen
    await Future.delayed(Duration(seconds: 1));

    //Initializing and open Hive DB
    await Hive.initFlutter();
    Hive.registerAdapter(AccountModelAdapter());

    //Create Fake Data
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Box _profileBox = await Hive.openBox('accountBox');

    var account1 =
    AccountModel(1, "Ashhas#2396", "Ashhas", "pc", DateTime.now());
    _profileBox.add(account1);
    var account2 =
    AccountModel(6, "JetLiTe#2341", "JetLiTe", "pc", DateTime.now());
    _profileBox.add(account2);
    var account3 =
    AccountModel(3, "Mjolnir#21534", "Mjolnir", "pc", DateTime.now());
    _profileBox.add(account3);
    var account4 =
    AccountModel(2, "Venomflash#2745", "Venomflash", "pc", DateTime.now());
    _profileBox.add(account4);
    var account5 =
    AccountModel(7, "JMPJNS#2306", "JMPJNS", "pc", DateTime.now());
    _profileBox.add(account5);

    yield Initialized(navBarController: navBarController);
  }
}
