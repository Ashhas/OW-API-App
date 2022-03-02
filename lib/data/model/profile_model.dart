import 'package:ow_api_app/utils/constants.dart';

class Profile {
  CompetitiveStats? competitiveStats;
  int? endorsement;
  String? endorsementIcon;
  int? gamesWon;
  String? icon;
  int? level;
  String? levelIcon;
  String? name;
  int? prestige;
  String? prestigeIcon;
  late bool private;
  int? rating;
  String? ratingIcon;
  Ratings? ratings;

  Profile({
    this.competitiveStats,
    this.endorsement,
    this.endorsementIcon,
    this.gamesWon,
    this.icon,
    this.level,
    this.levelIcon,
    this.name,
    this.prestige,
    this.prestigeIcon,
    required this.private,
    this.rating,
    this.ratingIcon,
    this.ratings,
  });

  CompetitiveStats? get getCompetitiveStats => competitiveStats;

  set setCompetitiveStats(CompetitiveStats competitiveStats) =>
      competitiveStats = competitiveStats;

  int? get getEndorsement => endorsement;

  set setEndorsement(int endorsement) => endorsement = endorsement;

  String? get getEndorsementIcon => endorsementIcon;

  set setEndorsementIcon(String endorsementIcon) =>
      endorsementIcon = endorsementIcon;

  int? get getGamesWon => gamesWon;

  set setGamesWon(int gamesWon) => gamesWon = gamesWon;

  String? get getIcon => icon;

  set setIcon(String icon) => icon = icon;

  int? get getLevel => level;

  set setLevel(int level) => level = level;

  String? get getLevelIcon => levelIcon;

  set setLevelIcon(String levelIcon) => levelIcon = levelIcon;

  String? get getName => name;

  set setName(String name) => name = name;

  int? get getPrestige => prestige;

  set setPrestige(int prestige) => prestige = prestige;

  String? get getPrestigeIcon => prestigeIcon;

  set setPrestigeIcon(String prestigeIcon) => prestigeIcon = prestigeIcon;

  bool? get getPrivate => private;

  set setPrivate(bool private) => private = private;

  int? get getRating => rating;

  set setRating(int rating) => rating = rating;

  String? get getRatingIcon => ratingIcon;

  set setRatingIcon(String ratingIcon) => ratingIcon = ratingIcon;

  Ratings? get getRatings => ratings;

  set setRatings(Ratings ratings) => ratings = ratings;

  Profile.fromJson(Map<String, dynamic> json) {
    competitiveStats = json['competitiveStats'] != null
        ? CompetitiveStats.fromJson(json['competitiveStats'])
        : null;
    endorsement = json['endorsement'];
    endorsementIcon = json['endorsementIcon'];
    gamesWon = json['gamesWon'];
    icon = json['icon'];
    level = json['level'];
    levelIcon = json['levelIcon'];
    name = json['name'];
    prestige = json['prestige'];
    prestigeIcon = json['prestigeIcon'];
    private = json['private'];
    rating = json['rating'];
    ratingIcon = json['ratingIcon'];
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (competitiveStats != null) {
      data['competitiveStats'] = competitiveStats?.toJson();
    }
    data['endorsement'] = endorsement;
    data['endorsementIcon'] = endorsementIcon;
    data['gamesWon'] = gamesWon;
    data['icon'] = icon;
    data['level'] = level;
    data['levelIcon'] = levelIcon;
    data['name'] = name;
    data['prestige'] = prestige;
    data['prestigeIcon'] = prestigeIcon;
    data['private'] = private;
    data['rating'] = rating;
    data['ratingIcon'] = ratingIcon;
    if (ratings != null) {
      data['ratings'] = ratings?.toJson();
    }
    return data;
  }
}

class CompetitiveStats {
  Awards? awards;
  CareerStats? careerStats;
  Games? games;
  TopHeroes? topHeroes;

  CompetitiveStats({
    this.awards,
    this.careerStats,
    this.games,
    this.topHeroes,
  });

  Awards? get getAwards => awards;

  set setAwards(Awards awards) => awards = awards;

  CareerStats? get getCareerStats => careerStats;

  set setCareerStats(CareerStats careerStats) => careerStats = careerStats;

  Games? get getGames => games;

  set setGames(Games games) => games = games;

  TopHeroes? get getTopHeroes => topHeroes;

  set setTopHeroes(TopHeroes topHeroes) => topHeroes = topHeroes;

  CompetitiveStats.fromJson(Map<String, dynamic> json) {
    awards = json['awards'] != null ? Awards.fromJson(json['awards']) : null;
    careerStats = json['careerStats'] != null
        ? CareerStats.fromJson(json['careerStats'])
        : null;
    games = json['games'] != null ? Games.fromJson(json['games']) : null;
    topHeroes = json['topHeroes'] != null
        ? TopHeroes.fromJson(json['topHeroes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (awards != null) {
      data['awards'] = awards?.toJson();
    }
    if (careerStats != null) {
      data['careerStats'] = careerStats?.toJson();
    }
    if (games != null) {
      data['game'] = games?.toJson();
    }
    if (topHeroes != null) {
      data['topHeroes'] = topHeroes?.toJson();
    }
    return data;
  }
}

class Awards {
  int? cards;
  int? medals;
  int? medalsBronze;
  int? medalsSilver;
  int? medalsGold;

  Awards({
    this.cards,
    this.medals,
    this.medalsBronze,
    this.medalsSilver,
    this.medalsGold,
  });

  int? get getCards => cards;

  set setCards(int cards) => cards = cards;

  int? get getMedals => medals;

  set setMedals(int medals) => medals = medals;

  int? get getMedalsBronze => medalsBronze;

  set setMedalsBronze(int medalsBronze) => medalsBronze = medalsBronze;

  int? get getMedalsSilver => medalsSilver;

  set setMedalsSilver(int medalsSilver) => medalsSilver = medalsSilver;

  int? get getMedalsGold => medalsGold;

  set setMedalsGold(int medalsGold) => medalsGold = medalsGold;

  Awards.fromJson(Map<String, dynamic> json) {
    cards = json['cards'];
    medals = json['medals'];
    medalsBronze = json['medalsBronze'];
    medalsSilver = json['medalsSilver'];
    medalsGold = json['medalsGold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cards'] = cards;
    data['medals'] = medals;
    data['medalsBronze'] = medalsBronze;
    data['medalsSilver'] = medalsSilver;
    data['medalsGold'] = medalsGold;
    return data;
  }
}

class CareerStats {
  AllHeroes? allHeroes;
  Hero? ana;
  Hero? ashe;
  Hero? baptiste;
  Hero? bastion;
  Hero? brigitte;
  Hero? dVa;
  Hero? doomfist;
  Hero? echo;
  Hero? genji;
  Hero? hanzo;
  Hero? junkrat;
  Hero? lucio;
  Hero? mccree;
  Hero? mei;
  Hero? mercy;
  Hero? moira;
  Hero? orisa;
  Hero? pharah;
  Hero? reaper;
  Hero? reinhardt;
  Hero? roadhog;
  Hero? sigma;
  Hero? soldier76;
  Hero? sombra;
  Hero? symmetra;
  Hero? torbjorn;
  Hero? tracer;
  Hero? widowmaker;
  Hero? winston;
  Hero? wreckingBall;
  Hero? zarya;
  Hero? zenyatta;

  CareerStats({
    this.allHeroes,
    this.ana,
    this.ashe,
    this.baptiste,
    this.bastion,
    this.brigitte,
    this.dVa,
    this.doomfist,
    this.echo,
    this.genji,
    this.hanzo,
    this.junkrat,
    this.lucio,
    this.mccree,
    this.mei,
    this.mercy,
    this.moira,
    this.orisa,
    this.pharah,
    this.reaper,
    this.reinhardt,
    this.roadhog,
    this.sigma,
    this.soldier76,
    this.sombra,
    this.symmetra,
    this.torbjorn,
    this.tracer,
    this.widowmaker,
    this.winston,
    this.wreckingBall,
    this.zarya,
    this.zenyatta,
  });

  AllHeroes? get getAllHeroes => allHeroes;

  set setAllHeroes(AllHeroes allHeroes) => allHeroes = allHeroes;

  Hero? get getAna => ana;

  set setAna(Hero ana) => ana = ana;

  Hero? get getAshe => ashe;

  set setAshe(Hero ashe) => ashe = ashe;

  Hero? get getBaptiste => baptiste;

  set setBaptiste(Hero baptiste) => baptiste = baptiste;

  Hero? get getBastion => bastion;

  set setBastion(Hero bastion) => bastion = bastion;

  Hero? get getBrigitte => brigitte;

  set setBrigitte(Hero brigitte) => brigitte = brigitte;

  Hero? get getDVa => dVa;

  set setDVa(Hero dVa) => dVa = dVa;

  Hero? get getDoomfist => doomfist;

  set setDoomfist(Hero doomfist) => doomfist = doomfist;

  Hero? get getEcho => echo;

  set setEcho(Hero echo) => echo = echo;

  Hero? get getGenji => genji;

  set setGenji(Hero genji) => genji = genji;

  Hero? get getHanzo => hanzo;

  set setHanzo(Hero hanzo) => hanzo = hanzo;

  Hero? get getJunkrat => junkrat;

  set setJunkrat(Hero junkrat) => junkrat = junkrat;

  Hero? get getLucio => lucio;

  set setLucio(Hero lucio) => lucio = lucio;

  Hero? get getMccree => mccree;

  set setMccree(Hero mccree) => mccree = mccree;

  Hero? get getMei => mei;

  set setMei(Hero mei) => mei = mei;

  Hero? get getNercy => mercy;

  set setMercy(Hero mercy) => mercy = mercy;

  Hero? get getMoira => moira;

  set setMoira(Hero moira) => moira = moira;

  Hero? get getOrisa => orisa;

  set setOrisa(Hero orisa) => orisa = orisa;

  Hero? get getPharah => pharah;

  set setPharah(Hero pharah) => pharah = pharah;

  Hero? get getReaper => reaper;

  set setReaper(Hero reaper) => reaper = reaper;

  Hero? get getReinhardt => reinhardt;

  set setReinhardt(Hero reinhardt) => reinhardt = reinhardt;

  Hero? get getRoadhog => roadhog;

  set setRoadhog(Hero roadhog) => roadhog = roadhog;

  Hero? get getSigma => sigma;

  set setSigma(Hero sigma) => sigma = sigma;

  Hero? get getSoldier76 => soldier76;

  set setSoldier76(Hero soldier76) => soldier76 = soldier76;

  Hero? get getSombra => sombra;

  set setSombra(Hero sombra) => sombra = sombra;

  Hero? get getSymmetra => symmetra;

  set setSymmetra(Hero symmetra) => symmetra = symmetra;

  Hero? get getTorbjorn => torbjorn;

  set setTorbjorn(Hero torbjorn) => torbjorn = torbjorn;

  Hero? get getTracer => tracer;

  set setTracer(Hero tracer) => tracer = tracer;

  Hero? get getWidowmaker => widowmaker;

  set setWidowmaker(Hero widowmaker) => widowmaker = widowmaker;

  Hero? get getWinston => winston;

  set setWinston(Hero winston) => winston = winston;

  Hero? get getWreckingBall => wreckingBall;

  set setWreckingBall(Hero wreckingBall) => wreckingBall = wreckingBall;

  Hero? get getZarya => zarya;

  set setZarya(Hero zarya) => zarya = zarya;

  Hero? get getZenyatta => zenyatta;

  set setZenyatta(Hero zenyatta) => zenyatta = zenyatta;

  CareerStats.fromJson(Map<String, dynamic> json) {
    allHeroes = json['allHeroes'] != null
        ? AllHeroes.fromJson(json['allHeroes'])
        : null;
    ana = json['ana'] != null ? Hero.fromJson(json['ana']) : null;
    ashe = json['ashe'] != null ? Hero.fromJson(json['ashe']) : null;
    baptiste =
        json['baptiste'] != null ? Hero.fromJson(json['baptiste']) : null;
    bastion = json['bastion'] != null ? Hero.fromJson(json['bastion']) : null;
    brigitte =
        json['brigitte'] != null ? Hero.fromJson(json['brigitte']) : null;
    dVa = json['dVa'] != null ? Hero.fromJson(json['dVa']) : null;
    doomfist =
        json['doomfist'] != null ? Hero.fromJson(json['doomfist']) : null;
    echo = json['echo'] != null ? Hero.fromJson(json['echo']) : null;
    genji = json['genji'] != null ? Hero.fromJson(json['genji']) : null;
    hanzo = json['hanzo'] != null ? Hero.fromJson(json['hanzo']) : null;
    junkrat = json['junkrat'] != null ? Hero.fromJson(json['junkrat']) : null;
    lucio = json['lucio'] != null ? Hero.fromJson(json['lucio']) : null;
    mccree = json['mccree'] != null ? Hero.fromJson(json['mccree']) : null;
    mei = json['mei'] != null ? Hero.fromJson(json['mei']) : null;
    mercy = json['mercy'] != null ? Hero.fromJson(json['mercy']) : null;
    moira = json['moira'] != null ? Hero.fromJson(json['moira']) : null;
    orisa = json['orisa'] != null ? Hero.fromJson(json['orisa']) : null;
    pharah = json['pharah'] != null ? Hero.fromJson(json['pharah']) : null;
    reaper = json['reaper'] != null ? Hero.fromJson(json['reaper']) : null;
    reinhardt =
        json['reinhardt'] != null ? Hero.fromJson(json['reinhardt']) : null;
    roadhog = json['roadhog'] != null ? Hero.fromJson(json['roadhog']) : null;
    sigma = json['sigma'] != null ? Hero.fromJson(json['sigma']) : null;
    soldier76 =
        json['soldier76'] != null ? Hero.fromJson(json['soldier76']) : null;
    sombra = json['sombra'] != null ? Hero.fromJson(json['sombra']) : null;
    symmetra =
        json['symmetra'] != null ? Hero.fromJson(json['symmetra']) : null;
    torbjorn =
        json['torbjorn'] != null ? Hero.fromJson(json['torbjorn']) : null;
    tracer = json['tracer'] != null ? Hero.fromJson(json['tracer']) : null;
    widowmaker =
        json['widowmaker'] != null ? Hero.fromJson(json['widowmaker']) : null;
    winston = json['winston'] != null ? Hero.fromJson(json['winston']) : null;
    wreckingBall = json['wreckingBall'] != null
        ? Hero.fromJson(json['wreckingBall'])
        : null;
    zarya = json['zarya'] != null ? Hero.fromJson(json['zarya']) : null;
    zenyatta =
        json['zenyatta'] != null ? Hero.fromJson(json['zenyatta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allHeroes != null) {
      data['allHeroes'] = allHeroes?.toJson();
    }
    return data;
  }
}

class AllHeroes {
  Assists? assists;
  Average? average;
  Best? best;
  Combat? combat;
  void deaths;
  void heroSpecific;
  Game? game;
  MatchAwards? matchAwards;
  Miscellaneous? miscellaneous;

  AllHeroes({
    this.assists,
    this.average,
    this.best,
    this.combat,
    this.deaths,
    this.heroSpecific,
    this.game,
    this.matchAwards,
    this.miscellaneous,
  });

  Assists? get getAssists => assists;

  set setAssists(Assists assists) => assists = assists;

  Average? get getAverage => average;

  set setAverage(Average average) => average = average;

  Best? get getBest => best;

  set setBest(Best best) => best = best;

  Combat? get getCombat => combat;

  set setCombat(Combat combat) => combat = combat;

  Game? get getGame => game;

  set setGame(Game game) => game = game;

  MatchAwards? get getMatchAwards => matchAwards;

  set setMatchAwards(MatchAwards matchAwards) => matchAwards = matchAwards;

  Miscellaneous? get getMiscellaneous => miscellaneous;

  set setMiscellaneous(Miscellaneous miscellaneous) =>
      miscellaneous = miscellaneous;

  AllHeroes.fromJson(Map<String, dynamic> json) {
    assists =
        json['assists'] != null ? Assists.fromJson(json['assists']) : null;
    average =
        json['average'] != null ? Average.fromJson(json['average']) : null;
    best = json['best'] != null ? Best.fromJson(json['best']) : null;
    combat = json['combat'] != null ? Combat.fromJson(json['combat']) : null;
    game = json['game'] != null ? Game.fromJson(json['game']) : null;
    matchAwards = json['matchAwards'] != null
        ? MatchAwards.fromJson(json['matchAwards'])
        : null;
    miscellaneous = json['miscellaneous'] != null
        ? Miscellaneous.fromJson(json['miscellaneous'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (assists != null) {
      data['assists'] = assists?.toJson();
    }
    if (average != null) {
      data['average'] = average?.toJson();
    }
    if (best != null) {
      data['best'] = best?.toJson();
    }
    if (combat != null) {
      data['combat'] = combat?.toJson();
    }
    if (game != null) {
      data['game'] = game?.toJson();
    }
    if (matchAwards != null) {
      data['matchAwards'] = matchAwards?.toJson();
    }
    if (miscellaneous != null) {
      data['miscellaneous'] = miscellaneous?.toJson();
    }
    return data;
  }
}

class Hero {
  Game? allHeroGame;

  Hero({
    this.allHeroGame,
  });

  Game? get getAllHeroGame => allHeroGame;

  set setAllHeroGame(Game allHeroGame) => allHeroGame = allHeroGame;

  Hero.fromJson(Map<String, dynamic> json) {
    allHeroGame = json['game'] != null ? Game.fromJson(json['game']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timePlayed'] = allHeroGame;
    return data;
  }
}

class Assists {
  int? defensiveAssists;
  int? healingDone;
  int? offensiveAssists;

  Assists({
    this.defensiveAssists,
    this.healingDone,
    this.offensiveAssists,
  });

  int? get getDefensiveAssists => defensiveAssists;

  set setDefensiveAssists(int defensiveAssists) =>
      defensiveAssists = defensiveAssists;

  int? get getHealingDone => healingDone;

  set setHealingDone(int healingDone) => healingDone = healingDone;

  int? get getOffensiveAssists => offensiveAssists;

  set setOffensiveAssists(int offensiveAssists) =>
      offensiveAssists = offensiveAssists;

  Assists.fromJson(Map<String, dynamic> json) {
    defensiveAssists = json['defensiveAssists'];
    healingDone = json['healingDone'];
    offensiveAssists = json['offensiveAssists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['defensiveAssists'] = defensiveAssists;
    data['healingDone'] = healingDone;
    data['offensiveAssists'] = offensiveAssists;
    return data;
  }
}

class Average {
  double? allDamageDoneAvgPer10Min;
  double? barrierDamageDoneAvgPer10Min;
  double? deathsAvgPer10Min;
  double? eliminationsAvgPer10Min;
  double? finalBlowsAvgPer10Min;
  double? healingDoneAvgPer10Min;
  double? heroDamageDoneAvgPer10Min;
  double? objectiveKillsAvgPer10Min;
  String? objectiveTimeAvgPer10Min;
  double? soloKillsAvgPer10Min;
  String? timeSpentOnFireAvgPer10Min;

  Average({
    this.allDamageDoneAvgPer10Min,
    this.barrierDamageDoneAvgPer10Min,
    this.deathsAvgPer10Min,
    this.eliminationsAvgPer10Min,
    this.finalBlowsAvgPer10Min,
    this.healingDoneAvgPer10Min,
    this.heroDamageDoneAvgPer10Min,
    this.objectiveKillsAvgPer10Min,
    this.objectiveTimeAvgPer10Min,
    this.soloKillsAvgPer10Min,
    this.timeSpentOnFireAvgPer10Min,
  });

  double? get getAllDamageDoneAvgPer10Min => allDamageDoneAvgPer10Min;

  set setAllDamageDoneAvgPer10Min(double allDamageDoneAvgPer10Min) =>
      allDamageDoneAvgPer10Min = allDamageDoneAvgPer10Min;

  double? get getBarrierDamageDoneAvgPer10Min => barrierDamageDoneAvgPer10Min;

  set setBarrierDamageDoneAvgPer10Min(double barrierDamageDoneAvgPer10Min) =>
      barrierDamageDoneAvgPer10Min = barrierDamageDoneAvgPer10Min;

  double? get getDeathsAvgPer10Min => deathsAvgPer10Min;

  set setDeathsAvgPer10Min(double deathsAvgPer10Min) =>
      deathsAvgPer10Min = deathsAvgPer10Min;

  double? get getEliminationsAvgPer10Min => eliminationsAvgPer10Min;

  set setEliminationsAvgPer10Min(double eliminationsAvgPer10Min) =>
      eliminationsAvgPer10Min = eliminationsAvgPer10Min;

  double? get getFinalBlowsAvgPer10Min => finalBlowsAvgPer10Min;

  set setFinalBlowsAvgPer10Min(double finalBlowsAvgPer10Min) =>
      finalBlowsAvgPer10Min = finalBlowsAvgPer10Min;

  double? get getHealingDoneAvgPer10Min => healingDoneAvgPer10Min;

  set setHealingDoneAvgPer10Min(double healingDoneAvgPer10Min) =>
      healingDoneAvgPer10Min = healingDoneAvgPer10Min;

  double? get getHeroDamageDoneAvgPer10Min => heroDamageDoneAvgPer10Min;

  set setHeroDamageDoneAvgPer10Min(double heroDamageDoneAvgPer10Min) =>
      heroDamageDoneAvgPer10Min = heroDamageDoneAvgPer10Min;

  double? get getObjectiveKillsAvgPer10Min => objectiveKillsAvgPer10Min;

  set setObjectiveKillsAvgPer10Min(double objectiveKillsAvgPer10Min) =>
      objectiveKillsAvgPer10Min = objectiveKillsAvgPer10Min;

  String? get getObjectiveTimeAvgPer10Min => objectiveTimeAvgPer10Min;

  set setObjectiveTimeAvgPer10Min(String objectiveTimeAvgPer10Min) =>
      objectiveTimeAvgPer10Min = objectiveTimeAvgPer10Min;

  double? get getSoloKillsAvgPer10Min => soloKillsAvgPer10Min;

  set setSoloKillsAvgPer10Min(double soloKillsAvgPer10Min) =>
      soloKillsAvgPer10Min = soloKillsAvgPer10Min;

  String? get getTimeSpentOnFireAvgPer10Min => timeSpentOnFireAvgPer10Min;

  set setTimeSpentOnFireAvgPer10Min(String timeSpentOnFireAvgPer10Min) =>
      timeSpentOnFireAvgPer10Min = timeSpentOnFireAvgPer10Min;

  Average.fromJson(Map<String, dynamic> json) {
    allDamageDoneAvgPer10Min = json['allDamageDoneAvgPer10Min'] != null
        ? json['allDamageDoneAvgPer10Min'].toDouble()
        : null;
    barrierDamageDoneAvgPer10Min = json['barrierDamageDoneAvgPer10Min'] != null
        ? json['barrierDamageDoneAvgPer10Min'].toDouble()
        : null;
    deathsAvgPer10Min = json['deathsAvgPer10Min'] != null
        ? json['deathsAvgPer10Min'].toDouble()
        : null;
    eliminationsAvgPer10Min = json['eliminationsAvgPer10Min'] != null
        ? json['eliminationsAvgPer10Min'].toDouble()
        : null;
    finalBlowsAvgPer10Min = json['finalBlowsAvgPer10Min'] != null
        ? json['finalBlowsAvgPer10Min'].toDouble()
        : null;
    healingDoneAvgPer10Min = json['healingDoneAvgPer10Min'] != null
        ? json['healingDoneAvgPer10Min'].toDouble()
        : null;
    heroDamageDoneAvgPer10Min = json['heroDamageDoneAvgPer10Min'] != null
        ? json['heroDamageDoneAvgPer10Min'].toDouble()
        : null;
    objectiveKillsAvgPer10Min = json['objectiveKillsAvgPer10Min'] != null
        ? json['objectiveKillsAvgPer10Min'].toDouble()
        : null;
    objectiveTimeAvgPer10Min = json['objectiveTimeAvgPer10Min'];
    soloKillsAvgPer10Min = json['soloKillsAvgPer10Min'] != null
        ? json['soloKillsAvgPer10Min'].toDouble()
        : null;
    timeSpentOnFireAvgPer10Min = json['timeSpentOnFireAvgPer10Min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allDamageDoneAvgPer10Min'] = allDamageDoneAvgPer10Min;
    data['barrierDamageDoneAvgPer10Min'] = barrierDamageDoneAvgPer10Min;
    data['deathsAvgPer10Min'] = deathsAvgPer10Min;
    data['eliminationsAvgPer10Min'] = eliminationsAvgPer10Min;
    data['finalBlowsAvgPer10Min'] = finalBlowsAvgPer10Min;
    data['healingDoneAvgPer10Min'] = healingDoneAvgPer10Min;
    data['heroDamageDoneAvgPer10Min'] = heroDamageDoneAvgPer10Min;
    data['objectiveKillsAvgPer10Min'] = objectiveKillsAvgPer10Min;
    data['objectiveTimeAvgPer10Min'] = objectiveTimeAvgPer10Min;
    data['soloKillsAvgPer10Min'] = soloKillsAvgPer10Min;
    data['timeSpentOnFireAvgPer10Min'] = timeSpentOnFireAvgPer10Min;
    return data;
  }
}

class Best {
  int? allDamageDoneMostInGame;
  int? barrierDamageDoneMostInGame;
  int? defensiveAssistsMostInGame;
  int? eliminationsMostInGame;
  int? environmentalKillsMostInGame;
  int? finalBlowsMostInGame;
  int? healingDoneMostInGame;
  int? heroDamageDoneMostInGame;
  int? killsStreakBest;
  int? meleeFinalBlowsMostInGame;
  int? multiKillsBest;
  int? objectiveKillsMostInGame;
  String? objectiveTimeMostInGame;
  int? offensiveAssistsMostInGame;
  int? soloKillsMostInGame;
  String? timeSpentOnFireMostInGame;
  int? turretsDestroyedMostInGame;

  Best({
    this.allDamageDoneMostInGame,
    this.barrierDamageDoneMostInGame,
    this.defensiveAssistsMostInGame,
    this.eliminationsMostInGame,
    this.environmentalKillsMostInGame,
    this.finalBlowsMostInGame,
    this.healingDoneMostInGame,
    this.heroDamageDoneMostInGame,
    this.killsStreakBest,
    this.meleeFinalBlowsMostInGame,
    this.multiKillsBest,
    this.objectiveKillsMostInGame,
    this.objectiveTimeMostInGame,
    this.offensiveAssistsMostInGame,
    this.soloKillsMostInGame,
    this.timeSpentOnFireMostInGame,
    this.turretsDestroyedMostInGame,
  });

  int? get getAllDamageDoneMostInGame => allDamageDoneMostInGame;

  set setAllDamageDoneMostInGame(int allDamageDoneMostInGame) =>
      allDamageDoneMostInGame = allDamageDoneMostInGame;

  int? get getBarrierDamageDoneMostInGame => barrierDamageDoneMostInGame;

  set setBarrierDamageDoneMostInGame(int barrierDamageDoneMostInGame) =>
      barrierDamageDoneMostInGame = barrierDamageDoneMostInGame;

  int? get getDefensiveAssistsMostInGame => defensiveAssistsMostInGame;

  set setDefensiveAssistsMostInGame(int defensiveAssistsMostInGame) =>
      defensiveAssistsMostInGame = defensiveAssistsMostInGame;

  int? get getEliminationsMostInGame => eliminationsMostInGame;

  set setEliminationsMostInGame(int eliminationsMostInGame) =>
      eliminationsMostInGame = eliminationsMostInGame;

  int? get getEnvironmentalKillsMostInGame => environmentalKillsMostInGame;

  set setEnvironmentalKillsMostInGame(int environmentalKillsMostInGame) =>
      environmentalKillsMostInGame = environmentalKillsMostInGame;

  int? get getFinalBlowsMostInGame => finalBlowsMostInGame;

  set setFinalBlowsMostInGame(int finalBlowsMostInGame) =>
      finalBlowsMostInGame = finalBlowsMostInGame;

  int? get getHealingDoneMostInGame => healingDoneMostInGame;

  set setHealingDoneMostInGame(int healingDoneMostInGame) =>
      healingDoneMostInGame = healingDoneMostInGame;

  int? get getHeroDamageDoneMostInGame => heroDamageDoneMostInGame;

  set setHeroDamageDoneMostInGame(int heroDamageDoneMostInGame) =>
      heroDamageDoneMostInGame = heroDamageDoneMostInGame;

  int? get getKillsStreakBest => killsStreakBest;

  set setKillsStreakBest(int killsStreakBest) =>
      killsStreakBest = killsStreakBest;

  int? get getMeleeFinalBlowsMostInGame => meleeFinalBlowsMostInGame;

  set setMeleeFinalBlowsMostInGame(int meleeFinalBlowsMostInGame) =>
      meleeFinalBlowsMostInGame = meleeFinalBlowsMostInGame;

  int? get getMultiKillsBest => multiKillsBest;

  set setMultiKillsBest(int multikillsBest) => multikillsBest = multikillsBest;

  int? get getObjectiveKillsMostInGame => objectiveKillsMostInGame;

  set setObjectiveKillsMostInGame(int objectiveKillsMostInGame) =>
      objectiveKillsMostInGame = objectiveKillsMostInGame;

  String? get getObjectiveTimeMostInGame => objectiveTimeMostInGame;

  set setObjectiveTimeMostInGame(String objectiveTimeMostInGame) =>
      objectiveTimeMostInGame = objectiveTimeMostInGame;

  int? get getOffensiveAssistsMostInGame => offensiveAssistsMostInGame;

  set setOffensiveAssistsMostInGame(int offensiveAssistsMostInGame) =>
      offensiveAssistsMostInGame = offensiveAssistsMostInGame;

  int? get getSoloKillsMostInGame => soloKillsMostInGame;

  set setSoloKillsMostInGame(int soloKillsMostInGame) =>
      soloKillsMostInGame = soloKillsMostInGame;

  String? get getTimeSpentOnFireMostInGame => timeSpentOnFireMostInGame;

  set setTimeSpentOnFireMostInGame(String timeSpentOnFireMostInGame) =>
      timeSpentOnFireMostInGame = timeSpentOnFireMostInGame;

  int? get getTurretsDestroyedMostInGame => turretsDestroyedMostInGame;

  set setTurretsDestroyedMostInGame(int turretsDestroyedMostInGame) =>
      turretsDestroyedMostInGame = turretsDestroyedMostInGame;

  Best.fromJson(Map<String, dynamic> json) {
    allDamageDoneMostInGame = json['allDamageDoneMostInGame'];
    barrierDamageDoneMostInGame = json['barrierDamageDoneMostInGame'];
    defensiveAssistsMostInGame = json['defensiveAssistsMostInGame'];
    eliminationsMostInGame = json['eliminationsMostInGame'];
    environmentalKillsMostInGame = json['environmentalKillsMostInGame'];
    finalBlowsMostInGame = json['finalBlowsMostInGame'];
    healingDoneMostInGame = json['healingDoneMostInGame'];
    heroDamageDoneMostInGame = json['heroDamageDoneMostInGame'];
    killsStreakBest = json['killsStreakBest'];
    meleeFinalBlowsMostInGame = json['meleeFinalBlowsMostInGame'];
    multiKillsBest = json['multikillsBest'];
    objectiveKillsMostInGame = json['objectiveKillsMostInGame'];
    objectiveTimeMostInGame = json['objectiveTimeMostInGame'];
    offensiveAssistsMostInGame = json['offensiveAssistsMostInGame'];
    soloKillsMostInGame = json['soloKillsMostInGame'];
    timeSpentOnFireMostInGame = json['timeSpentOnFireMostInGame'];
    turretsDestroyedMostInGame = json['turretsDestroyedMostInGame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allDamageDoneMostInGame'] = allDamageDoneMostInGame;
    data['barrierDamageDoneMostInGame'] = barrierDamageDoneMostInGame;
    data['defensiveAssistsMostInGame'] = defensiveAssistsMostInGame;
    data['eliminationsMostInGame'] = eliminationsMostInGame;
    data['environmentalKillsMostInGame'] = environmentalKillsMostInGame;
    data['finalBlowsMostInGame'] = finalBlowsMostInGame;
    data['healingDoneMostInGame'] = healingDoneMostInGame;
    data['heroDamageDoneMostInGame'] = heroDamageDoneMostInGame;
    data['killsStreakBest'] = killsStreakBest;
    data['meleeFinalBlowsMostInGame'] = meleeFinalBlowsMostInGame;
    data['multikillsBest'] = multiKillsBest;
    data['objectiveKillsMostInGame'] = objectiveKillsMostInGame;
    data['objectiveTimeMostInGame'] = objectiveTimeMostInGame;
    data['offensiveAssistsMostInGame'] = offensiveAssistsMostInGame;
    data['soloKillsMostInGame'] = soloKillsMostInGame;
    data['timeSpentOnFireMostInGame'] = timeSpentOnFireMostInGame;
    data['turretsDestroyedMostInGame'] = turretsDestroyedMostInGame;
    return data;
  }
}

class Combat {
  int? barrierDamageDone;
  int? damageDone;
  int? deaths;
  int? eliminations;
  int? environmentalKills;
  int? finalBlows;
  int? heroDamageDone;
  int? meleeFinalBlows;
  int? multikills;
  int? objectiveKills;
  String? objectiveTime;
  int? soloKills;
  String? timeSpentOnFire;

  Combat({
    this.barrierDamageDone,
    this.damageDone,
    this.deaths,
    this.eliminations,
    this.environmentalKills,
    this.finalBlows,
    this.heroDamageDone,
    this.meleeFinalBlows,
    this.multikills,
    this.objectiveKills,
    this.objectiveTime,
    this.soloKills,
    this.timeSpentOnFire,
  });

  int? get getBarrierDamageDone => barrierDamageDone;

  set setBarrierDamageDone(int barrierDamageDone) =>
      barrierDamageDone = barrierDamageDone;

  int? get getDamageDone => damageDone;

  set setDamageDone(int damageDone) => damageDone = damageDone;

  int? get getDeaths => deaths;

  set setDeaths(int deaths) => deaths = deaths;

  int? get getEliminations => eliminations;

  set setEliminations(int eliminations) => eliminations = eliminations;

  int? get getEnvironmentalKills => environmentalKills;

  set setEnvironmentalKills(int environmentalKills) =>
      environmentalKills = environmentalKills;

  int? get getFinalBlows => finalBlows;

  set setFinalBlows(int finalBlows) => finalBlows = finalBlows;

  int? get getHeroDamageDone => heroDamageDone;

  set setHeroDamageDone(int heroDamageDone) => heroDamageDone = heroDamageDone;

  int? get getMeleeFinalBlows => meleeFinalBlows;

  set setMeleeFinalBlows(int meleeFinalBlows) =>
      meleeFinalBlows = meleeFinalBlows;

  int? get getMultiKills => multikills;

  set setMultiKills(int multikills) => multikills = multikills;

  int? get getObjectiveKills => objectiveKills;

  set setObjectiveKills(int objectiveKills) => objectiveKills = objectiveKills;

  String? get getObjectiveTime => objectiveTime;

  set setObjectiveTime(String objectiveTime) => objectiveTime = objectiveTime;

  int? get getSoloKills => soloKills;

  set setSoloKills(int soloKills) => soloKills = soloKills;

  String? get getTimeSpentOnFire => timeSpentOnFire;

  set setTimeSpentOnFire(String timeSpentOnFire) =>
      timeSpentOnFire = timeSpentOnFire;

  Combat.fromJson(Map<String, dynamic> json) {
    barrierDamageDone = json['barrierDamageDone'];
    damageDone = json['damageDone'];
    deaths = json['deaths'];
    eliminations = json['eliminations'];
    environmentalKills = json['environmentalKills'];
    finalBlows = json['finalBlows'];
    heroDamageDone = json['heroDamageDone'];
    meleeFinalBlows = json['meleeFinalBlows'];
    multikills = json['multikills'];
    objectiveKills = json['objectiveKills'];
    objectiveTime = json['objectiveTime'];
    soloKills = json['soloKills'];
    timeSpentOnFire = json['timeSpentOnFire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['barrierDamageDone'] = barrierDamageDone;
    data['damageDone'] = damageDone;
    data['deaths'] = deaths;
    data['eliminations'] = eliminations;
    data['environmentalKills'] = environmentalKills;
    data['finalBlows'] = finalBlows;
    data['heroDamageDone'] = heroDamageDone;
    data['meleeFinalBlows'] = meleeFinalBlows;
    data['multikills'] = multikills;
    data['objectiveKills'] = objectiveKills;
    data['objectiveTime'] = objectiveTime;
    data['soloKills'] = soloKills;
    data['timeSpentOnFire'] = timeSpentOnFire;
    return data;
  }
}

class Game {
  int? gamesLost;
  int? gamesPlayed;
  int? gamesTied;
  int? gamesWon;

  Game({
    this.gamesLost,
    this.gamesPlayed,
    this.gamesTied,
    this.gamesWon,
  });

  int? get getGamesLost => gamesLost;

  set setGamesLost(int gamesLost) => gamesLost = gamesLost;

  int? get getGamesPlayed => gamesPlayed;

  set setGamesPlayed(int gamesPlayed) => gamesPlayed = gamesPlayed;

  int? get getGamesTied => gamesTied;

  set setGamesTied(int gamesTied) => gamesTied = gamesTied;

  int? get getGamesWon => gamesWon;

  set setGamesWon(int gamesWon) => gamesWon = gamesWon;

  Game.fromJson(Map<String, dynamic> json) {
    gamesLost = json['gamesLost'];
    gamesPlayed = json['gamesPlayed'];
    gamesTied = json['gamesTied'];
    gamesWon = json['gamesWon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gamesLost'] = gamesLost;
    data['gamesPlayed'] = gamesPlayed;
    data['gamesTied'] = gamesTied;
    data['gamesWon'] = gamesWon;
    return data;
  }
}

class MatchAwards {
  int? medals;
  int? medalsGold;
  int? medalsSilver;

  MatchAwards({
    this.medals,
    this.medalsGold,
    this.medalsSilver,
  });

  int? get getMedals => medals;

  set setMedals(int medals) => medals = medals;

  int? get getMedalsGold => medalsGold;

  set setMedalsGold(int medalsGold) => medalsGold = medalsGold;

  int? get getMedalsSilver => medalsSilver;

  set setMedalsSilver(int medalsSilver) => medalsSilver = medalsSilver;

  MatchAwards.fromJson(Map<String, dynamic> json) {
    medals = json['medals'];
    medalsGold = json['medalsGold'];
    medalsSilver = json['medalsSilver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medals'] = medals;
    data['medalsGold'] = medalsGold;
    data['medalsSilver'] = medalsSilver;
    return data;
  }
}

class Miscellaneous {
  int? turretsDestroyed;

  Miscellaneous({
    this.turretsDestroyed,
  });

  int? get getTurretsDestroyed => turretsDestroyed;

  set setTurretsDestroyed(int turretsDestroyed) =>
      turretsDestroyed = turretsDestroyed;

  Miscellaneous.fromJson(Map<String, dynamic> json) {
    turretsDestroyed = json['turretsDestroyed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['turretsDestroyed'] = turretsDestroyed;
    return data;
  }
}

class Games {
  int? played;
  int? won;

  Games({
    this.played,
    this.won,
  });

  int? get getPlayed => played;

  set setPlayed(int played) => played = played;

  int? get getWon => won;

  set setWon(int won) => won = won;

  Games.fromJson(Map<String, dynamic> json) {
    played = json['played'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['played'] = played;
    data['won'] = won;
    return data;
  }
}

class TopHeroes {
  TopHero? ana;
  TopHero? ashe;
  TopHero? baptiste;
  TopHero? bastion;
  TopHero? brigitte;
  TopHero? dVa;
  TopHero? doomfist;
  TopHero? echo;
  TopHero? genji;
  TopHero? hanzo;
  TopHero? junkrat;
  TopHero? lucio;
  TopHero? mccree;
  TopHero? mei;
  TopHero? mercy;
  TopHero? moira;
  TopHero? orisa;
  TopHero? pharah;
  TopHero? reaper;
  TopHero? reinhardt;
  TopHero? roadhog;
  TopHero? sigma;
  TopHero? soldier76;
  TopHero? sombra;
  TopHero? symmetra;
  TopHero? torbjorn;
  TopHero? tracer;
  TopHero? widowmaker;
  TopHero? winston;
  TopHero? wreckingBall;
  TopHero? zarya;
  TopHero? zenyatta;

  TopHeroes({
    this.ana,
    this.ashe,
    this.baptiste,
    this.bastion,
    this.brigitte,
    this.dVa,
    this.doomfist,
    this.echo,
    this.genji,
    this.hanzo,
    this.junkrat,
    this.lucio,
    this.mccree,
    this.mei,
    this.mercy,
    this.moira,
    this.orisa,
    this.pharah,
    this.reaper,
    this.reinhardt,
    this.roadhog,
    this.sigma,
    this.soldier76,
    this.sombra,
    this.symmetra,
    this.torbjorn,
    this.tracer,
    this.widowmaker,
    this.winston,
    this.wreckingBall,
    this.zarya,
    this.zenyatta,
  });

  TopHero? get getAna => ana;

  set setAna(TopHero ana) => ana = ana;

  TopHero? get getAshe => ashe;

  set setAshe(TopHero ashe) => ashe = ashe;

  TopHero? get getBaptiste => baptiste;

  set setBaptiste(TopHero baptiste) => baptiste = baptiste;

  TopHero? get getBastion => bastion;

  set setBastion(TopHero bastion) => bastion = bastion;

  TopHero? get getBrigitte => brigitte;

  set setBrigitte(TopHero brigitte) => brigitte = brigitte;

  TopHero? get getDVa => dVa;

  set setDVa(TopHero dVa) => dVa = dVa;

  TopHero? get getDoomfist => doomfist;

  set setDoomfist(TopHero doomfist) => doomfist = doomfist;

  TopHero? get getEcho => echo;

  set setEcho(TopHero echo) => echo = echo;

  TopHero? get getGenji => genji;

  set setGenji(TopHero genji) => genji = genji;

  TopHero? get getHanzo => hanzo;

  set setHanzo(TopHero hanzo) => hanzo = hanzo;

  TopHero? get getJunkrat => junkrat;

  set setJunkrat(TopHero junkrat) => junkrat = junkrat;

  TopHero? get getLucio => lucio;

  set setLucio(TopHero lucio) => lucio = lucio;

  TopHero? get getMccree => mccree;

  set setMccree(TopHero mccree) => mccree = mccree;

  TopHero? get getMei => mei;

  set setMei(TopHero mei) => mei = mei;

  TopHero? get getMercy => mercy;

  set setMercy(TopHero mercy) => mercy = mercy;

  TopHero? get getMoira => moira;

  set setMoira(TopHero moira) => moira = moira;

  TopHero? get getOrisa => orisa;

  set setOrisa(TopHero orisa) => orisa = orisa;

  TopHero? get getPharah => pharah;

  set setPharah(TopHero pharah) => pharah = pharah;

  TopHero? get getReaper => reaper;

  set setReaper(TopHero reaper) => reaper = reaper;

  TopHero? get getReinhardt => reinhardt;

  set setReinhardt(TopHero reinhardt) => reinhardt = reinhardt;

  TopHero? get getRoadhog => roadhog;

  set setRoadhog(TopHero roadhog) => roadhog = roadhog;

  TopHero? get getSigma => sigma;

  set setSigma(TopHero sigma) => sigma = sigma;

  TopHero? get getSoldier76 => soldier76;

  set setSoldier76(TopHero soldier76) => soldier76 = soldier76;

  TopHero? get getSombra => sombra;

  set setSombra(TopHero sombra) => sombra = sombra;

  TopHero? get getSymmetra => symmetra;

  set setSymmetra(TopHero symmetra) => symmetra = symmetra;

  TopHero? get getTorbjorn => torbjorn;

  set setTorbjorn(TopHero torbjorn) => torbjorn = torbjorn;

  TopHero? get getTracer => tracer;

  set setTracer(TopHero tracer) => tracer = tracer;

  TopHero? get getWidowmaker => widowmaker;

  set setWidowmaker(TopHero widowmaker) => widowmaker = widowmaker;

  TopHero? get getWinston => winston;

  set setWinston(TopHero winston) => winston = winston;

  TopHero? get getWreckingBall => wreckingBall;

  set setWreckingBall(TopHero wreckingBall) => wreckingBall = wreckingBall;

  TopHero? get getZarya => zarya;

  set setZarya(TopHero zarya) => zarya = zarya;

  TopHero? get getZenyatta => zenyatta;

  set setZenyatta(TopHero zenyatta) => zenyatta = zenyatta;

  TopHeroes.fromJson(Map<String, dynamic> json) {
    ana = json['ana'] != null ? TopHero.fromJson(json['ana']) : null;
    ashe = json['ashe'] != null ? TopHero.fromJson(json['ashe']) : null;
    baptiste =
        json['baptiste'] != null ? TopHero.fromJson(json['baptiste']) : null;
    bastion =
        json['bastion'] != null ? TopHero.fromJson(json['bastion']) : null;
    brigitte =
        json['brigitte'] != null ? TopHero.fromJson(json['brigitte']) : null;
    dVa = json['dVa'] != null ? TopHero.fromJson(json['dVa']) : null;
    doomfist =
        json['doomfist'] != null ? TopHero.fromJson(json['doomfist']) : null;
    echo = json['echo'] != null ? TopHero.fromJson(json['echo']) : null;
    genji = json['genji'] != null ? TopHero.fromJson(json['genji']) : null;
    hanzo = json['hanzo'] != null ? TopHero.fromJson(json['hanzo']) : null;
    junkrat =
        json['junkrat'] != null ? TopHero.fromJson(json['junkrat']) : null;
    lucio = json['lucio'] != null ? TopHero.fromJson(json['lucio']) : null;
    mccree = json['mccree'] != null ? TopHero.fromJson(json['mccree']) : null;
    mei = json['mei'] != null ? TopHero.fromJson(json['mei']) : null;
    mercy = json['mercy'] != null ? TopHero.fromJson(json['mercy']) : null;
    moira = json['moira'] != null ? TopHero.fromJson(json['moira']) : null;
    orisa = json['orisa'] != null ? TopHero.fromJson(json['orisa']) : null;
    pharah = json['pharah'] != null ? TopHero.fromJson(json['pharah']) : null;
    reaper = json['reaper'] != null ? TopHero.fromJson(json['reaper']) : null;
    reinhardt =
        json['reinhardt'] != null ? TopHero.fromJson(json['reinhardt']) : null;
    roadhog =
        json['roadhog'] != null ? TopHero.fromJson(json['roadhog']) : null;
    sigma = json['sigma'] != null ? TopHero.fromJson(json['sigma']) : null;
    soldier76 =
        json['soldier76'] != null ? TopHero.fromJson(json['soldier76']) : null;
    sombra = json['sombra'] != null ? TopHero.fromJson(json['sombra']) : null;
    symmetra =
        json['symmetra'] != null ? TopHero.fromJson(json['symmetra']) : null;
    torbjorn =
        json['torbjorn'] != null ? TopHero.fromJson(json['torbjorn']) : null;
    tracer = json['tracer'] != null ? TopHero.fromJson(json['tracer']) : null;
    widowmaker = json['widowmaker'] != null
        ? TopHero.fromJson(json['widowmaker'])
        : null;
    winston =
        json['winston'] != null ? TopHero.fromJson(json['winston']) : null;
    wreckingBall = json['wreckingBall'] != null
        ? TopHero.fromJson(json['wreckingBall'])
        : null;
    zarya = json['zarya'] != null ? TopHero.fromJson(json['zarya']) : null;
    zenyatta =
        json['zenyatta'] != null ? TopHero.fromJson(json['zenyatta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ana != null) {
      data['ana'] = ana?.toJson();
    }
    if (ashe != null) {
      data['ashe'] = ashe?.toJson();
    }
    if (baptiste != null) {
      data['baptiste'] = baptiste?.toJson();
    }
    if (bastion != null) {
      data['bastion'] = bastion?.toJson();
    }
    if (brigitte != null) {
      data['brigitte'] = brigitte?.toJson();
    }
    if (dVa != null) {
      data['dVa'] = dVa?.toJson();
    }
    if (doomfist != null) {
      data['doomfist'] = doomfist?.toJson();
    }
    if (echo != null) {
      data['echo'] = echo?.toJson();
    }
    if (genji != null) {
      data['genji'] = genji?.toJson();
    }
    if (hanzo != null) {
      data['hanzo'] = hanzo?.toJson();
    }
    if (junkrat != null) {
      data['junkrat'] = junkrat?.toJson();
    }
    if (lucio != null) {
      data['lucio'] = lucio?.toJson();
    }
    if (mccree != null) {
      data['mccree'] = mccree?.toJson();
    }
    if (mei != null) {
      data['mei'] = mei?.toJson();
    }
    if (mercy != null) {
      data['mercy'] = mercy?.toJson();
    }
    if (moira != null) {
      data['moira'] = moira?.toJson();
    }
    if (orisa != null) {
      data['orisa'] = orisa?.toJson();
    }
    if (pharah != null) {
      data['pharah'] = pharah?.toJson();
    }
    if (reaper != null) {
      data['reaper'] = reaper?.toJson();
    }
    if (reinhardt != null) {
      data['reinhardt'] = reinhardt?.toJson();
    }
    if (roadhog != null) {
      data['roadhog'] = roadhog?.toJson();
    }
    if (sigma != null) {
      data['sigma'] = sigma?.toJson();
    }
    if (soldier76 != null) {
      data['soldier76'] = soldier76?.toJson();
    }
    if (sombra != null) {
      data['sombra'] = sombra?.toJson();
    }
    if (symmetra != null) {
      data['symmetra'] = symmetra?.toJson();
    }
    if (torbjorn != null) {
      data['torbjorn'] = torbjorn?.toJson();
    }
    if (tracer != null) {
      data['tracer'] = tracer?.toJson();
    }
    if (widowmaker != null) {
      data['widowmaker'] = widowmaker?.toJson();
    }
    if (winston != null) {
      data['winston'] = winston?.toJson();
    }
    if (wreckingBall != null) {
      data['wreckingBall'] = wreckingBall?.toJson();
    }
    if (zarya != null) {
      data['zarya'] = zarya?.toJson();
    }
    if (zenyatta != null) {
      data['zenyatta'] = zenyatta?.toJson();
    }
    return data;
  }
}

class TopHero {
  DateTime? timePlayed;
  int? gamesWon;
  int? winPercentage;
  int? weaponAccuracy;
  double? eliminationsPerLife;
  int? multiKillBest;
  int? objectiveKills;

  TopHero({
    this.timePlayed,
    this.gamesWon,
    this.winPercentage,
    this.weaponAccuracy,
    this.eliminationsPerLife,
    this.multiKillBest,
    this.objectiveKills,
  });

  DateTime? get getTimePlayed => timePlayed;

  set setTimePlayed(DateTime timePlayed) => timePlayed = timePlayed;

  int? get getGamesWon => gamesWon;

  set setGamesWon(int gamesWon) => gamesWon = gamesWon;

  int? get getWinPercentage => winPercentage;

  set setWinPercentage(int winPercentage) => winPercentage = winPercentage;

  int? get getWeaponAccuracy => weaponAccuracy;

  set setWeaponAccuracy(int weaponAccuracy) => weaponAccuracy = weaponAccuracy;

  double? get getEliminationsPerLife => eliminationsPerLife;

  set setEliminationsPerLife(double eliminationsPerLife) =>
      eliminationsPerLife = eliminationsPerLife;

  int? get getMultiKillBest => multiKillBest;

  set setMultiKillBest(int multiKillBest) => multiKillBest = multiKillBest;

  int? get getObjectiveKills => objectiveKills;

  set setObjectiveKills(int objectiveKills) => objectiveKills = objectiveKills;

  TopHero.fromJson(Map<String, dynamic> json) {
    if (RegExp(r"\d\d:\d\d:\d\d").hasMatch(json['timePlayed'])) {
      timePlayed = DateTime.parse(
          Constants.standardConversionDate + json['timePlayed'] + ".000");
    } else {
      timePlayed = DateTime.parse(Constants.standardConversionDate +
          "00:" +
          json['timePlayed'] +
          ".000");
    }
    gamesWon = json['gamesWon'];
    winPercentage = json['winPercentage'];
    weaponAccuracy = json['weaponAccuracy'];
    eliminationsPerLife = json['eliminationsPerLife'].toDouble();
    multiKillBest = json['multiKillBest'];
    objectiveKills = json['objectiveKills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timePlayed'] = timePlayed;
    data['gamesWon'] = gamesWon;
    data['winPercentage'] = winPercentage;
    data['weaponAccuracy'] = weaponAccuracy;
    data['eliminationsPerLife'] = eliminationsPerLife;
    data['multiKillBest'] = multiKillBest;
    data['objectiveKills'] = objectiveKills;
    return data;
  }
}

class Ratings {
  GameRole? support;
  GameRole? tank;
  GameRole? damage;

  Ratings({
    this.support,
    this.tank,
    this.damage,
  });

  GameRole? get getSupport => support;

  set setSupport(GameRole support) => support = support;

  GameRole? get getTank => tank;

  set setTank(GameRole tank) => tank = tank;

  GameRole? get getDamage => damage;

  set setDamage(GameRole damage) => damage = damage;

  Ratings.fromJson(Map<String, dynamic> json) {
    support =
        json['support'] != null ? GameRole.fromJson(json['support']) : null;
    tank = json['tank'] != null ? GameRole.fromJson(json['tank']) : null;
    damage = json['damage'] != null ? GameRole.fromJson(json['damage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (support != null) {
      data['support'] = support?.toJson();
    }
    if (tank != null) {
      data['tank'] = tank?.toJson();
    }
    if (damage != null) {
      data['damage'] = damage?.toJson();
    }
    return data;
  }
}

class GameRole {
  int? level;
  String? rankIcon;
  String? roleIcon;

  GameRole({
    this.level,
    this.rankIcon,
    this.roleIcon,
  });

  int? get getlevel => level;

  set setLevel(int level) => level = level;

  String? get getRankIcon => rankIcon;

  set setRankIcon(String rankIcon) => rankIcon = rankIcon;

  String? get getRoleIcon => roleIcon;

  set setRoleIcon(String roleIcon) => roleIcon = roleIcon;

  GameRole.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    rankIcon = json['rankIcon'];
    roleIcon = json['roleIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['rankIcon'] = rankIcon;
    data['roleIcon'] = roleIcon;
    return data;
  }
}
