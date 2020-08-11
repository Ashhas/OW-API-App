import 'CompetitiveRole.dart';

class Ratings {
  CompetitiveRole _damage;
  CompetitiveRole _support;
  CompetitiveRole _tank;

  Ratings(
      {CompetitiveRole damage, CompetitiveRole support, CompetitiveRole tank}) {
    this._damage = damage;
    this._support = support;
    this._tank = tank;
  }

  ///Set variable damage-rating
  CompetitiveRole get damage => _damage;
  set damage(CompetitiveRole damage) => _damage = damage;

  ///Set variable support-rating
  CompetitiveRole get support => _support;
  set support(CompetitiveRole support) => _support = support;

  ///Set variable tank-rating
  CompetitiveRole get tank => _tank;
  set tank(CompetitiveRole tank) => _tank = tank;

  Ratings.fromJson(Map<String, dynamic> json) {
    _damage = json['damage'] != null
        ? new CompetitiveRole.fromJson(json['damage'])
        : null;
    _support = json['support'] != null
        ? new CompetitiveRole.fromJson(json['support'])
        : null;
    _tank = json['tank'] != null
        ? new CompetitiveRole.fromJson(json['tank'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._damage != null) {
      data['damage'] = this._damage.toJson();
    }
    if (this._support != null) {
      data['support'] = this._support.toJson();
    }
    if (this._tank != null) {
      data['tank'] = this._tank.toJson();
    }
    return data;
  }
}
