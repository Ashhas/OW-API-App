import 'CompetitiveStats.dart';
import 'Ratings.dart';

class UserProfile {
  CompetitiveStats _competitiveStats;
  int _endorsement;
  String _endorsementIcon;
  int _gamesWon;
  String _icon;
  int _level;
  String _levelIcon;
  String _name;
  int _prestige;
  String _prestigeIcon;
  bool _private;
  CompetitiveStats _quickPlayStats;
  int _rating;
  String _ratingIcon;
  Ratings _ratings;

  Userprofile(
      {CompetitiveStats competitiveStats,
      int endorsement,
      String endorsementIcon,
      int gamesWon,
      String icon,
      int level,
      String levelIcon,
      String name,
      int prestige,
      String prestigeIcon,
      bool private,
      CompetitiveStats quickPlayStats,
      int rating,
      String ratingIcon,
      Ratings ratings}) {
    this._competitiveStats = competitiveStats;
    this._endorsement = endorsement;
    this._endorsementIcon = endorsementIcon;
    this._gamesWon = gamesWon;
    this._icon = icon;
    this._level = level;
    this._levelIcon = levelIcon;
    this._name = name;
    this._prestige = prestige;
    this._prestigeIcon = prestigeIcon;
    this._private = private;
    this._quickPlayStats = quickPlayStats;
    this._rating = rating;
    this._ratingIcon = ratingIcon;
    this._ratings = ratings;
  }

  CompetitiveStats get competitiveStats => _competitiveStats;

  set competitiveStats(CompetitiveStats competitiveStats) =>
      _competitiveStats = competitiveStats;

  int get endorsement => _endorsement;

  set endorsement(int endorsement) => _endorsement = endorsement;

  String get endorsementIcon => _endorsementIcon;

  set endorsementIcon(String endorsementIcon) =>
      _endorsementIcon = endorsementIcon;

  int get gamesWon => _gamesWon;

  set gamesWon(int gamesWon) => _gamesWon = gamesWon;

  String get icon => _icon;

  set icon(String icon) => _icon = icon;

  int get level => _level;

  set level(int level) => _level = level;

  String get levelIcon => _levelIcon;

  set levelIcon(String levelIcon) => _levelIcon = levelIcon;

  String get name => _name;

  set name(String name) => _name = name;

  int get prestige => _prestige;

  set prestige(int prestige) => _prestige = prestige;

  String get prestigeIcon => _prestigeIcon;

  set prestigeIcon(String prestigeIcon) => _prestigeIcon = prestigeIcon;

  bool get private => _private;

  set private(bool private) => _private = private;

  CompetitiveStats get quickPlayStats => _quickPlayStats;

  set quickPlayStats(CompetitiveStats quickPlayStats) =>
      _quickPlayStats = quickPlayStats;

  int get rating => _rating;

  set rating(int rating) => _rating = rating;

  String get ratingIcon => _ratingIcon;

  set ratingIcon(String ratingIcon) => _ratingIcon = ratingIcon;

  Ratings get ratings => _ratings;

  set ratings(Ratings ratings) => _ratings = ratings;

  UserProfile.fromJson(Map<String, dynamic> json) {
    _competitiveStats = json['competitiveStats'] != null
        ? new CompetitiveStats.fromJson(json['competitiveStats'])
        : null;
    _endorsement = json['endorsement'];
    _endorsementIcon = json['endorsementIcon'];
    _gamesWon = json['gamesWon'];
    _icon = json['icon'];
    _level = json['level'];
    _levelIcon = json['levelIcon'];
    _name = json['name'];
    _prestige = json['prestige'];
    _prestigeIcon = json['prestigeIcon'];
    _private = json['private'];
    _quickPlayStats = json['quickPlayStats'] != null
        ? new CompetitiveStats.fromJson(json['quickPlayStats'])
        : null;
    _rating = json['rating'];
    _ratingIcon = json['ratingIcon'];
    _ratings =
        json['ratings'] != null ? new Ratings.fromJson(json['ratings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._competitiveStats != null) {
      data['competitiveStats'] = this._competitiveStats.toJson();
    }
    data['endorsement'] = this._endorsement;
    data['endorsementIcon'] = this._endorsementIcon;
    data['gamesWon'] = this._gamesWon;
    data['icon'] = this._icon;
    data['level'] = this._level;
    data['levelIcon'] = this._levelIcon;
    data['name'] = this._name;
    data['prestige'] = this._prestige;
    data['prestigeIcon'] = this._prestigeIcon;
    data['private'] = this._private;
    if (this._quickPlayStats != null) {
      data['quickPlayStats'] = this._quickPlayStats.toJson();
    }
    data['rating'] = this._rating;
    data['ratingIcon'] = this._ratingIcon;
    if (this._ratings != null) {
      data['ratings'] = this._ratings.toJson();
    }
    return data;
  }
}
