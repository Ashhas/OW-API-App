class Profile {
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

  Profile(
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

  Profile.fromJson(Map<String, dynamic> json) {
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

class CompetitiveStats {
  Awards _awards;
  Games _games;

  CompetitiveStats({Awards awards, Games games}) {
    this._awards = awards;
    this._games = games;
  }

  Awards get awards => _awards;

  set awards(Awards awards) => _awards = awards;

  Games get games => _games;

  set games(Games games) => _games = games;

  CompetitiveStats.fromJson(Map<String, dynamic> json) {
    _awards =
        json['awards'] != null ? new Awards.fromJson(json['awards']) : null;
    _games = json['games'] != null ? new Games.fromJson(json['games']) : null;
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

class Awards {
  int _cards;
  int _medals;
  int _medalsBronze;
  int _medalsSilver;
  int _medalsGold;

  Awards(
      {int cards,
      int medals,
      int medalsBronze,
      int medalsSilver,
      int medalsGold}) {
    this._cards = cards;
    this._medals = medals;
    this._medalsBronze = medalsBronze;
    this._medalsSilver = medalsSilver;
    this._medalsGold = medalsGold;
  }

  int get cards => _cards;

  set cards(int cards) => _cards = cards;

  int get medals => _medals;

  set medals(int medals) => _medals = medals;

  int get medalsBronze => _medalsBronze;

  set medalsBronze(int medalsBronze) => _medalsBronze = medalsBronze;

  int get medalsSilver => _medalsSilver;

  set medalsSilver(int medalsSilver) => _medalsSilver = medalsSilver;

  int get medalsGold => _medalsGold;

  set medalsGold(int medalsGold) => _medalsGold = medalsGold;

  Awards.fromJson(Map<String, dynamic> json) {
    _cards = json['cards'];
    _medals = json['medals'];
    _medalsBronze = json['medalsBronze'];
    _medalsSilver = json['medalsSilver'];
    _medalsGold = json['medalsGold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cards'] = this._cards;
    data['medals'] = this._medals;
    data['medalsBronze'] = this._medalsBronze;
    data['medalsSilver'] = this._medalsSilver;
    data['medalsGold'] = this._medalsGold;
    return data;
  }
}

class Games {
  int _played;
  int _won;

  Games({int played, int won}) {
    this._played = played;
    this._won = won;
  }

  int get played => _played;

  set played(int played) => _played = played;

  int get won => _won;

  set won(int won) => _won = won;

  Games.fromJson(Map<String, dynamic> json) {
    _played = json['played'];
    _won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['played'] = this._played;
    data['won'] = this._won;
    return data;
  }
}

class Ratings {
  GameRole _support;
  GameRole _tank;
  GameRole _damage;

  Ratings({GameRole support, GameRole tank, GameRole damage}) {
    this._support = support;
    this._tank = tank;
    this._damage = damage;
  }

  GameRole get support => _support;

  set support(GameRole support) => _support = support;

  GameRole get tank => _tank;

  set tank(GameRole tank) => _tank = tank;

  GameRole get damage => _damage;

  set damage(GameRole damage) => _damage = damage;

  Ratings.fromJson(Map<String, dynamic> json) {
    _support =
        json['support'] != null ? new GameRole.fromJson(json['support']) : null;
    _tank = json['tank'] != null ? new GameRole.fromJson(json['tank']) : null;
    _damage =
        json['damage'] != null ? new GameRole.fromJson(json['damage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._support != null) {
      data['support'] = this._support.toJson();
    }
    if (this._tank != null) {
      data['tank'] = this._tank.toJson();
    }
    if (this._damage != null) {
      data['damage'] = this._damage.toJson();
    }
    return data;
  }
}

class GameRole {
  int _level;
  String _rankIcon;
  String _roleIcon;

  GameRole({int level, String rankIcon, String roleIcon}) {
    this._level = level;
    this._rankIcon = rankIcon;
    this._roleIcon = roleIcon;
  }

  int get level => _level;

  set level(int level) => _level = level;

  String get rankIcon => _rankIcon;

  set rankIcon(String rankIcon) => _rankIcon = rankIcon;

  String get roleIcon => _roleIcon;

  set roleIcon(String roleIcon) => _roleIcon = roleIcon;

  GameRole.fromJson(Map<String, dynamic> json) {
    _level = json['level'];
    _rankIcon = json['rankIcon'];
    _roleIcon = json['roleIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this._level;
    data['rankIcon'] = this._rankIcon;
    data['roleIcon'] = this._roleIcon;
    return data;
  }
}
