import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';

class AboutCubit extends Cubit {
  AboutCubit(initialState) : super(initialState);

  Future<String> getAppInformation() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
