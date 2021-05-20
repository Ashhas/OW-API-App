import 'package:ow_api_app/data/util/strings.dart';

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
  TopHeroes _topHeroes;

  CompetitiveStats({Awards awards, Games games, TopHeroes topHeroes}) {
    this._awards = awards;
    this._games = games;
    this._topHeroes = topHeroes;
  }

  Awards get awards => _awards;

  set awards(Awards awards) => _awards = awards;

  Games get games => _games;

  set games(Games games) => _games = games;

  TopHeroes get topHeroes => _topHeroes;

  set topHeroes(TopHeroes topHeroes) => _topHeroes = topHeroes;

  CompetitiveStats.fromJson(Map<String, dynamic> json) {
    _awards =
        json['awards'] != null ? new Awards.fromJson(json['awards']) : null;
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
    if (this._games != null) {
      data['games'] = this._games.toJson();
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
