import 'package:ow_api_app/util/strings.dart';

class Profile {
  CompetitiveStats _competitiveStats;
  QuickPlayStats _quickPlayStats;
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
      QuickPlayStats quickPlayStats,
      int rating,
      String ratingIcon,
      Ratings ratings}) {
    this._competitiveStats = competitiveStats;
    this._quickPlayStats = quickPlayStats;
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

  QuickPlayStats get quickPlayStats => _quickPlayStats;

  set quickPlayStats(QuickPlayStats quickPlayStats) =>
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
        ? new QuickPlayStats.fromJson(json['quickPlayStats'])
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
  CareerStats _careerStats;
  Games _games;
  TopHeroes _topHeroes;

  CompetitiveStats(
      {Awards awards,
      CareerStats careerStats,
      Games games,
      TopHeroes topHeroes}) {
    this._awards = awards;
    this._careerStats = careerStats;
    this._games = games;
    this._topHeroes = topHeroes;
  }

  Awards get awards => _awards;

  set awards(Awards awards) => _awards = awards;

  CareerStats get careerStats => _careerStats;

  set careerStats(CareerStats careerStats) => _careerStats = careerStats;

  Games get games => _games;

  set games(Games games) => _games = games;

  TopHeroes get topHeroes => _topHeroes;

  set topHeroes(TopHeroes topHeroes) => _topHeroes = topHeroes;

  CompetitiveStats.fromJson(Map<String, dynamic> json) {
    _awards =
        json['awards'] != null ? new Awards.fromJson(json['awards']) : null;
    _careerStats = json['careerStats'] != null
        ? new CareerStats.fromJson(json['careerStats'])
        : null;
    _games = json['games'] != null ? new Games.fromJson(json['games']) : null;
    _topHeroes = json['topHeroes'] != null
        ? new TopHeroes.fromJson(json['topHeroes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._awards != null) {
      data['awards'] = this._awards.toJson();
    }
    if (this._careerStats != null) {
      data['careerStats'] = this._careerStats.toJson();
    }
    if (this._games != null) {
      data['game'] = this._games.toJson();
    }
    if (this._topHeroes != null) {
      data['topHeroes'] = this._topHeroes.toJson();
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

class CareerStats {
  AllHeroes _allHeroes;

  CareerStats({
    AllHeroes allHeroes,
  }) {
    this._allHeroes = allHeroes;
  }

  AllHeroes get allHeroes => _allHeroes;

  set allHeroes(AllHeroes allHeroes) => _allHeroes = allHeroes;

  CareerStats.fromJson(Map<String, dynamic> json) {
    _allHeroes = json['allHeroes'] != null
        ? new AllHeroes.fromJson(json['allHeroes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._allHeroes != null) {
      data['allHeroes'] = this._allHeroes.toJson();
    }
    return data;
  }
}

class AllHeroes {
  Assists _assists;
  Average _average;
  Best _best;
  Combat _combat;
  Null _deaths;
  Null _heroSpecific;
  Game _game;
  MatchAwards _matchAwards;
  Miscellaneous _miscellaneous;

  AllHeroes(
      {Assists assists,
      Average average,
      Best best,
      Combat combat,
      Null deaths,
      Null heroSpecific,
      Game game,
      MatchAwards matchAwards,
      Miscellaneous miscellaneous}) {
    this._assists = assists;
    this._average = average;
    this._best = best;
    this._combat = combat;
    this._deaths = deaths;
    this._heroSpecific = heroSpecific;
    this._game = game;
    this._matchAwards = matchAwards;
    this._miscellaneous = miscellaneous;
  }

  Assists get assists => _assists;

  set assists(Assists assists) => _assists = assists;

  Average get average => _average;

  set average(Average average) => _average = average;

  Best get best => _best;

  set best(Best best) => _best = best;

  Combat get combat => _combat;

  set combat(Combat combat) => _combat = combat;

  Null get deaths => _deaths;

  set deaths(Null deaths) => _deaths = deaths;

  Null get heroSpecific => _heroSpecific;

  set heroSpecific(Null heroSpecific) => _heroSpecific = heroSpecific;

  Game get game => _game;

  set game(Game game) => _game = game;

  MatchAwards get matchAwards => _matchAwards;

  set matchAwards(MatchAwards matchAwards) => _matchAwards = matchAwards;

  Miscellaneous get miscellaneous => _miscellaneous;

  set miscellaneous(Miscellaneous miscellaneous) =>
      _miscellaneous = miscellaneous;

  AllHeroes.fromJson(Map<String, dynamic> json) {
    _assists =
        json['assists'] != null ? new Assists.fromJson(json['assists']) : null;
    _average =
        json['average'] != null ? new Average.fromJson(json['average']) : null;
    _best = json['best'] != null ? new Best.fromJson(json['best']) : null;
    _combat =
        json['combat'] != null ? new Combat.fromJson(json['combat']) : null;
    _deaths = json['deaths'];
    _heroSpecific = json['heroSpecific'];
    _game = json['game'] != null ? new Game.fromJson(json['game']) : null;
    _matchAwards = json['matchAwards'] != null
        ? new MatchAwards.fromJson(json['matchAwards'])
        : null;
    _miscellaneous = json['miscellaneous'] != null
        ? new Miscellaneous.fromJson(json['miscellaneous'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._assists != null) {
      data['assists'] = this._assists.toJson();
    }
    if (this._average != null) {
      data['average'] = this._average.toJson();
    }
    if (this._best != null) {
      data['best'] = this._best.toJson();
    }
    if (this._combat != null) {
      data['combat'] = this._combat.toJson();
    }
    data['deaths'] = this._deaths;
    data['heroSpecific'] = this._heroSpecific;
    if (this._game != null) {
      data['game'] = this._game.toJson();
    }
    if (this._matchAwards != null) {
      data['matchAwards'] = this._matchAwards.toJson();
    }
    if (this._miscellaneous != null) {
      data['miscellaneous'] = this._miscellaneous.toJson();
    }
    return data;
  }
}

class Assists {
  int _defensiveAssists;
  int _healingDone;
  int _offensiveAssists;

  Assists({int defensiveAssists, int healingDone, int offensiveAssists}) {
    this._defensiveAssists = defensiveAssists;
    this._healingDone = healingDone;
    this._offensiveAssists = offensiveAssists;
  }

  int get defensiveAssists => _defensiveAssists;

  set defensiveAssists(int defensiveAssists) =>
      _defensiveAssists = defensiveAssists;

  int get healingDone => _healingDone;

  set healingDone(int healingDone) => _healingDone = healingDone;

  int get offensiveAssists => _offensiveAssists;

  set offensiveAssists(int offensiveAssists) =>
      _offensiveAssists = offensiveAssists;

  Assists.fromJson(Map<String, dynamic> json) {
    _defensiveAssists = json['defensiveAssists'];
    _healingDone = json['healingDone'];
    _offensiveAssists = json['offensiveAssists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defensiveAssists'] = this._defensiveAssists;
    data['healingDone'] = this._healingDone;
    data['offensiveAssists'] = this._offensiveAssists;
    return data;
  }
}

class Average {
  int _allDamageDoneAvgPer10Min;
  int _barrierDamageDoneAvgPer10Min;
  double _deathsAvgPer10Min;
  double _eliminationsAvgPer10Min;
  double _finalBlowsAvgPer10Min;
  int _healingDoneAvgPer10Min;
  int _heroDamageDoneAvgPer10Min;
  double _objectiveKillsAvgPer10Min;
  String _objectiveTimeAvgPer10Min;
  double _soloKillsAvgPer10Min;
  String _timeSpentOnFireAvgPer10Min;

  Average(
      {int allDamageDoneAvgPer10Min,
      int barrierDamageDoneAvgPer10Min,
      double deathsAvgPer10Min,
      double eliminationsAvgPer10Min,
      double finalBlowsAvgPer10Min,
      int healingDoneAvgPer10Min,
      int heroDamageDoneAvgPer10Min,
      double objectiveKillsAvgPer10Min,
      String objectiveTimeAvgPer10Min,
      double soloKillsAvgPer10Min,
      String timeSpentOnFireAvgPer10Min}) {
    this._allDamageDoneAvgPer10Min = allDamageDoneAvgPer10Min;
    this._barrierDamageDoneAvgPer10Min = barrierDamageDoneAvgPer10Min;
    this._deathsAvgPer10Min = deathsAvgPer10Min;
    this._eliminationsAvgPer10Min = eliminationsAvgPer10Min;
    this._finalBlowsAvgPer10Min = finalBlowsAvgPer10Min;
    this._healingDoneAvgPer10Min = healingDoneAvgPer10Min;
    this._heroDamageDoneAvgPer10Min = heroDamageDoneAvgPer10Min;
    this._objectiveKillsAvgPer10Min = objectiveKillsAvgPer10Min;
    this._objectiveTimeAvgPer10Min = objectiveTimeAvgPer10Min;
    this._soloKillsAvgPer10Min = soloKillsAvgPer10Min;
    this._timeSpentOnFireAvgPer10Min = timeSpentOnFireAvgPer10Min;
  }

  int get allDamageDoneAvgPer10Min => _allDamageDoneAvgPer10Min;

  set allDamageDoneAvgPer10Min(int allDamageDoneAvgPer10Min) =>
      _allDamageDoneAvgPer10Min = allDamageDoneAvgPer10Min;

  int get barrierDamageDoneAvgPer10Min => _barrierDamageDoneAvgPer10Min;

  set barrierDamageDoneAvgPer10Min(int barrierDamageDoneAvgPer10Min) =>
      _barrierDamageDoneAvgPer10Min = barrierDamageDoneAvgPer10Min;

  double get deathsAvgPer10Min => _deathsAvgPer10Min;

  set deathsAvgPer10Min(double deathsAvgPer10Min) =>
      _deathsAvgPer10Min = deathsAvgPer10Min;

  double get eliminationsAvgPer10Min => _eliminationsAvgPer10Min;

  set eliminationsAvgPer10Min(double eliminationsAvgPer10Min) =>
      _eliminationsAvgPer10Min = eliminationsAvgPer10Min;

  double get finalBlowsAvgPer10Min => _finalBlowsAvgPer10Min;

  set finalBlowsAvgPer10Min(double finalBlowsAvgPer10Min) =>
      _finalBlowsAvgPer10Min = finalBlowsAvgPer10Min;

  int get healingDoneAvgPer10Min => _healingDoneAvgPer10Min;

  set healingDoneAvgPer10Min(int healingDoneAvgPer10Min) =>
      _healingDoneAvgPer10Min = healingDoneAvgPer10Min;

  int get heroDamageDoneAvgPer10Min => _heroDamageDoneAvgPer10Min;

  set heroDamageDoneAvgPer10Min(int heroDamageDoneAvgPer10Min) =>
      _heroDamageDoneAvgPer10Min = heroDamageDoneAvgPer10Min;

  double get objectiveKillsAvgPer10Min => _objectiveKillsAvgPer10Min;

  set objectiveKillsAvgPer10Min(double objectiveKillsAvgPer10Min) =>
      _objectiveKillsAvgPer10Min = objectiveKillsAvgPer10Min;

  String get objectiveTimeAvgPer10Min => _objectiveTimeAvgPer10Min;

  set objectiveTimeAvgPer10Min(String objectiveTimeAvgPer10Min) =>
      _objectiveTimeAvgPer10Min = objectiveTimeAvgPer10Min;

  double get soloKillsAvgPer10Min => _soloKillsAvgPer10Min;

  set soloKillsAvgPer10Min(double soloKillsAvgPer10Min) =>
      _soloKillsAvgPer10Min = soloKillsAvgPer10Min;

  String get timeSpentOnFireAvgPer10Min => _timeSpentOnFireAvgPer10Min;

  set timeSpentOnFireAvgPer10Min(String timeSpentOnFireAvgPer10Min) =>
      _timeSpentOnFireAvgPer10Min = timeSpentOnFireAvgPer10Min;

  Average.fromJson(Map<String, dynamic> json) {
    _allDamageDoneAvgPer10Min = json['allDamageDoneAvgPer10Min'];
    _barrierDamageDoneAvgPer10Min = json['barrierDamageDoneAvgPer10Min'];
    _deathsAvgPer10Min = json['deathsAvgPer10Min'];
    _eliminationsAvgPer10Min = json['eliminationsAvgPer10Min'];
    _finalBlowsAvgPer10Min = json['finalBlowsAvgPer10Min'];
    _healingDoneAvgPer10Min = json['healingDoneAvgPer10Min'];
    _heroDamageDoneAvgPer10Min = json['heroDamageDoneAvgPer10Min'];
    _objectiveKillsAvgPer10Min = json['objectiveKillsAvgPer10Min'];
    _objectiveTimeAvgPer10Min = json['objectiveTimeAvgPer10Min'];
    _soloKillsAvgPer10Min = json['soloKillsAvgPer10Min'];
    _timeSpentOnFireAvgPer10Min = json['timeSpentOnFireAvgPer10Min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allDamageDoneAvgPer10Min'] = this._allDamageDoneAvgPer10Min;
    data['barrierDamageDoneAvgPer10Min'] = this._barrierDamageDoneAvgPer10Min;
    data['deathsAvgPer10Min'] = this._deathsAvgPer10Min;
    data['eliminationsAvgPer10Min'] = this._eliminationsAvgPer10Min;
    data['finalBlowsAvgPer10Min'] = this._finalBlowsAvgPer10Min;
    data['healingDoneAvgPer10Min'] = this._healingDoneAvgPer10Min;
    data['heroDamageDoneAvgPer10Min'] = this._heroDamageDoneAvgPer10Min;
    data['objectiveKillsAvgPer10Min'] = this._objectiveKillsAvgPer10Min;
    data['objectiveTimeAvgPer10Min'] = this._objectiveTimeAvgPer10Min;
    data['soloKillsAvgPer10Min'] = this._soloKillsAvgPer10Min;
    data['timeSpentOnFireAvgPer10Min'] = this._timeSpentOnFireAvgPer10Min;
    return data;
  }
}

class Best {
  int _allDamageDoneMostInGame;
  int _barrierDamageDoneMostInGame;
  int _defensiveAssistsMostInGame;
  int _eliminationsMostInGame;
  int _environmentalKillsMostInGame;
  int _finalBlowsMostInGame;
  int _healingDoneMostInGame;
  int _heroDamageDoneMostInGame;
  int _killsStreakBest;
  int _meleeFinalBlowsMostInGame;
  int _multikillsBest;
  int _objectiveKillsMostInGame;
  String _objectiveTimeMostInGame;
  int _offensiveAssistsMostInGame;
  int _soloKillsMostInGame;
  String _timeSpentOnFireMostInGame;
  int _turretsDestroyedMostInGame;

  Best(
      {int allDamageDoneMostInGame,
      int barrierDamageDoneMostInGame,
      int defensiveAssistsMostInGame,
      int eliminationsMostInGame,
      int environmentalKillsMostInGame,
      int finalBlowsMostInGame,
      int healingDoneMostInGame,
      int heroDamageDoneMostInGame,
      int killsStreakBest,
      int meleeFinalBlowsMostInGame,
      int multikillsBest,
      int objectiveKillsMostInGame,
      String objectiveTimeMostInGame,
      int offensiveAssistsMostInGame,
      int soloKillsMostInGame,
      String timeSpentOnFireMostInGame,
      int turretsDestroyedMostInGame}) {
    this._allDamageDoneMostInGame = allDamageDoneMostInGame;
    this._barrierDamageDoneMostInGame = barrierDamageDoneMostInGame;
    this._defensiveAssistsMostInGame = defensiveAssistsMostInGame;
    this._eliminationsMostInGame = eliminationsMostInGame;
    this._environmentalKillsMostInGame = environmentalKillsMostInGame;
    this._finalBlowsMostInGame = finalBlowsMostInGame;
    this._healingDoneMostInGame = healingDoneMostInGame;
    this._heroDamageDoneMostInGame = heroDamageDoneMostInGame;
    this._killsStreakBest = killsStreakBest;
    this._meleeFinalBlowsMostInGame = meleeFinalBlowsMostInGame;
    this._multikillsBest = multikillsBest;
    this._objectiveKillsMostInGame = objectiveKillsMostInGame;
    this._objectiveTimeMostInGame = objectiveTimeMostInGame;
    this._offensiveAssistsMostInGame = offensiveAssistsMostInGame;
    this._soloKillsMostInGame = soloKillsMostInGame;
    this._timeSpentOnFireMostInGame = timeSpentOnFireMostInGame;
    this._turretsDestroyedMostInGame = turretsDestroyedMostInGame;
  }

  int get allDamageDoneMostInGame => _allDamageDoneMostInGame;

  set allDamageDoneMostInGame(int allDamageDoneMostInGame) =>
      _allDamageDoneMostInGame = allDamageDoneMostInGame;

  int get barrierDamageDoneMostInGame => _barrierDamageDoneMostInGame;

  set barrierDamageDoneMostInGame(int barrierDamageDoneMostInGame) =>
      _barrierDamageDoneMostInGame = barrierDamageDoneMostInGame;

  int get defensiveAssistsMostInGame => _defensiveAssistsMostInGame;

  set defensiveAssistsMostInGame(int defensiveAssistsMostInGame) =>
      _defensiveAssistsMostInGame = defensiveAssistsMostInGame;

  int get eliminationsMostInGame => _eliminationsMostInGame;

  set eliminationsMostInGame(int eliminationsMostInGame) =>
      _eliminationsMostInGame = eliminationsMostInGame;

  int get environmentalKillsMostInGame => _environmentalKillsMostInGame;

  set environmentalKillsMostInGame(int environmentalKillsMostInGame) =>
      _environmentalKillsMostInGame = environmentalKillsMostInGame;

  int get finalBlowsMostInGame => _finalBlowsMostInGame;

  set finalBlowsMostInGame(int finalBlowsMostInGame) =>
      _finalBlowsMostInGame = finalBlowsMostInGame;

  int get healingDoneMostInGame => _healingDoneMostInGame;

  set healingDoneMostInGame(int healingDoneMostInGame) =>
      _healingDoneMostInGame = healingDoneMostInGame;

  int get heroDamageDoneMostInGame => _heroDamageDoneMostInGame;

  set heroDamageDoneMostInGame(int heroDamageDoneMostInGame) =>
      _heroDamageDoneMostInGame = heroDamageDoneMostInGame;

  int get killsStreakBest => _killsStreakBest;

  set killsStreakBest(int killsStreakBest) =>
      _killsStreakBest = killsStreakBest;

  int get meleeFinalBlowsMostInGame => _meleeFinalBlowsMostInGame;

  set meleeFinalBlowsMostInGame(int meleeFinalBlowsMostInGame) =>
      _meleeFinalBlowsMostInGame = meleeFinalBlowsMostInGame;

  int get multikillsBest => _multikillsBest;

  set multikillsBest(int multikillsBest) => _multikillsBest = multikillsBest;

  int get objectiveKillsMostInGame => _objectiveKillsMostInGame;

  set objectiveKillsMostInGame(int objectiveKillsMostInGame) =>
      _objectiveKillsMostInGame = objectiveKillsMostInGame;

  String get objectiveTimeMostInGame => _objectiveTimeMostInGame;

  set objectiveTimeMostInGame(String objectiveTimeMostInGame) =>
      _objectiveTimeMostInGame = objectiveTimeMostInGame;

  int get offensiveAssistsMostInGame => _offensiveAssistsMostInGame;

  set offensiveAssistsMostInGame(int offensiveAssistsMostInGame) =>
      _offensiveAssistsMostInGame = offensiveAssistsMostInGame;

  int get soloKillsMostInGame => _soloKillsMostInGame;

  set soloKillsMostInGame(int soloKillsMostInGame) =>
      _soloKillsMostInGame = soloKillsMostInGame;

  String get timeSpentOnFireMostInGame => _timeSpentOnFireMostInGame;

  set timeSpentOnFireMostInGame(String timeSpentOnFireMostInGame) =>
      _timeSpentOnFireMostInGame = timeSpentOnFireMostInGame;

  int get turretsDestroyedMostInGame => _turretsDestroyedMostInGame;

  set turretsDestroyedMostInGame(int turretsDestroyedMostInGame) =>
      _turretsDestroyedMostInGame = turretsDestroyedMostInGame;

  Best.fromJson(Map<String, dynamic> json) {
    _allDamageDoneMostInGame = json['allDamageDoneMostInGame'];
    _barrierDamageDoneMostInGame = json['barrierDamageDoneMostInGame'];
    _defensiveAssistsMostInGame = json['defensiveAssistsMostInGame'];
    _eliminationsMostInGame = json['eliminationsMostInGame'];
    _environmentalKillsMostInGame = json['environmentalKillsMostInGame'];
    _finalBlowsMostInGame = json['finalBlowsMostInGame'];
    _healingDoneMostInGame = json['healingDoneMostInGame'];
    _heroDamageDoneMostInGame = json['heroDamageDoneMostInGame'];
    _killsStreakBest = json['killsStreakBest'];
    _meleeFinalBlowsMostInGame = json['meleeFinalBlowsMostInGame'];
    _multikillsBest = json['multikillsBest'];
    _objectiveKillsMostInGame = json['objectiveKillsMostInGame'];
    _objectiveTimeMostInGame = json['objectiveTimeMostInGame'];
    _offensiveAssistsMostInGame = json['offensiveAssistsMostInGame'];
    _soloKillsMostInGame = json['soloKillsMostInGame'];
    _timeSpentOnFireMostInGame = json['timeSpentOnFireMostInGame'];
    _turretsDestroyedMostInGame = json['turretsDestroyedMostInGame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allDamageDoneMostInGame'] = this._allDamageDoneMostInGame;
    data['barrierDamageDoneMostInGame'] = this._barrierDamageDoneMostInGame;
    data['defensiveAssistsMostInGame'] = this._defensiveAssistsMostInGame;
    data['eliminationsMostInGame'] = this._eliminationsMostInGame;
    data['environmentalKillsMostInGame'] = this._environmentalKillsMostInGame;
    data['finalBlowsMostInGame'] = this._finalBlowsMostInGame;
    data['healingDoneMostInGame'] = this._healingDoneMostInGame;
    data['heroDamageDoneMostInGame'] = this._heroDamageDoneMostInGame;
    data['killsStreakBest'] = this._killsStreakBest;
    data['meleeFinalBlowsMostInGame'] = this._meleeFinalBlowsMostInGame;
    data['multikillsBest'] = this._multikillsBest;
    data['objectiveKillsMostInGame'] = this._objectiveKillsMostInGame;
    data['objectiveTimeMostInGame'] = this._objectiveTimeMostInGame;
    data['offensiveAssistsMostInGame'] = this._offensiveAssistsMostInGame;
    data['soloKillsMostInGame'] = this._soloKillsMostInGame;
    data['timeSpentOnFireMostInGame'] = this._timeSpentOnFireMostInGame;
    data['turretsDestroyedMostInGame'] = this._turretsDestroyedMostInGame;
    return data;
  }
}

class Combat {
  int _barrierDamageDone;
  int _damageDone;
  int _deaths;
  int _eliminations;
  int _environmentalKills;
  int _finalBlows;
  int _heroDamageDone;
  int _meleeFinalBlows;
  int _multikills;
  int _objectiveKills;
  String _objectiveTime;
  int _soloKills;
  String _timeSpentOnFire;

  Combat(
      {int barrierDamageDone,
      int damageDone,
      int deaths,
      int eliminations,
      int environmentalKills,
      int finalBlows,
      int heroDamageDone,
      int meleeFinalBlows,
      int multikills,
      int objectiveKills,
      String objectiveTime,
      int soloKills,
      String timeSpentOnFire}) {
    this._barrierDamageDone = barrierDamageDone;
    this._damageDone = damageDone;
    this._deaths = deaths;
    this._eliminations = eliminations;
    this._environmentalKills = environmentalKills;
    this._finalBlows = finalBlows;
    this._heroDamageDone = heroDamageDone;
    this._meleeFinalBlows = meleeFinalBlows;
    this._multikills = multikills;
    this._objectiveKills = objectiveKills;
    this._objectiveTime = objectiveTime;
    this._soloKills = soloKills;
    this._timeSpentOnFire = timeSpentOnFire;
  }

  int get barrierDamageDone => _barrierDamageDone;

  set barrierDamageDone(int barrierDamageDone) =>
      _barrierDamageDone = barrierDamageDone;

  int get damageDone => _damageDone;

  set damageDone(int damageDone) => _damageDone = damageDone;

  int get deaths => _deaths;

  set deaths(int deaths) => _deaths = deaths;

  int get eliminations => _eliminations;

  set eliminations(int eliminations) => _eliminations = eliminations;

  int get environmentalKills => _environmentalKills;

  set environmentalKills(int environmentalKills) =>
      _environmentalKills = environmentalKills;

  int get finalBlows => _finalBlows;

  set finalBlows(int finalBlows) => _finalBlows = finalBlows;

  int get heroDamageDone => _heroDamageDone;

  set heroDamageDone(int heroDamageDone) => _heroDamageDone = heroDamageDone;

  int get meleeFinalBlows => _meleeFinalBlows;

  set meleeFinalBlows(int meleeFinalBlows) =>
      _meleeFinalBlows = meleeFinalBlows;

  int get multikills => _multikills;

  set multikills(int multikills) => _multikills = multikills;

  int get objectiveKills => _objectiveKills;

  set objectiveKills(int objectiveKills) => _objectiveKills = objectiveKills;

  String get objectiveTime => _objectiveTime;

  set objectiveTime(String objectiveTime) => _objectiveTime = objectiveTime;

  int get soloKills => _soloKills;

  set soloKills(int soloKills) => _soloKills = soloKills;

  String get timeSpentOnFire => _timeSpentOnFire;

  set timeSpentOnFire(String timeSpentOnFire) =>
      _timeSpentOnFire = timeSpentOnFire;

  Combat.fromJson(Map<String, dynamic> json) {
    _barrierDamageDone = json['barrierDamageDone'];
    _damageDone = json['damageDone'];
    _deaths = json['deaths'];
    _eliminations = json['eliminations'];
    _environmentalKills = json['environmentalKills'];
    _finalBlows = json['finalBlows'];
    _heroDamageDone = json['heroDamageDone'];
    _meleeFinalBlows = json['meleeFinalBlows'];
    _multikills = json['multikills'];
    _objectiveKills = json['objectiveKills'];
    _objectiveTime = json['objectiveTime'];
    _soloKills = json['soloKills'];
    _timeSpentOnFire = json['timeSpentOnFire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barrierDamageDone'] = this._barrierDamageDone;
    data['damageDone'] = this._damageDone;
    data['deaths'] = this._deaths;
    data['eliminations'] = this._eliminations;
    data['environmentalKills'] = this._environmentalKills;
    data['finalBlows'] = this._finalBlows;
    data['heroDamageDone'] = this._heroDamageDone;
    data['meleeFinalBlows'] = this._meleeFinalBlows;
    data['multikills'] = this._multikills;
    data['objectiveKills'] = this._objectiveKills;
    data['objectiveTime'] = this._objectiveTime;
    data['soloKills'] = this._soloKills;
    data['timeSpentOnFire'] = this._timeSpentOnFire;
    return data;
  }
}

class Game {
  int _gamesLost;
  int _gamesPlayed;
  int _gamesTied;
  int _gamesWon;
  DateTime _timePlayed;

  Game(
      {int gamesLost,
      int gamesPlayed,
      int gamesTied,
      int gamesWon,
      DateTime timePlayed}) {
    this._gamesLost = gamesLost;
    this._gamesPlayed = gamesPlayed;
    this._gamesTied = gamesTied;
    this._gamesWon = gamesWon;
    this._timePlayed = timePlayed;
  }

  int get gamesLost => _gamesLost;

  set gamesLost(int gamesLost) => _gamesLost = gamesLost;

  int get gamesPlayed => _gamesPlayed;

  set gamesPlayed(int gamesPlayed) => _gamesPlayed = gamesPlayed;

  int get gamesTied => _gamesTied;

  set gamesTied(int gamesTied) => _gamesTied = gamesTied;

  int get gamesWon => _gamesWon;

  set gamesWon(int gamesWon) => _gamesWon = gamesWon;

  DateTime get timePlayed => _timePlayed;

  set timePlayed(DateTime timePlayed) => _timePlayed = timePlayed;

  Game.fromJson(Map<String, dynamic> json) {
    _gamesLost = json['gamesLost'];
    _gamesPlayed = json['gamesPlayed'];
    _gamesTied = json['gamesTied'];
    _gamesWon = json['gamesWon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gamesLost'] = this._gamesLost;
    data['gamesPlayed'] = this._gamesPlayed;
    data['gamesTied'] = this._gamesTied;
    data['gamesWon'] = this._gamesWon;
    data['timePlayed'] = this._timePlayed;
    return data;
  }
}

class MatchAwards {
  int _medals;
  int _medalsGold;
  int _medalsSilver;

  MatchAwards({int medals, int medalsGold, int medalsSilver}) {
    this._medals = medals;
    this._medalsGold = medalsGold;
    this._medalsSilver = medalsSilver;
  }

  int get medals => _medals;

  set medals(int medals) => _medals = medals;

  int get medalsGold => _medalsGold;

  set medalsGold(int medalsGold) => _medalsGold = medalsGold;

  int get medalsSilver => _medalsSilver;

  set medalsSilver(int medalsSilver) => _medalsSilver = medalsSilver;

  MatchAwards.fromJson(Map<String, dynamic> json) {
    _medals = json['medals'];
    _medalsGold = json['medalsGold'];
    _medalsSilver = json['medalsSilver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medals'] = this._medals;
    data['medalsGold'] = this._medalsGold;
    data['medalsSilver'] = this._medalsSilver;
    return data;
  }
}

class Miscellaneous {
  int _turretsDestroyed;

  Miscellaneous({int turretsDestroyed}) {
    this._turretsDestroyed = turretsDestroyed;
  }

  int get turretsDestroyed => _turretsDestroyed;

  set turretsDestroyed(int turretsDestroyed) =>
      _turretsDestroyed = turretsDestroyed;

  Miscellaneous.fromJson(Map<String, dynamic> json) {
    _turretsDestroyed = json['turretsDestroyed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['turretsDestroyed'] = this._turretsDestroyed;
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

class TopHeroes {
  TopHero _ana;
  TopHero _ashe;
  TopHero _baptiste;
  TopHero _bastion;
  TopHero _brigitte;
  TopHero _dVa;
  TopHero _doomfist;
  TopHero _echo;
  TopHero _genji;
  TopHero _hanzo;
  TopHero _junkrat;
  TopHero _lucio;
  TopHero _mccree;
  TopHero _mei;
  TopHero _mercy;
  TopHero _moira;
  TopHero _orisa;
  TopHero _pharah;
  TopHero _reaper;
  TopHero _reinhardt;
  TopHero _roadhog;
  TopHero _sigma;
  TopHero _soldier76;
  TopHero _sombra;
  TopHero _symmetra;
  TopHero _torbjorn;
  TopHero _tracer;
  TopHero _widowmaker;
  TopHero _winston;
  TopHero _wreckingBall;
  TopHero _zarya;
  TopHero _zenyatta;

  TopHeroes(
      {TopHero ana,
      TopHero ashe,
      TopHero baptiste,
      TopHero bastion,
      TopHero brigitte,
      TopHero dVa,
      TopHero doomfist,
      TopHero echo,
      TopHero genji,
      TopHero hanzo,
      TopHero junkrat,
      TopHero lucio,
      TopHero mccree,
      TopHero mei,
      TopHero mercy,
      TopHero moira,
      TopHero orisa,
      TopHero pharah,
      TopHero reaper,
      TopHero reinhardt,
      TopHero roadhog,
      TopHero sigma,
      TopHero soldier76,
      TopHero sombra,
      TopHero symmetra,
      TopHero torbjorn,
      TopHero tracer,
      TopHero widowmaker,
      TopHero winston,
      TopHero wreckingBall,
      TopHero zarya,
      TopHero zenyatta}) {
    this._ana = ana;
    this._ashe = ashe;
    this._baptiste = baptiste;
    this._bastion = bastion;
    this._brigitte = brigitte;
    this._dVa = dVa;
    this._doomfist = doomfist;
    this._echo = echo;
    this._genji = genji;
    this._hanzo = hanzo;
    this._junkrat = junkrat;
    this._lucio = lucio;
    this._mccree = mccree;
    this._mei = mei;
    this._mercy = mercy;
    this._moira = moira;
    this._orisa = orisa;
    this._pharah = pharah;
    this._reaper = reaper;
    this._reinhardt = reinhardt;
    this._roadhog = roadhog;
    this._sigma = sigma;
    this._soldier76 = soldier76;
    this._sombra = sombra;
    this._symmetra = symmetra;
    this._torbjorn = torbjorn;
    this._tracer = tracer;
    this._widowmaker = widowmaker;
    this._winston = winston;
    this._wreckingBall = wreckingBall;
    this._zarya = zarya;
    this._zenyatta = zenyatta;
  }

  TopHero get ana => _ana;

  set ana(TopHero ana) => _ana = ana;

  TopHero get ashe => _ashe;

  set ashe(TopHero ashe) => _ashe = ashe;

  TopHero get baptiste => _baptiste;

  set baptiste(TopHero baptiste) => _baptiste = baptiste;

  TopHero get bastion => _bastion;

  set bastion(TopHero bastion) => _bastion = bastion;

  TopHero get brigitte => _brigitte;

  set brigitte(TopHero brigitte) => _brigitte = brigitte;

  TopHero get dVa => _dVa;

  set dVa(TopHero dVa) => _dVa = dVa;

  TopHero get doomfist => _doomfist;

  set doomfist(TopHero doomfist) => _doomfist = doomfist;

  TopHero get echo => _echo;

  set echo(TopHero echo) => _echo = echo;

  TopHero get genji => _genji;

  set genji(TopHero genji) => _genji = genji;

  TopHero get hanzo => _hanzo;

  set hanzo(TopHero hanzo) => _hanzo = hanzo;

  TopHero get junkrat => _junkrat;

  set junkrat(TopHero junkrat) => _junkrat = junkrat;

  TopHero get lucio => _lucio;

  set lucio(TopHero lucio) => _lucio = lucio;

  TopHero get mccree => _mccree;

  set mccree(TopHero mccree) => _mccree = mccree;

  TopHero get mei => _mei;

  set mei(TopHero mei) => _mei = mei;

  TopHero get mercy => _mercy;

  set mercy(TopHero mercy) => _mercy = mercy;

  TopHero get moira => _moira;

  set moira(TopHero moira) => _moira = moira;

  TopHero get orisa => _orisa;

  set orisa(TopHero orisa) => _orisa = orisa;

  TopHero get pharah => _pharah;

  set pharah(TopHero pharah) => _pharah = pharah;

  TopHero get reaper => _reaper;

  set reaper(TopHero reaper) => _reaper = reaper;

  TopHero get reinhardt => _reinhardt;

  set reinhardt(TopHero reinhardt) => _reinhardt = reinhardt;

  TopHero get roadhog => _roadhog;

  set roadhog(TopHero roadhog) => _roadhog = roadhog;

  TopHero get sigma => _sigma;

  set sigma(TopHero sigma) => _sigma = sigma;

  TopHero get soldier76 => _soldier76;

  set soldier76(TopHero soldier76) => _soldier76 = soldier76;

  TopHero get sombra => _sombra;

  set sombra(TopHero sombra) => _sombra = sombra;

  TopHero get symmetra => _symmetra;

  set symmetra(TopHero symmetra) => _symmetra = symmetra;

  TopHero get torbjorn => _torbjorn;

  set torbjorn(TopHero torbjorn) => _torbjorn = torbjorn;

  TopHero get tracer => _tracer;

  set tracer(TopHero tracer) => _tracer = tracer;

  TopHero get widowmaker => _widowmaker;

  set widowmaker(TopHero widowmaker) => _widowmaker = widowmaker;

  TopHero get winston => _winston;

  set winston(TopHero winston) => _winston = winston;

  TopHero get wreckingBall => _wreckingBall;

  set wreckingBall(TopHero wreckingBall) => _wreckingBall = wreckingBall;

  TopHero get zarya => _zarya;

  set zarya(TopHero zarya) => _zarya = zarya;

  TopHero get zenyatta => _zenyatta;

  set zenyatta(TopHero zenyatta) => _zenyatta = zenyatta;

  TopHeroes.fromJson(Map<String, dynamic> json) {
    _ana = json['ana'] != null ? new TopHero.fromJson(json['ana']) : null;
    _ashe = json['ashe'] != null ? new TopHero.fromJson(json['ashe']) : null;
    _baptiste = json['baptiste'] != null
        ? new TopHero.fromJson(json['baptiste'])
        : null;
    _bastion =
        json['bastion'] != null ? new TopHero.fromJson(json['bastion']) : null;
    _brigitte = json['brigitte'] != null
        ? new TopHero.fromJson(json['brigitte'])
        : null;
    _dVa = json['dVa'] != null ? new TopHero.fromJson(json['dVa']) : null;
    _doomfist = json['doomfist'] != null
        ? new TopHero.fromJson(json['doomfist'])
        : null;
    _echo = json['echo'] != null ? new TopHero.fromJson(json['echo']) : null;
    _genji = json['genji'] != null ? new TopHero.fromJson(json['genji']) : null;
    _hanzo = json['hanzo'] != null ? new TopHero.fromJson(json['hanzo']) : null;
    _junkrat =
        json['junkrat'] != null ? new TopHero.fromJson(json['junkrat']) : null;
    _lucio = json['lucio'] != null ? new TopHero.fromJson(json['lucio']) : null;
    _mccree =
        json['mccree'] != null ? new TopHero.fromJson(json['mccree']) : null;
    _mei = json['mei'] != null ? new TopHero.fromJson(json['mei']) : null;
    _mercy = json['mercy'] != null ? new TopHero.fromJson(json['mercy']) : null;
    _moira = json['moira'] != null ? new TopHero.fromJson(json['moira']) : null;
    _orisa = json['orisa'] != null ? new TopHero.fromJson(json['orisa']) : null;
    _pharah =
        json['pharah'] != null ? new TopHero.fromJson(json['pharah']) : null;
    _reaper =
        json['reaper'] != null ? new TopHero.fromJson(json['reaper']) : null;
    _reinhardt = json['reinhardt'] != null
        ? new TopHero.fromJson(json['reinhardt'])
        : null;
    _roadhog =
        json['roadhog'] != null ? new TopHero.fromJson(json['roadhog']) : null;
    _sigma = json['sigma'] != null ? new TopHero.fromJson(json['sigma']) : null;
    _soldier76 = json['soldier76'] != null
        ? new TopHero.fromJson(json['soldier76'])
        : null;
    _sombra =
        json['sombra'] != null ? new TopHero.fromJson(json['sombra']) : null;
    _symmetra = json['symmetra'] != null
        ? new TopHero.fromJson(json['symmetra'])
        : null;
    _torbjorn = json['torbjorn'] != null
        ? new TopHero.fromJson(json['torbjorn'])
        : null;
    _tracer =
        json['tracer'] != null ? new TopHero.fromJson(json['tracer']) : null;
    _widowmaker = json['widowmaker'] != null
        ? new TopHero.fromJson(json['widowmaker'])
        : null;
    _winston =
        json['winston'] != null ? new TopHero.fromJson(json['winston']) : null;
    _wreckingBall = json['wreckingBall'] != null
        ? new TopHero.fromJson(json['wreckingBall'])
        : null;
    _zarya = json['zarya'] != null ? new TopHero.fromJson(json['zarya']) : null;
    _zenyatta = json['zenyatta'] != null
        ? new TopHero.fromJson(json['zenyatta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._ana != null) {
      data['ana'] = this._ana.toJson();
    }
    if (this._ashe != null) {
      data['ashe'] = this._ashe.toJson();
    }
    if (this._baptiste != null) {
      data['baptiste'] = this._baptiste.toJson();
    }
    if (this._bastion != null) {
      data['bastion'] = this._bastion.toJson();
    }
    if (this._brigitte != null) {
      data['brigitte'] = this._brigitte.toJson();
    }
    if (this._dVa != null) {
      data['dVa'] = this._dVa.toJson();
    }
    if (this._doomfist != null) {
      data['doomfist'] = this._doomfist.toJson();
    }
    if (this._echo != null) {
      data['echo'] = this._echo.toJson();
    }
    if (this._genji != null) {
      data['genji'] = this._genji.toJson();
    }
    if (this._hanzo != null) {
      data['hanzo'] = this._hanzo.toJson();
    }
    if (this._junkrat != null) {
      data['junkrat'] = this._junkrat.toJson();
    }
    if (this._lucio != null) {
      data['lucio'] = this._lucio.toJson();
    }
    if (this._mccree != null) {
      data['mccree'] = this._mccree.toJson();
    }
    if (this._mei != null) {
      data['mei'] = this._mei.toJson();
    }
    if (this._mercy != null) {
      data['mercy'] = this._mercy.toJson();
    }
    if (this._moira != null) {
      data['moira'] = this._moira.toJson();
    }
    if (this._orisa != null) {
      data['orisa'] = this._orisa.toJson();
    }
    if (this._pharah != null) {
      data['pharah'] = this._pharah.toJson();
    }
    if (this._reaper != null) {
      data['reaper'] = this._reaper.toJson();
    }
    if (this._reinhardt != null) {
      data['reinhardt'] = this._reinhardt.toJson();
    }
    if (this._roadhog != null) {
      data['roadhog'] = this._roadhog.toJson();
    }
    if (this._sigma != null) {
      data['sigma'] = this._sigma.toJson();
    }
    if (this._soldier76 != null) {
      data['soldier76'] = this._soldier76.toJson();
    }
    if (this._sombra != null) {
      data['sombra'] = this._sombra.toJson();
    }
    if (this._symmetra != null) {
      data['symmetra'] = this._symmetra.toJson();
    }
    if (this._torbjorn != null) {
      data['torbjorn'] = this._torbjorn.toJson();
    }
    if (this._tracer != null) {
      data['tracer'] = this._tracer.toJson();
    }
    if (this._widowmaker != null) {
      data['widowmaker'] = this._widowmaker.toJson();
    }
    if (this._winston != null) {
      data['winston'] = this._winston.toJson();
    }
    if (this._wreckingBall != null) {
      data['wreckingBall'] = this._wreckingBall.toJson();
    }
    if (this._zarya != null) {
      data['zarya'] = this._zarya.toJson();
    }
    if (this._zenyatta != null) {
      data['zenyatta'] = this._zenyatta.toJson();
    }
    return data;
  }
}

class TopHero {
  DateTime _timePlayed;
  int _gamesWon;
  int _winPercentage;
  int _weaponAccuracy;
  double _eliminationsPerLife;
  int _multiKillBest;
  int _objectiveKills;

  TopHero(
      {DateTime timePlayed,
      int gamesWon,
      int winPercentage,
      int weaponAccuracy,
      double eliminationsPerLife,
      int multiKillBest,
      int objectiveKills}) {
    this._timePlayed = timePlayed;
    this._gamesWon = gamesWon;
    this._winPercentage = winPercentage;
    this._weaponAccuracy = weaponAccuracy;
    this._eliminationsPerLife = eliminationsPerLife;
    this._multiKillBest = multiKillBest;
    this._objectiveKills = objectiveKills;
  }

  DateTime get timePlayed => _timePlayed;

  set timePlayed(DateTime timePlayed) => _timePlayed = timePlayed;

  int get gamesWon => _gamesWon;

  set gamesWon(int gamesWon) => _gamesWon = gamesWon;

  int get winPercentage => _winPercentage;

  set winPercentage(int winPercentage) => _winPercentage = winPercentage;

  int get weaponAccuracy => _weaponAccuracy;

  set weaponAccuracy(int weaponAccuracy) => _weaponAccuracy = weaponAccuracy;

  double get eliminationsPerLife => _eliminationsPerLife;

  set eliminationsPerLife(double eliminationsPerLife) =>
      _eliminationsPerLife = eliminationsPerLife;

  int get multiKillBest => _multiKillBest;

  set multiKillBest(int multiKillBest) => _multiKillBest = multiKillBest;

  int get objectiveKills => _objectiveKills;

  set objectiveKills(int objectiveKills) => _objectiveKills = objectiveKills;

  TopHero.fromJson(Map<String, dynamic> json) {
    if (RegExp(r"\d\d:\d\d:\d\d").hasMatch(json['timePlayed'])) {
      _timePlayed = DateTime.parse(
          GlobalVariables.standardConversionDate + json['timePlayed'] + ".000");
    } else {
      _timePlayed = DateTime.parse(GlobalVariables.standardConversionDate +
          "00:" +
          json['timePlayed'] +
          ".000");
    }
    _gamesWon = json['gamesWon'];
    _winPercentage = json['winPercentage'];
    _weaponAccuracy = json['weaponAccuracy'];
    _eliminationsPerLife = json['eliminationsPerLife'].toDouble();
    _multiKillBest = json['multiKillBest'];
    _objectiveKills = json['objectiveKills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timePlayed'] = this._timePlayed;
    data['gamesWon'] = this._gamesWon;
    data['winPercentage'] = this._winPercentage;
    data['weaponAccuracy'] = this._weaponAccuracy;
    data['eliminationsPerLife'] = this._eliminationsPerLife;
    data['multiKillBest'] = this._multiKillBest;
    data['objectiveKills'] = this._objectiveKills;
    return data;
  }
}

class QuickPlayStats {
  QuickPlayAwards _awards;
  QuickPlayCareerStats _careerStats;
  QuickPlayGames _games;
  QuickPlayTopHeroes _topHeroes;

  QuickPlayStats(
      {QuickPlayAwards awards,
      QuickPlayCareerStats careerStats,
      QuickPlayGames games,
      QuickPlayTopHeroes topHeroes}) {
    this._awards = awards;
    this._careerStats = careerStats;
    this._games = games;
    this._topHeroes = topHeroes;
  }

  QuickPlayAwards get awards => _awards;

  set awards(QuickPlayAwards awards) => _awards = awards;

  QuickPlayCareerStats get careerStats => _careerStats;

  set careerStats(QuickPlayCareerStats careerStats) =>
      _careerStats = careerStats;

  QuickPlayGames get games => _games;

  set games(QuickPlayGames games) => _games = games;

  QuickPlayTopHeroes get topHeroes => _topHeroes;

  set topHeroes(QuickPlayTopHeroes topHeroes) => _topHeroes = topHeroes;

  QuickPlayStats.fromJson(Map<String, dynamic> json) {
    _awards = json['awards'] != null
        ? new QuickPlayAwards.fromJson(json['awards'])
        : null;
    _careerStats = json['careerStats'] != null
        ? new QuickPlayCareerStats.fromJson(json['careerStats'])
        : null;
    _games = json['games'] != null
        ? new QuickPlayGames.fromJson(json['games'])
        : null;
    _topHeroes = json['topHeroes'] != null
        ? new QuickPlayTopHeroes.fromJson(json['topHeroes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._awards != null) {
      data['awards'] = this._awards.toJson();
    }
    if (this._careerStats != null) {
      data['careerStats'] = this._careerStats.toJson();
    }
    if (this._games != null) {
      data['games'] = this._games.toJson();
    }
    if (this._topHeroes != null) {
      data['topHeroes'] = this._topHeroes.toJson();
    }
    return data;
  }
}

class QuickPlayAwards {
  int _cards;
  int _medals;
  int _medalsBronze;
  int _medalsSilver;
  int _medalsGold;

  QuickPlayAwards(
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

  QuickPlayAwards.fromJson(Map<String, dynamic> json) {
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

class QuickPlayCareerStats {
  AllHeroes _allHeroes;

  QuickPlayCareerStats({AllHeroes allHeroes}) {
    this._allHeroes = allHeroes;
  }

  AllHeroes get allHeroes => _allHeroes;

  set allHeroes(AllHeroes allHeroes) => _allHeroes = allHeroes;

  QuickPlayCareerStats.fromJson(Map<String, dynamic> json) {
    _allHeroes = json['allHeroes'] != null
        ? new AllHeroes.fromJson(json['allHeroes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._allHeroes != null) {
      data['allHeroes'] = this._allHeroes.toJson();
    }
    return data;
  }
}

class QuickPlayAllHeroes {
  QuickPlayAssists _assists;
  QuickPlayAverage _average;
  QuickPlayBest _best;
  QuickPlayCombat _combat;
  Null _deaths;
  Null _heroSpecific;
  QuickPlayGame _game;
  QuickPlayAwards _matchAwards;
  QuickPlayMiscellaneous _miscellaneous;

  QuickPlayAllHeroes(
      {QuickPlayAssists assists,
      QuickPlayAverage average,
      QuickPlayBest best,
      QuickPlayCombat combat,
      Null deaths,
      Null heroSpecific,
      QuickPlayGame game,
      QuickPlayAwards matchAwards,
      QuickPlayMiscellaneous miscellaneous}) {
    this._assists = assists;
    this._average = average;
    this._best = best;
    this._combat = combat;
    this._deaths = deaths;
    this._heroSpecific = heroSpecific;
    this._game = game;
    this._matchAwards = matchAwards;
    this._miscellaneous = miscellaneous;
  }

  QuickPlayAssists get assists => _assists;

  set assists(QuickPlayAssists assists) => _assists = assists;

  QuickPlayAverage get average => _average;

  set average(QuickPlayAverage average) => _average = average;

  QuickPlayBest get best => _best;

  set best(QuickPlayBest best) => _best = best;

  QuickPlayCombat get combat => _combat;

  set combat(QuickPlayCombat combat) => _combat = combat;

  Null get deaths => _deaths;

  set deaths(Null deaths) => _deaths = deaths;

  Null get heroSpecific => _heroSpecific;

  set heroSpecific(Null heroSpecific) => _heroSpecific = heroSpecific;

  QuickPlayGame get game => _game;

  set game(QuickPlayGame game) => _game = game;

  QuickPlayAwards get matchAwards => _matchAwards;

  set matchAwards(QuickPlayAwards matchAwards) => _matchAwards = matchAwards;

  QuickPlayMiscellaneous get miscellaneous => _miscellaneous;

  set miscellaneous(QuickPlayMiscellaneous miscellaneous) =>
      _miscellaneous = miscellaneous;

  QuickPlayAllHeroes.fromJson(Map<String, dynamic> json) {
    _assists = json['assists'] != null
        ? new QuickPlayAssists.fromJson(json['assists'])
        : null;
    _average = json['average'] != null
        ? new QuickPlayAverage.fromJson(json['average'])
        : null;
    _best =
        json['best'] != null ? new QuickPlayBest.fromJson(json['best']) : null;
    _combat = json['combat'] != null
        ? new QuickPlayCombat.fromJson(json['combat'])
        : null;
    _deaths = json['deaths'];
    _heroSpecific = json['heroSpecific'];
    _game =
        json['game'] != null ? new QuickPlayGame.fromJson(json['game']) : null;
    _matchAwards = json['matchAwards'] != null
        ? new QuickPlayAwards.fromJson(json['matchAwards'])
        : null;
    _miscellaneous = json['miscellaneous'] != null
        ? new QuickPlayMiscellaneous.fromJson(json['miscellaneous'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._assists != null) {
      data['assists'] = this._assists.toJson();
    }
    if (this._average != null) {
      data['average'] = this._average.toJson();
    }
    if (this._best != null) {
      data['best'] = this._best.toJson();
    }
    if (this._combat != null) {
      data['combat'] = this._combat.toJson();
    }
    data['deaths'] = this._deaths;
    data['heroSpecific'] = this._heroSpecific;
    if (this._game != null) {
      data['game'] = this._game.toJson();
    }
    if (this._matchAwards != null) {
      data['matchAwards'] = this._matchAwards.toJson();
    }
    if (this._miscellaneous != null) {
      data['miscellaneous'] = this._miscellaneous.toJson();
    }
    return data;
  }
}

class QuickPlayAssists {
  int _defensiveAssists;
  int _healingDone;
  int _offensiveAssists;
  int _reconAssists;

  QuickPlayAssists(
      {int defensiveAssists,
      int healingDone,
      int offensiveAssists,
      int reconAssists}) {
    this._defensiveAssists = defensiveAssists;
    this._healingDone = healingDone;
    this._offensiveAssists = offensiveAssists;
    this._reconAssists = reconAssists;
  }

  int get defensiveAssists => _defensiveAssists;

  set defensiveAssists(int defensiveAssists) =>
      _defensiveAssists = defensiveAssists;

  int get healingDone => _healingDone;

  set healingDone(int healingDone) => _healingDone = healingDone;

  int get offensiveAssists => _offensiveAssists;

  set offensiveAssists(int offensiveAssists) =>
      _offensiveAssists = offensiveAssists;

  int get reconAssists => _reconAssists;

  set reconAssists(int reconAssists) => _reconAssists = reconAssists;

  QuickPlayAssists.fromJson(Map<String, dynamic> json) {
    _defensiveAssists = json['defensiveAssists'];
    _healingDone = json['healingDone'];
    _offensiveAssists = json['offensiveAssists'];
    _reconAssists = json['reconAssists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defensiveAssists'] = this._defensiveAssists;
    data['healingDone'] = this._healingDone;
    data['offensiveAssists'] = this._offensiveAssists;
    data['reconAssists'] = this._reconAssists;
    return data;
  }
}

class QuickPlayAverage {
  int _allDamageDoneAvgPer10Min;
  int _barrierDamageDoneAvgPer10Min;
  double _deathsAvgPer10Min;
  double _eliminationsAvgPer10Min;
  double _finalBlowsAvgPer10Min;
  int _healingDoneAvgPer10Min;
  int _heroDamageDoneAvgPer10Min;
  double _objectiveKillsAvgPer10Min;
  String _objectiveTimeAvgPer10Min;
  double _soloKillsAvgPer10Min;
  String _timeSpentOnFireAvgPer10Min;

  QuickPlayAverage(
      {int allDamageDoneAvgPer10Min,
      int barrierDamageDoneAvgPer10Min,
      double deathsAvgPer10Min,
      double eliminationsAvgPer10Min,
      double finalBlowsAvgPer10Min,
      int healingDoneAvgPer10Min,
      int heroDamageDoneAvgPer10Min,
      double objectiveKillsAvgPer10Min,
      String objectiveTimeAvgPer10Min,
      double soloKillsAvgPer10Min,
      String timeSpentOnFireAvgPer10Min}) {
    this._allDamageDoneAvgPer10Min = allDamageDoneAvgPer10Min;
    this._barrierDamageDoneAvgPer10Min = barrierDamageDoneAvgPer10Min;
    this._deathsAvgPer10Min = deathsAvgPer10Min;
    this._eliminationsAvgPer10Min = eliminationsAvgPer10Min;
    this._finalBlowsAvgPer10Min = finalBlowsAvgPer10Min;
    this._healingDoneAvgPer10Min = healingDoneAvgPer10Min;
    this._heroDamageDoneAvgPer10Min = heroDamageDoneAvgPer10Min;
    this._objectiveKillsAvgPer10Min = objectiveKillsAvgPer10Min;
    this._objectiveTimeAvgPer10Min = objectiveTimeAvgPer10Min;
    this._soloKillsAvgPer10Min = soloKillsAvgPer10Min;
    this._timeSpentOnFireAvgPer10Min = timeSpentOnFireAvgPer10Min;
  }

  int get allDamageDoneAvgPer10Min => _allDamageDoneAvgPer10Min;

  set allDamageDoneAvgPer10Min(int allDamageDoneAvgPer10Min) =>
      _allDamageDoneAvgPer10Min = allDamageDoneAvgPer10Min;

  int get barrierDamageDoneAvgPer10Min => _barrierDamageDoneAvgPer10Min;

  set barrierDamageDoneAvgPer10Min(int barrierDamageDoneAvgPer10Min) =>
      _barrierDamageDoneAvgPer10Min = barrierDamageDoneAvgPer10Min;

  double get deathsAvgPer10Min => _deathsAvgPer10Min;

  set deathsAvgPer10Min(double deathsAvgPer10Min) =>
      _deathsAvgPer10Min = deathsAvgPer10Min;

  double get eliminationsAvgPer10Min => _eliminationsAvgPer10Min;

  set eliminationsAvgPer10Min(double eliminationsAvgPer10Min) =>
      _eliminationsAvgPer10Min = eliminationsAvgPer10Min;

  double get finalBlowsAvgPer10Min => _finalBlowsAvgPer10Min;

  set finalBlowsAvgPer10Min(double finalBlowsAvgPer10Min) =>
      _finalBlowsAvgPer10Min = finalBlowsAvgPer10Min;

  int get healingDoneAvgPer10Min => _healingDoneAvgPer10Min;

  set healingDoneAvgPer10Min(int healingDoneAvgPer10Min) =>
      _healingDoneAvgPer10Min = healingDoneAvgPer10Min;

  int get heroDamageDoneAvgPer10Min => _heroDamageDoneAvgPer10Min;

  set heroDamageDoneAvgPer10Min(int heroDamageDoneAvgPer10Min) =>
      _heroDamageDoneAvgPer10Min = heroDamageDoneAvgPer10Min;

  double get objectiveKillsAvgPer10Min => _objectiveKillsAvgPer10Min;

  set objectiveKillsAvgPer10Min(double objectiveKillsAvgPer10Min) =>
      _objectiveKillsAvgPer10Min = objectiveKillsAvgPer10Min;

  String get objectiveTimeAvgPer10Min => _objectiveTimeAvgPer10Min;

  set objectiveTimeAvgPer10Min(String objectiveTimeAvgPer10Min) =>
      _objectiveTimeAvgPer10Min = objectiveTimeAvgPer10Min;

  double get soloKillsAvgPer10Min => _soloKillsAvgPer10Min;

  set soloKillsAvgPer10Min(double soloKillsAvgPer10Min) =>
      _soloKillsAvgPer10Min = soloKillsAvgPer10Min;

  String get timeSpentOnFireAvgPer10Min => _timeSpentOnFireAvgPer10Min;

  set timeSpentOnFireAvgPer10Min(String timeSpentOnFireAvgPer10Min) =>
      _timeSpentOnFireAvgPer10Min = timeSpentOnFireAvgPer10Min;

  QuickPlayAverage.fromJson(Map<String, dynamic> json) {
    _allDamageDoneAvgPer10Min = json['allDamageDoneAvgPer10Min'];
    _barrierDamageDoneAvgPer10Min = json['barrierDamageDoneAvgPer10Min'];
    _deathsAvgPer10Min = json['deathsAvgPer10Min'];
    _eliminationsAvgPer10Min = json['eliminationsAvgPer10Min'];
    _finalBlowsAvgPer10Min = json['finalBlowsAvgPer10Min'];
    _healingDoneAvgPer10Min = json['healingDoneAvgPer10Min'];
    _heroDamageDoneAvgPer10Min = json['heroDamageDoneAvgPer10Min'];
    _objectiveKillsAvgPer10Min = json['objectiveKillsAvgPer10Min'];
    _objectiveTimeAvgPer10Min = json['objectiveTimeAvgPer10Min'];
    _soloKillsAvgPer10Min = json['soloKillsAvgPer10Min'];
    _timeSpentOnFireAvgPer10Min = json['timeSpentOnFireAvgPer10Min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allDamageDoneAvgPer10Min'] = this._allDamageDoneAvgPer10Min;
    data['barrierDamageDoneAvgPer10Min'] = this._barrierDamageDoneAvgPer10Min;
    data['deathsAvgPer10Min'] = this._deathsAvgPer10Min;
    data['eliminationsAvgPer10Min'] = this._eliminationsAvgPer10Min;
    data['finalBlowsAvgPer10Min'] = this._finalBlowsAvgPer10Min;
    data['healingDoneAvgPer10Min'] = this._healingDoneAvgPer10Min;
    data['heroDamageDoneAvgPer10Min'] = this._heroDamageDoneAvgPer10Min;
    data['objectiveKillsAvgPer10Min'] = this._objectiveKillsAvgPer10Min;
    data['objectiveTimeAvgPer10Min'] = this._objectiveTimeAvgPer10Min;
    data['soloKillsAvgPer10Min'] = this._soloKillsAvgPer10Min;
    data['timeSpentOnFireAvgPer10Min'] = this._timeSpentOnFireAvgPer10Min;
    return data;
  }
}

class QuickPlayBest {
  int _allDamageDoneMostInGame;
  int _barrierDamageDoneMostInGame;
  int _defensiveAssistsMostInGame;
  int _eliminationsMostInGame;
  int _environmentalKillsMostInGame;
  int _finalBlowsMostInGame;
  int _healingDoneMostInGame;
  int _heroDamageDoneMostInGame;
  int _killsStreakBest;
  int _meleeFinalBlowsMostInGame;
  int _multikillsBest;
  int _objectiveKillsMostInGame;
  String _objectiveTimeMostInGame;
  int _offensiveAssistsMostInGame;
  int _reconAssistsMostInGame;
  int _soloKillsMostInGame;
  int _teleporterPadsDestroyedMostInGame;
  String _timeSpentOnFireMostInGame;
  int _turretsDestroyedMostInGame;

  QuickPlayBest(
      {int allDamageDoneMostInGame,
      int barrierDamageDoneMostInGame,
      int defensiveAssistsMostInGame,
      int eliminationsMostInGame,
      int environmentalKillsMostInGame,
      int finalBlowsMostInGame,
      int healingDoneMostInGame,
      int heroDamageDoneMostInGame,
      int killsStreakBest,
      int meleeFinalBlowsMostInGame,
      int multikillsBest,
      int objectiveKillsMostInGame,
      String objectiveTimeMostInGame,
      int offensiveAssistsMostInGame,
      int reconAssistsMostInGame,
      int soloKillsMostInGame,
      int teleporterPadsDestroyedMostInGame,
      String timeSpentOnFireMostInGame,
      int turretsDestroyedMostInGame}) {
    this._allDamageDoneMostInGame = allDamageDoneMostInGame;
    this._barrierDamageDoneMostInGame = barrierDamageDoneMostInGame;
    this._defensiveAssistsMostInGame = defensiveAssistsMostInGame;
    this._eliminationsMostInGame = eliminationsMostInGame;
    this._environmentalKillsMostInGame = environmentalKillsMostInGame;
    this._finalBlowsMostInGame = finalBlowsMostInGame;
    this._healingDoneMostInGame = healingDoneMostInGame;
    this._heroDamageDoneMostInGame = heroDamageDoneMostInGame;
    this._killsStreakBest = killsStreakBest;
    this._meleeFinalBlowsMostInGame = meleeFinalBlowsMostInGame;
    this._multikillsBest = multikillsBest;
    this._objectiveKillsMostInGame = objectiveKillsMostInGame;
    this._objectiveTimeMostInGame = objectiveTimeMostInGame;
    this._offensiveAssistsMostInGame = offensiveAssistsMostInGame;
    this._reconAssistsMostInGame = reconAssistsMostInGame;
    this._soloKillsMostInGame = soloKillsMostInGame;
    this._teleporterPadsDestroyedMostInGame = teleporterPadsDestroyedMostInGame;
    this._timeSpentOnFireMostInGame = timeSpentOnFireMostInGame;
    this._turretsDestroyedMostInGame = turretsDestroyedMostInGame;
  }

  int get allDamageDoneMostInGame => _allDamageDoneMostInGame;

  set allDamageDoneMostInGame(int allDamageDoneMostInGame) =>
      _allDamageDoneMostInGame = allDamageDoneMostInGame;

  int get barrierDamageDoneMostInGame => _barrierDamageDoneMostInGame;

  set barrierDamageDoneMostInGame(int barrierDamageDoneMostInGame) =>
      _barrierDamageDoneMostInGame = barrierDamageDoneMostInGame;

  int get defensiveAssistsMostInGame => _defensiveAssistsMostInGame;

  set defensiveAssistsMostInGame(int defensiveAssistsMostInGame) =>
      _defensiveAssistsMostInGame = defensiveAssistsMostInGame;

  int get eliminationsMostInGame => _eliminationsMostInGame;

  set eliminationsMostInGame(int eliminationsMostInGame) =>
      _eliminationsMostInGame = eliminationsMostInGame;

  int get environmentalKillsMostInGame => _environmentalKillsMostInGame;

  set environmentalKillsMostInGame(int environmentalKillsMostInGame) =>
      _environmentalKillsMostInGame = environmentalKillsMostInGame;

  int get finalBlowsMostInGame => _finalBlowsMostInGame;

  set finalBlowsMostInGame(int finalBlowsMostInGame) =>
      _finalBlowsMostInGame = finalBlowsMostInGame;

  int get healingDoneMostInGame => _healingDoneMostInGame;

  set healingDoneMostInGame(int healingDoneMostInGame) =>
      _healingDoneMostInGame = healingDoneMostInGame;

  int get heroDamageDoneMostInGame => _heroDamageDoneMostInGame;

  set heroDamageDoneMostInGame(int heroDamageDoneMostInGame) =>
      _heroDamageDoneMostInGame = heroDamageDoneMostInGame;

  int get killsStreakBest => _killsStreakBest;

  set killsStreakBest(int killsStreakBest) =>
      _killsStreakBest = killsStreakBest;

  int get meleeFinalBlowsMostInGame => _meleeFinalBlowsMostInGame;

  set meleeFinalBlowsMostInGame(int meleeFinalBlowsMostInGame) =>
      _meleeFinalBlowsMostInGame = meleeFinalBlowsMostInGame;

  int get multikillsBest => _multikillsBest;

  set multikillsBest(int multikillsBest) => _multikillsBest = multikillsBest;

  int get objectiveKillsMostInGame => _objectiveKillsMostInGame;

  set objectiveKillsMostInGame(int objectiveKillsMostInGame) =>
      _objectiveKillsMostInGame = objectiveKillsMostInGame;

  String get objectiveTimeMostInGame => _objectiveTimeMostInGame;

  set objectiveTimeMostInGame(String objectiveTimeMostInGame) =>
      _objectiveTimeMostInGame = objectiveTimeMostInGame;

  int get offensiveAssistsMostInGame => _offensiveAssistsMostInGame;

  set offensiveAssistsMostInGame(int offensiveAssistsMostInGame) =>
      _offensiveAssistsMostInGame = offensiveAssistsMostInGame;

  int get reconAssistsMostInGame => _reconAssistsMostInGame;

  set reconAssistsMostInGame(int reconAssistsMostInGame) =>
      _reconAssistsMostInGame = reconAssistsMostInGame;

  int get soloKillsMostInGame => _soloKillsMostInGame;

  set soloKillsMostInGame(int soloKillsMostInGame) =>
      _soloKillsMostInGame = soloKillsMostInGame;

  int get teleporterPadsDestroyedMostInGame =>
      _teleporterPadsDestroyedMostInGame;

  set teleporterPadsDestroyedMostInGame(
          int teleporterPadsDestroyedMostInGame) =>
      _teleporterPadsDestroyedMostInGame = teleporterPadsDestroyedMostInGame;

  String get timeSpentOnFireMostInGame => _timeSpentOnFireMostInGame;

  set timeSpentOnFireMostInGame(String timeSpentOnFireMostInGame) =>
      _timeSpentOnFireMostInGame = timeSpentOnFireMostInGame;

  int get turretsDestroyedMostInGame => _turretsDestroyedMostInGame;

  set turretsDestroyedMostInGame(int turretsDestroyedMostInGame) =>
      _turretsDestroyedMostInGame = turretsDestroyedMostInGame;

  QuickPlayBest.fromJson(Map<String, dynamic> json) {
    _allDamageDoneMostInGame = json['allDamageDoneMostInGame'];
    _barrierDamageDoneMostInGame = json['barrierDamageDoneMostInGame'];
    _defensiveAssistsMostInGame = json['defensiveAssistsMostInGame'];
    _eliminationsMostInGame = json['eliminationsMostInGame'];
    _environmentalKillsMostInGame = json['environmentalKillsMostInGame'];
    _finalBlowsMostInGame = json['finalBlowsMostInGame'];
    _healingDoneMostInGame = json['healingDoneMostInGame'];
    _heroDamageDoneMostInGame = json['heroDamageDoneMostInGame'];
    _killsStreakBest = json['killsStreakBest'];
    _meleeFinalBlowsMostInGame = json['meleeFinalBlowsMostInGame'];
    _multikillsBest = json['multikillsBest'];
    _objectiveKillsMostInGame = json['objectiveKillsMostInGame'];
    _objectiveTimeMostInGame = json['objectiveTimeMostInGame'];
    _offensiveAssistsMostInGame = json['offensiveAssistsMostInGame'];
    _reconAssistsMostInGame = json['reconAssistsMostInGame'];
    _soloKillsMostInGame = json['soloKillsMostInGame'];
    _teleporterPadsDestroyedMostInGame =
        json['teleporterPadsDestroyedMostInGame'];
    _timeSpentOnFireMostInGame = json['timeSpentOnFireMostInGame'];
    _turretsDestroyedMostInGame = json['turretsDestroyedMostInGame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allDamageDoneMostInGame'] = this._allDamageDoneMostInGame;
    data['barrierDamageDoneMostInGame'] = this._barrierDamageDoneMostInGame;
    data['defensiveAssistsMostInGame'] = this._defensiveAssistsMostInGame;
    data['eliminationsMostInGame'] = this._eliminationsMostInGame;
    data['environmentalKillsMostInGame'] = this._environmentalKillsMostInGame;
    data['finalBlowsMostInGame'] = this._finalBlowsMostInGame;
    data['healingDoneMostInGame'] = this._healingDoneMostInGame;
    data['heroDamageDoneMostInGame'] = this._heroDamageDoneMostInGame;
    data['killsStreakBest'] = this._killsStreakBest;
    data['meleeFinalBlowsMostInGame'] = this._meleeFinalBlowsMostInGame;
    data['multikillsBest'] = this._multikillsBest;
    data['objectiveKillsMostInGame'] = this._objectiveKillsMostInGame;
    data['objectiveTimeMostInGame'] = this._objectiveTimeMostInGame;
    data['offensiveAssistsMostInGame'] = this._offensiveAssistsMostInGame;
    data['reconAssistsMostInGame'] = this._reconAssistsMostInGame;
    data['soloKillsMostInGame'] = this._soloKillsMostInGame;
    data['teleporterPadsDestroyedMostInGame'] =
        this._teleporterPadsDestroyedMostInGame;
    data['timeSpentOnFireMostInGame'] = this._timeSpentOnFireMostInGame;
    data['turretsDestroyedMostInGame'] = this._turretsDestroyedMostInGame;
    return data;
  }
}

class QuickPlayCombat {
  int _barrierDamageDone;
  int _damageDone;
  int _deaths;
  int _eliminations;
  int _environmentalKills;
  int _finalBlows;
  int _heroDamageDone;
  int _meleeFinalBlows;
  int _multikills;
  int _objectiveKills;
  String _objectiveTime;
  int _soloKills;
  String _timeSpentOnFire;

  QuickPlayCombat(
      {int barrierDamageDone,
      int damageDone,
      int deaths,
      int eliminations,
      int environmentalKills,
      int finalBlows,
      int heroDamageDone,
      int meleeFinalBlows,
      int multikills,
      int objectiveKills,
      String objectiveTime,
      int soloKills,
      String timeSpentOnFire}) {
    this._barrierDamageDone = barrierDamageDone;
    this._damageDone = damageDone;
    this._deaths = deaths;
    this._eliminations = eliminations;
    this._environmentalKills = environmentalKills;
    this._finalBlows = finalBlows;
    this._heroDamageDone = heroDamageDone;
    this._meleeFinalBlows = meleeFinalBlows;
    this._multikills = multikills;
    this._objectiveKills = objectiveKills;
    this._objectiveTime = objectiveTime;
    this._soloKills = soloKills;
    this._timeSpentOnFire = timeSpentOnFire;
  }

  int get barrierDamageDone => _barrierDamageDone;

  set barrierDamageDone(int barrierDamageDone) =>
      _barrierDamageDone = barrierDamageDone;

  int get damageDone => _damageDone;

  set damageDone(int damageDone) => _damageDone = damageDone;

  int get deaths => _deaths;

  set deaths(int deaths) => _deaths = deaths;

  int get eliminations => _eliminations;

  set eliminations(int eliminations) => _eliminations = eliminations;

  int get environmentalKills => _environmentalKills;

  set environmentalKills(int environmentalKills) =>
      _environmentalKills = environmentalKills;

  int get finalBlows => _finalBlows;

  set finalBlows(int finalBlows) => _finalBlows = finalBlows;

  int get heroDamageDone => _heroDamageDone;

  set heroDamageDone(int heroDamageDone) => _heroDamageDone = heroDamageDone;

  int get meleeFinalBlows => _meleeFinalBlows;

  set meleeFinalBlows(int meleeFinalBlows) =>
      _meleeFinalBlows = meleeFinalBlows;

  int get multikills => _multikills;

  set multikills(int multikills) => _multikills = multikills;

  int get objectiveKills => _objectiveKills;

  set objectiveKills(int objectiveKills) => _objectiveKills = objectiveKills;

  String get objectiveTime => _objectiveTime;

  set objectiveTime(String objectiveTime) => _objectiveTime = objectiveTime;

  int get soloKills => _soloKills;

  set soloKills(int soloKills) => _soloKills = soloKills;

  String get timeSpentOnFire => _timeSpentOnFire;

  set timeSpentOnFire(String timeSpentOnFire) =>
      _timeSpentOnFire = timeSpentOnFire;

  QuickPlayCombat.fromJson(Map<String, dynamic> json) {
    _barrierDamageDone = json['barrierDamageDone'];
    _damageDone = json['damageDone'];
    _deaths = json['deaths'];
    _eliminations = json['eliminations'];
    _environmentalKills = json['environmentalKills'];
    _finalBlows = json['finalBlows'];
    _heroDamageDone = json['heroDamageDone'];
    _meleeFinalBlows = json['meleeFinalBlows'];
    _multikills = json['multikills'];
    _objectiveKills = json['objectiveKills'];
    _objectiveTime = json['objectiveTime'];
    _soloKills = json['soloKills'];
    _timeSpentOnFire = json['timeSpentOnFire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barrierDamageDone'] = this._barrierDamageDone;
    data['damageDone'] = this._damageDone;
    data['deaths'] = this._deaths;
    data['eliminations'] = this._eliminations;
    data['environmentalKills'] = this._environmentalKills;
    data['finalBlows'] = this._finalBlows;
    data['heroDamageDone'] = this._heroDamageDone;
    data['meleeFinalBlows'] = this._meleeFinalBlows;
    data['multikills'] = this._multikills;
    data['objectiveKills'] = this._objectiveKills;
    data['objectiveTime'] = this._objectiveTime;
    data['soloKills'] = this._soloKills;
    data['timeSpentOnFire'] = this._timeSpentOnFire;
    return data;
  }
}

class QuickPlayGame {
  int _gamesLost;
  int _gamesPlayed;
  int _gamesWon;
  String _timePlayed;

  QuickPlayGame(
      {int gamesLost, int gamesPlayed, int gamesWon, String timePlayed}) {
    this._gamesLost = gamesLost;
    this._gamesPlayed = gamesPlayed;
    this._gamesWon = gamesWon;
    this._timePlayed = timePlayed;
  }

  int get gamesLost => _gamesLost;

  set gamesLost(int gamesLost) => _gamesLost = gamesLost;

  int get gamesPlayed => _gamesPlayed;

  set gamesPlayed(int gamesPlayed) => _gamesPlayed = gamesPlayed;

  int get gamesWon => _gamesWon;

  set gamesWon(int gamesWon) => _gamesWon = gamesWon;

  String get timePlayed => _timePlayed;

  set timePlayed(String timePlayed) => _timePlayed = timePlayed;

  QuickPlayGame.fromJson(Map<String, dynamic> json) {
    _gamesLost = json['gamesLost'];
    _gamesPlayed = json['gamesPlayed'];
    _gamesWon = json['gamesWon'];
    _timePlayed = json['timePlayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gamesLost'] = this._gamesLost;
    data['gamesPlayed'] = this._gamesPlayed;
    data['gamesWon'] = this._gamesWon;
    data['timePlayed'] = this._timePlayed;
    return data;
  }
}

class QuickPlayMiscellaneous {
  int _teleporterPadsDestroyed;
  int _turretsDestroyed;

  QuickPlayMiscellaneous({int teleporterPadsDestroyed, int turretsDestroyed}) {
    this._teleporterPadsDestroyed = teleporterPadsDestroyed;
    this._turretsDestroyed = turretsDestroyed;
  }

  int get teleporterPadsDestroyed => _teleporterPadsDestroyed;

  set teleporterPadsDestroyed(int teleporterPadsDestroyed) =>
      _teleporterPadsDestroyed = teleporterPadsDestroyed;

  int get turretsDestroyed => _turretsDestroyed;

  set turretsDestroyed(int turretsDestroyed) =>
      _turretsDestroyed = turretsDestroyed;

  QuickPlayMiscellaneous.fromJson(Map<String, dynamic> json) {
    _teleporterPadsDestroyed = json['teleporterPadsDestroyed'];
    _turretsDestroyed = json['turretsDestroyed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teleporterPadsDestroyed'] = this._teleporterPadsDestroyed;
    data['turretsDestroyed'] = this._turretsDestroyed;
    return data;
  }
}

class QuickPlayGames {
  int _played;
  int _won;

  QuickPlayGames({int played, int won}) {
    this._played = played;
    this._won = won;
  }

  int get played => _played;

  set played(int played) => _played = played;

  int get won => _won;

  set won(int won) => _won = won;

  QuickPlayGames.fromJson(Map<String, dynamic> json) {
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

class QuickPlayTopHeroes {
  QuickPlayTopHero _ana;
  QuickPlayTopHero _ashe;
  QuickPlayTopHero _baptiste;
  QuickPlayTopHero _bastion;
  QuickPlayTopHero _brigitte;
  QuickPlayTopHero _dVa;
  QuickPlayTopHero _doomfist;
  QuickPlayTopHero _echo;
  QuickPlayTopHero _genji;
  QuickPlayTopHero _hanzo;
  QuickPlayTopHero _junkrat;
  QuickPlayTopHero _lucio;
  QuickPlayTopHero _mccree;
  QuickPlayTopHero _mei;
  QuickPlayTopHero _mercy;
  QuickPlayTopHero _moira;
  QuickPlayTopHero _orisa;
  QuickPlayTopHero _pharah;
  QuickPlayTopHero _reaper;
  QuickPlayTopHero _reinhardt;
  QuickPlayTopHero _roadhog;
  QuickPlayTopHero _sigma;
  QuickPlayTopHero _soldier76;
  QuickPlayTopHero _sombra;
  QuickPlayTopHero _symmetra;
  QuickPlayTopHero _torbjorn;
  QuickPlayTopHero _tracer;
  QuickPlayTopHero _widowmaker;
  QuickPlayTopHero _winston;
  QuickPlayTopHero _wreckingBall;
  QuickPlayTopHero _zarya;
  QuickPlayTopHero _zenyatta;

  QuickPlayTopHeroes(
      {QuickPlayTopHero ana,
      QuickPlayTopHero ashe,
      QuickPlayTopHero baptiste,
      QuickPlayTopHero bastion,
      QuickPlayTopHero brigitte,
      QuickPlayTopHero dVa,
      QuickPlayTopHero doomfist,
      QuickPlayTopHero echo,
      QuickPlayTopHero genji,
      QuickPlayTopHero hanzo,
      QuickPlayTopHero junkrat,
      QuickPlayTopHero lucio,
      QuickPlayTopHero mccree,
      QuickPlayTopHero mei,
      QuickPlayTopHero mercy,
      QuickPlayTopHero moira,
      QuickPlayTopHero orisa,
      QuickPlayTopHero pharah,
      QuickPlayTopHero reaper,
      QuickPlayTopHero reinhardt,
      QuickPlayTopHero roadhog,
      QuickPlayTopHero sigma,
      QuickPlayTopHero soldier76,
      QuickPlayTopHero sombra,
      QuickPlayTopHero symmetra,
      QuickPlayTopHero torbjorn,
      QuickPlayTopHero tracer,
      QuickPlayTopHero widowmaker,
      QuickPlayTopHero winston,
      QuickPlayTopHero wreckingBall,
      QuickPlayTopHero zarya,
      QuickPlayTopHero zenyatta}) {
    this._ana = ana;
    this._ashe = ashe;
    this._baptiste = baptiste;
    this._bastion = bastion;
    this._brigitte = brigitte;
    this._dVa = dVa;
    this._doomfist = doomfist;
    this._echo = echo;
    this._genji = genji;
    this._hanzo = hanzo;
    this._junkrat = junkrat;
    this._lucio = lucio;
    this._mccree = mccree;
    this._mei = mei;
    this._mercy = mercy;
    this._moira = moira;
    this._orisa = orisa;
    this._pharah = pharah;
    this._reaper = reaper;
    this._reinhardt = reinhardt;
    this._roadhog = roadhog;
    this._sigma = sigma;
    this._soldier76 = soldier76;
    this._sombra = sombra;
    this._symmetra = symmetra;
    this._torbjorn = torbjorn;
    this._tracer = tracer;
    this._widowmaker = widowmaker;
    this._winston = winston;
    this._wreckingBall = wreckingBall;
    this._zarya = zarya;
    this._zenyatta = zenyatta;
  }

  QuickPlayTopHero get ana => _ana;

  set ana(QuickPlayTopHero ana) => _ana = ana;

  QuickPlayTopHero get ashe => _ashe;

  set ashe(QuickPlayTopHero ashe) => _ashe = ashe;

  QuickPlayTopHero get baptiste => _baptiste;

  set baptiste(QuickPlayTopHero baptiste) => _baptiste = baptiste;

  QuickPlayTopHero get bastion => _bastion;

  set bastion(QuickPlayTopHero bastion) => _bastion = bastion;

  QuickPlayTopHero get brigitte => _brigitte;

  set brigitte(QuickPlayTopHero brigitte) => _brigitte = brigitte;

  QuickPlayTopHero get dVa => _dVa;

  set dVa(QuickPlayTopHero dVa) => _dVa = dVa;

  QuickPlayTopHero get doomfist => _doomfist;

  set doomfist(QuickPlayTopHero doomfist) => _doomfist = doomfist;

  QuickPlayTopHero get echo => _echo;

  set echo(QuickPlayTopHero echo) => _echo = echo;

  QuickPlayTopHero get genji => _genji;

  set genji(QuickPlayTopHero genji) => _genji = genji;

  QuickPlayTopHero get hanzo => _hanzo;

  set hanzo(QuickPlayTopHero hanzo) => _hanzo = hanzo;

  QuickPlayTopHero get junkrat => _junkrat;

  set junkrat(QuickPlayTopHero junkrat) => _junkrat = junkrat;

  QuickPlayTopHero get lucio => _lucio;

  set lucio(QuickPlayTopHero lucio) => _lucio = lucio;

  QuickPlayTopHero get mccree => _mccree;

  set mccree(QuickPlayTopHero mccree) => _mccree = mccree;

  QuickPlayTopHero get mei => _mei;

  set mei(QuickPlayTopHero mei) => _mei = mei;

  QuickPlayTopHero get mercy => _mercy;

  set mercy(QuickPlayTopHero mercy) => _mercy = mercy;

  QuickPlayTopHero get moira => _moira;

  set moira(QuickPlayTopHero moira) => _moira = moira;

  QuickPlayTopHero get orisa => _orisa;

  set orisa(QuickPlayTopHero orisa) => _orisa = orisa;

  QuickPlayTopHero get pharah => _pharah;

  set pharah(QuickPlayTopHero pharah) => _pharah = pharah;

  QuickPlayTopHero get reaper => _reaper;

  set reaper(QuickPlayTopHero reaper) => _reaper = reaper;

  QuickPlayTopHero get reinhardt => _reinhardt;

  set reinhardt(QuickPlayTopHero reinhardt) => _reinhardt = reinhardt;

  QuickPlayTopHero get roadhog => _roadhog;

  set roadhog(QuickPlayTopHero roadhog) => _roadhog = roadhog;

  QuickPlayTopHero get sigma => _sigma;

  set sigma(QuickPlayTopHero sigma) => _sigma = sigma;

  QuickPlayTopHero get soldier76 => _soldier76;

  set soldier76(QuickPlayTopHero soldier76) => _soldier76 = soldier76;

  QuickPlayTopHero get sombra => _sombra;

  set sombra(QuickPlayTopHero sombra) => _sombra = sombra;

  QuickPlayTopHero get symmetra => _symmetra;

  set symmetra(QuickPlayTopHero symmetra) => _symmetra = symmetra;

  QuickPlayTopHero get torbjorn => _torbjorn;

  set torbjorn(QuickPlayTopHero torbjorn) => _torbjorn = torbjorn;

  QuickPlayTopHero get tracer => _tracer;

  set tracer(QuickPlayTopHero tracer) => _tracer = tracer;

  QuickPlayTopHero get widowmaker => _widowmaker;

  set widowmaker(QuickPlayTopHero widowmaker) => _widowmaker = widowmaker;

  QuickPlayTopHero get winston => _winston;

  set winston(QuickPlayTopHero winston) => _winston = winston;

  QuickPlayTopHero get wreckingBall => _wreckingBall;

  set wreckingBall(QuickPlayTopHero wreckingBall) =>
      _wreckingBall = wreckingBall;

  QuickPlayTopHero get zarya => _zarya;

  set zarya(QuickPlayTopHero zarya) => _zarya = zarya;

  QuickPlayTopHero get zenyatta => _zenyatta;

  set zenyatta(QuickPlayTopHero zenyatta) => _zenyatta = zenyatta;

  QuickPlayTopHeroes.fromJson(Map<String, dynamic> json) {
    _ana =
        json['ana'] != null ? new QuickPlayTopHero.fromJson(json['ana']) : null;
    _ashe = json['ashe'] != null
        ? new QuickPlayTopHero.fromJson(json['ashe'])
        : null;
    _baptiste = json['baptiste'] != null
        ? new QuickPlayTopHero.fromJson(json['baptiste'])
        : null;
    _bastion = json['bastion'] != null
        ? new QuickPlayTopHero.fromJson(json['bastion'])
        : null;
    _brigitte = json['brigitte'] != null
        ? new QuickPlayTopHero.fromJson(json['brigitte'])
        : null;
    _dVa =
        json['dVa'] != null ? new QuickPlayTopHero.fromJson(json['dVa']) : null;
    _doomfist = json['doomfist'] != null
        ? new QuickPlayTopHero.fromJson(json['doomfist'])
        : null;
    _echo = json['echo'] != null
        ? new QuickPlayTopHero.fromJson(json['echo'])
        : null;
    _genji = json['genji'] != null
        ? new QuickPlayTopHero.fromJson(json['genji'])
        : null;
    _hanzo = json['hanzo'] != null
        ? new QuickPlayTopHero.fromJson(json['hanzo'])
        : null;
    _junkrat = json['junkrat'] != null
        ? new QuickPlayTopHero.fromJson(json['junkrat'])
        : null;
    _lucio = json['lucio'] != null
        ? new QuickPlayTopHero.fromJson(json['lucio'])
        : null;
    _mccree = json['mccree'] != null
        ? new QuickPlayTopHero.fromJson(json['mccree'])
        : null;
    _mei =
        json['mei'] != null ? new QuickPlayTopHero.fromJson(json['mei']) : null;
    _mercy = json['mercy'] != null
        ? new QuickPlayTopHero.fromJson(json['mercy'])
        : null;
    _moira = json['moira'] != null
        ? new QuickPlayTopHero.fromJson(json['moira'])
        : null;
    _orisa = json['orisa'] != null
        ? new QuickPlayTopHero.fromJson(json['orisa'])
        : null;
    _pharah = json['pharah'] != null
        ? new QuickPlayTopHero.fromJson(json['pharah'])
        : null;
    _reaper = json['reaper'] != null
        ? new QuickPlayTopHero.fromJson(json['reaper'])
        : null;
    _reinhardt = json['reinhardt'] != null
        ? new QuickPlayTopHero.fromJson(json['reinhardt'])
        : null;
    _roadhog = json['roadhog'] != null
        ? new QuickPlayTopHero.fromJson(json['roadhog'])
        : null;
    _sigma = json['sigma'] != null
        ? new QuickPlayTopHero.fromJson(json['sigma'])
        : null;
    _soldier76 = json['soldier76'] != null
        ? new QuickPlayTopHero.fromJson(json['soldier76'])
        : null;
    _sombra = json['sombra'] != null
        ? new QuickPlayTopHero.fromJson(json['sombra'])
        : null;
    _symmetra = json['symmetra'] != null
        ? new QuickPlayTopHero.fromJson(json['symmetra'])
        : null;
    _torbjorn = json['torbjorn'] != null
        ? new QuickPlayTopHero.fromJson(json['torbjorn'])
        : null;
    _tracer = json['tracer'] != null
        ? new QuickPlayTopHero.fromJson(json['tracer'])
        : null;
    _widowmaker = json['widowmaker'] != null
        ? new QuickPlayTopHero.fromJson(json['widowmaker'])
        : null;
    _winston = json['winston'] != null
        ? new QuickPlayTopHero.fromJson(json['winston'])
        : null;
    _wreckingBall = json['wreckingBall'] != null
        ? new QuickPlayTopHero.fromJson(json['wreckingBall'])
        : null;
    _zarya = json['zarya'] != null
        ? new QuickPlayTopHero.fromJson(json['zarya'])
        : null;
    _zenyatta = json['zenyatta'] != null
        ? new QuickPlayTopHero.fromJson(json['zenyatta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._ana != null) {
      data['ana'] = this._ana.toJson();
    }
    if (this._ashe != null) {
      data['ashe'] = this._ashe.toJson();
    }
    if (this._baptiste != null) {
      data['baptiste'] = this._baptiste.toJson();
    }
    if (this._bastion != null) {
      data['bastion'] = this._bastion.toJson();
    }
    if (this._brigitte != null) {
      data['brigitte'] = this._brigitte.toJson();
    }
    if (this._dVa != null) {
      data['dVa'] = this._dVa.toJson();
    }
    if (this._doomfist != null) {
      data['doomfist'] = this._doomfist.toJson();
    }
    if (this._echo != null) {
      data['echo'] = this._echo.toJson();
    }
    if (this._genji != null) {
      data['genji'] = this._genji.toJson();
    }
    if (this._hanzo != null) {
      data['hanzo'] = this._hanzo.toJson();
    }
    if (this._junkrat != null) {
      data['junkrat'] = this._junkrat.toJson();
    }
    if (this._lucio != null) {
      data['lucio'] = this._lucio.toJson();
    }
    if (this._mccree != null) {
      data['mccree'] = this._mccree.toJson();
    }
    if (this._mei != null) {
      data['mei'] = this._mei.toJson();
    }
    if (this._mercy != null) {
      data['mercy'] = this._mercy.toJson();
    }
    if (this._moira != null) {
      data['moira'] = this._moira.toJson();
    }
    if (this._orisa != null) {
      data['orisa'] = this._orisa.toJson();
    }
    if (this._pharah != null) {
      data['pharah'] = this._pharah.toJson();
    }
    if (this._reaper != null) {
      data['reaper'] = this._reaper.toJson();
    }
    if (this._reinhardt != null) {
      data['reinhardt'] = this._reinhardt.toJson();
    }
    if (this._roadhog != null) {
      data['roadhog'] = this._roadhog.toJson();
    }
    if (this._sigma != null) {
      data['sigma'] = this._sigma.toJson();
    }
    if (this._soldier76 != null) {
      data['soldier76'] = this._soldier76.toJson();
    }
    if (this._sombra != null) {
      data['sombra'] = this._sombra.toJson();
    }
    if (this._symmetra != null) {
      data['symmetra'] = this._symmetra.toJson();
    }
    if (this._torbjorn != null) {
      data['torbjorn'] = this._torbjorn.toJson();
    }
    if (this._tracer != null) {
      data['tracer'] = this._tracer.toJson();
    }
    if (this._widowmaker != null) {
      data['widowmaker'] = this._widowmaker.toJson();
    }
    if (this._winston != null) {
      data['winston'] = this._winston.toJson();
    }
    if (this._wreckingBall != null) {
      data['wreckingBall'] = this._wreckingBall.toJson();
    }
    if (this._zarya != null) {
      data['zarya'] = this._zarya.toJson();
    }
    if (this._zenyatta != null) {
      data['zenyatta'] = this._zenyatta.toJson();
    }
    return data;
  }
}

class QuickPlayTopHero {
  DateTime _timePlayed;
  int _gamesWon;
  int _winPercentage;
  int _weaponAccuracy;
  double _eliminationsPerLife;
  int _multiKillBest;
  int _objectiveKills;

  QuickPlayTopHero(
      {DateTime timePlayed,
      int gamesWon,
      int winPercentage,
      int weaponAccuracy,
      double eliminationsPerLife,
      int multiKillBest,
      int objectiveKills}) {
    this._timePlayed = timePlayed;
    this._gamesWon = gamesWon;
    this._winPercentage = winPercentage;
    this._weaponAccuracy = weaponAccuracy;
    this._eliminationsPerLife = eliminationsPerLife;
    this._multiKillBest = multiKillBest;
    this._objectiveKills = objectiveKills;
  }

  DateTime get timePlayed => _timePlayed;

  set timePlayed(DateTime timePlayed) => _timePlayed = timePlayed;

  int get gamesWon => _gamesWon;

  set gamesWon(int gamesWon) => _gamesWon = gamesWon;

  int get winPercentage => _winPercentage;

  set winPercentage(int winPercentage) => _winPercentage = winPercentage;

  int get weaponAccuracy => _weaponAccuracy;

  set weaponAccuracy(int weaponAccuracy) => _weaponAccuracy = weaponAccuracy;

  double get eliminationsPerLife => _eliminationsPerLife;

  set eliminationsPerLife(double eliminationsPerLife) =>
      _eliminationsPerLife = eliminationsPerLife;

  int get multiKillBest => _multiKillBest;

  set multiKillBest(int multiKillBest) => _multiKillBest = multiKillBest;

  int get objectiveKills => _objectiveKills;

  set objectiveKills(int objectiveKills) => _objectiveKills = objectiveKills;

  QuickPlayTopHero.fromJson(Map<String, dynamic> json) {
    if (RegExp(r"\d\d:\d\d:\d\d").hasMatch(json['timePlayed'])) {
      _timePlayed = DateTime.parse(
          GlobalVariables.standardConversionDate + json['timePlayed'] + ".000");
    } else {
      _timePlayed = DateTime.parse(GlobalVariables.standardConversionDate +
          "00:" +
          json['timePlayed'] +
          ".000");
    }
    _gamesWon = json['gamesWon'];
    _winPercentage = json['winPercentage'];
    _weaponAccuracy = json['weaponAccuracy'];
    _eliminationsPerLife = json['eliminationsPerLife'].toDouble();
    _multiKillBest = json['multiKillBest'];
    _objectiveKills = json['objectiveKills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timePlayed'] = this._timePlayed;
    data['gamesWon'] = this._gamesWon;
    data['winPercentage'] = this._winPercentage;
    data['weaponAccuracy'] = this._weaponAccuracy;
    data['eliminationsPerLife'] = this._eliminationsPerLife;
    data['multiKillBest'] = this._multiKillBest;
    data['objectiveKills'] = this._objectiveKills;
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
