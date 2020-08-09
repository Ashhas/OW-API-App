import 'AllGames.dart';
import 'Awards.dart';

class CompetitiveStats {
  Awards _awards;
  AllGames _games;

  CompetitiveStats({Awards awards, AllGames games}) {
    this._awards = awards;
    this._games = games;
  }

  Awards get awards => _awards;

  set awards(Awards awards) => _awards = awards;

  AllGames get games => _games;

  set games(AllGames games) => _games = games;

  CompetitiveStats.fromJson(Map<String, dynamic> json) {
    _awards =
        json['awards'] != null ? new Awards.fromJson(json['awards']) : null;
    _games =
        json['games'] != null ? new AllGames.fromJson(json['games']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._awards != null) {
      data['awards'] = this._awards.toJson();
    }
    if (this._games != null) {
      data['games'] = this._games.toJson();
    }
    return data;
  }
}
