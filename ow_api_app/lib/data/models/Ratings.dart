import 'CompetitiveRole.dart';

class Ratings {
  CompetitiveRole _damage;
  CompetitiveRole _support;

  Ratings({CompetitiveRole damage, CompetitiveRole support}) {
    this._damage = damage;
    this._support = support;
  }

  CompetitiveRole get damage => _damage;

  set damage(CompetitiveRole damage) => _damage = damage;

  CompetitiveRole get support => _support;

  set support(CompetitiveRole support) => _support = support;

  Ratings.fromJson(Map<String, dynamic> json) {
    _damage = json['damage'] != null
        ? new CompetitiveRole.fromJson(json['damage'])
        : null;
    _support = json['support'] != null
        ? new CompetitiveRole.fromJson(json['support'])
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
    return data;
  }
}
