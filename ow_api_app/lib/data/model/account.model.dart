import 'package:hive/hive.dart';

part 'account.model.g.dart';

@HiveType(typeId: 0)
class AccountModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String battleNetId;
  @HiveField(2)
  String battleNetName;
  @HiveField(3)
  String platformId;
  @HiveField(4)
  DateTime latestRefresh;

  AccountModel(this.id, this.battleNetId, this.battleNetName, this.platformId,
      this.latestRefresh);
}
