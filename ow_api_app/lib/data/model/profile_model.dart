class Profile {
  Region eu;
  Region us;
  Region kr;
  Request rRequest;

  Profile({this.eu, this.us, this.kr, this.rRequest});

  Profile.fromJson(Map<String, dynamic> json) {
    eu = json['eu'] != null ? new Region.fromJson(json['eu']) : null;
    us = json['us'] != null ? new Region.fromJson(json['us']) : null;
    kr = json['kr'] != null ? new Region.fromJson(json['kr']) : null;
    rRequest = json['_request'] != null
        ? new Request.fromJson(json['_request'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eu != null) {
      data['eu'] = this.eu.toJson();
    }
    if (this.us != null) {
      data['us'] = this.us.toJson();
    }
    if (this.kr != null) {
      data['kr'] = this.kr.toJson();
    }
    if (this.rRequest != null) {
      data['_request'] = this.rRequest.toJson();
    }
    return data;
  }
}

class Region {
  Stats stats;

  Region({this.stats});

  Region.fromJson(Map<String, dynamic> json) {
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    return data;
  }
}

class Stats {
  GameMode quickplay;
  GameMode competitive;

  Stats({this.quickplay, this.competitive});

  Stats.fromJson(Map<String, dynamic> json) {
    quickplay = json['quickplay'] != null
        ? new GameMode.fromJson(json['quickplay'])
        : null;
    competitive = json['competitive'] != null
        ? new GameMode.fromJson(json['competitive'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quickplay != null) {
      data['quickplay'] = this.quickplay.toJson();
    }
    if (this.competitive != null) {
      data['competitive'] = this.competitive.toJson();
    }
    return data;
  }
}

class GameMode {
  GameStats gameStats;
  OverallStats overallStats;
  RollingAverageStats rollingAverageStats;
  bool competitive;

  GameMode(
      {this.gameStats,
      this.overallStats,
      this.rollingAverageStats,
      this.competitive});

  GameMode.fromJson(Map<String, dynamic> json) {
    gameStats = json['game_stats'] != null
        ? new GameStats.fromJson(json['game_stats'])
        : null;
    overallStats = json['overall_stats'] != null
        ? new OverallStats.fromJson(json['overall_stats'])
        : null;
    rollingAverageStats = json['rolling_average_stats'] != null
        ? new RollingAverageStats.fromJson(json['rolling_average_stats'])
        : null;
    competitive = json['competitive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gameStats != null) {
      data['game_stats'] = this.gameStats.toJson();
    }
    if (this.overallStats != null) {
      data['overall_stats'] = this.overallStats.toJson();
    }
    if (this.rollingAverageStats != null) {
      data['rolling_average_stats'] = this.rollingAverageStats.toJson();
    }
    data['competitive'] = this.competitive;
    return data;
  }
}

class GameStats {
  double allDamageDoneMostInGame;
  double barrierDamageDoneMostInGame;
  double defensiveAssistsMostInGame;
  double eliminationsMostInGame;
  double environmentalKillsMostInGame;
  double finalBlowsMostInGame;
  double healingDoneMostInGame;
  double heroDamageDoneMostInGame;
  double killStreakBest;
  double meleeFinalBlowsMostInGame;
  double multikillBest;
  double objectiveKillsMostInGame;
  double objectiveTimeMostInGame;
  double offensiveAssistsMostInGame;
  double reconAssistsMostInGame;
  double soloKillsMostInGame;
  double teleporterPadsDestroyedMostInGame;
  double timeSpentOnFireMostInGame;
  double turretsDestroyedMostInGame;
  double defensiveAssists;
  double healingDone;
  double offensiveAssists;
  double reconAssists;
  double allDamageDone;
  double barrierDamageDone;
  double damageDone;
  double deaths;
  double eliminations;
  double environmentalKills;
  double finalBlows;
  double heroDamageDone;
  double meleeFinalBlows;
  double multikills;
  double objectiveKills;
  double objectiveTime;
  double soloKills;
  double timeSpentOnFire;
  double gamesLost;
  double gamesPlayed;
  double gamesWon;
  double timePlayed;
  double medalsGold;
  double cards;
  double medals;
  double medalsBronze;
  double medalsSilver;
  double teleporterPadsDestroyed;
  double turretsDestroyed;
  double kpd;

  GameStats(
      {this.allDamageDoneMostInGame,
      this.barrierDamageDoneMostInGame,
      this.defensiveAssistsMostInGame,
      this.eliminationsMostInGame,
      this.environmentalKillsMostInGame,
      this.finalBlowsMostInGame,
      this.healingDoneMostInGame,
      this.heroDamageDoneMostInGame,
      this.killStreakBest,
      this.meleeFinalBlowsMostInGame,
      this.multikillBest,
      this.objectiveKillsMostInGame,
      this.objectiveTimeMostInGame,
      this.offensiveAssistsMostInGame,
      this.reconAssistsMostInGame,
      this.soloKillsMostInGame,
      this.teleporterPadsDestroyedMostInGame,
      this.timeSpentOnFireMostInGame,
      this.turretsDestroyedMostInGame,
      this.defensiveAssists,
      this.healingDone,
      this.offensiveAssists,
      this.reconAssists,
      this.allDamageDone,
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
      this.gamesLost,
      this.gamesPlayed,
      this.gamesWon,
      this.timePlayed,
      this.medalsGold,
      this.cards,
      this.medals,
      this.medalsBronze,
      this.medalsSilver,
      this.teleporterPadsDestroyed,
      this.turretsDestroyed,
      this.kpd});

  GameStats.fromJson(Map<String, dynamic> json) {
    allDamageDoneMostInGame = json['all_damage_done_most_in_game'];
    barrierDamageDoneMostInGame = json['barrier_damage_done_most_in_game'];
    defensiveAssistsMostInGame = json['defensive_assists_most_in_game'];
    eliminationsMostInGame = json['eliminations_most_in_game'];
    environmentalKillsMostInGame = json['environmental_kills_most_in_game'];
    finalBlowsMostInGame = json['final_blows_most_in_game'];
    healingDoneMostInGame = json['healing_done_most_in_game'];
    heroDamageDoneMostInGame = json['hero_damage_done_most_in_game'];
    killStreakBest = json['kill_streak_best'];
    meleeFinalBlowsMostInGame = json['melee_final_blows_most_in_game'];
    multikillBest = json['multikill_best'];
    objectiveKillsMostInGame = json['objective_kills_most_in_game'];
    objectiveTimeMostInGame = json['objective_time_most_in_game'];
    offensiveAssistsMostInGame = json['offensive_assists_most_in_game'];
    reconAssistsMostInGame = json['recon_assists_most_in_game'];
    soloKillsMostInGame = json['solo_kills_most_in_game'];
    teleporterPadsDestroyedMostInGame =
        json['teleporter_pads_destroyed_most_in_game'];
    timeSpentOnFireMostInGame = json['time_spent_on_fire_most_in_game'];
    turretsDestroyedMostInGame = json['turrets_destroyed_most_in_game'];
    defensiveAssists = json['defensive_assists'];
    healingDone = json['healing_done'];
    offensiveAssists = json['offensive_assists'];
    reconAssists = json['recon_assists'];
    allDamageDone = json['all_damage_done'];
    barrierDamageDone = json['barrier_damage_done'];
    damageDone = json['damage_done'];
    deaths = json['deaths'];
    eliminations = json['eliminations'];
    environmentalKills = json['environmental_kills'];
    finalBlows = json['final_blows'];
    heroDamageDone = json['hero_damage_done'];
    meleeFinalBlows = json['melee_final_blows'];
    multikills = json['multikills'];
    objectiveKills = json['objective_kills'];
    objectiveTime = json['objective_time'];
    soloKills = json['solo_kills'];
    timeSpentOnFire = json['time_spent_on_fire'];
    gamesLost = json['games_lost'];
    gamesPlayed = json['games_played'];
    gamesWon = json['games_won'];
    timePlayed = json['time_played'];
    medalsGold = json['medals_gold'];
    cards = json['cards'];
    medals = json['medals'];
    medalsBronze = json['medals_bronze'];
    medalsSilver = json['medals_silver'];
    teleporterPadsDestroyed = json['teleporter_pads_destroyed'];
    turretsDestroyed = json['turrets_destroyed'];
    kpd = json['kpd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_damage_done_most_in_game'] = this.allDamageDoneMostInGame;
    data['barrier_damage_done_most_in_game'] = this.barrierDamageDoneMostInGame;
    data['defensive_assists_most_in_game'] = this.defensiveAssistsMostInGame;
    data['eliminations_most_in_game'] = this.eliminationsMostInGame;
    data['environmental_kills_most_in_game'] =
        this.environmentalKillsMostInGame;
    data['final_blows_most_in_game'] = this.finalBlowsMostInGame;
    data['healing_done_most_in_game'] = this.healingDoneMostInGame;
    data['hero_damage_done_most_in_game'] = this.heroDamageDoneMostInGame;
    data['kill_streak_best'] = this.killStreakBest;
    data['melee_final_blows_most_in_game'] = this.meleeFinalBlowsMostInGame;
    data['multikill_best'] = this.multikillBest;
    data['objective_kills_most_in_game'] = this.objectiveKillsMostInGame;
    data['objective_time_most_in_game'] = this.objectiveTimeMostInGame;
    data['offensive_assists_most_in_game'] = this.offensiveAssistsMostInGame;
    data['recon_assists_most_in_game'] = this.reconAssistsMostInGame;
    data['solo_kills_most_in_game'] = this.soloKillsMostInGame;
    data['teleporter_pads_destroyed_most_in_game'] =
        this.teleporterPadsDestroyedMostInGame;
    data['time_spent_on_fire_most_in_game'] = this.timeSpentOnFireMostInGame;
    data['turrets_destroyed_most_in_game'] = this.turretsDestroyedMostInGame;
    data['defensive_assists'] = this.defensiveAssists;
    data['healing_done'] = this.healingDone;
    data['offensive_assists'] = this.offensiveAssists;
    data['recon_assists'] = this.reconAssists;
    data['all_damage_done'] = this.allDamageDone;
    data['barrier_damage_done'] = this.barrierDamageDone;
    data['damage_done'] = this.damageDone;
    data['deaths'] = this.deaths;
    data['eliminations'] = this.eliminations;
    data['environmental_kills'] = this.environmentalKills;
    data['final_blows'] = this.finalBlows;
    data['hero_damage_done'] = this.heroDamageDone;
    data['melee_final_blows'] = this.meleeFinalBlows;
    data['multikills'] = this.multikills;
    data['objective_kills'] = this.objectiveKills;
    data['objective_time'] = this.objectiveTime;
    data['solo_kills'] = this.soloKills;
    data['time_spent_on_fire'] = this.timeSpentOnFire;
    data['games_lost'] = this.gamesLost;
    data['games_played'] = this.gamesPlayed;
    data['games_won'] = this.gamesWon;
    data['time_played'] = this.timePlayed;
    data['medals_gold'] = this.medalsGold;
    data['cards'] = this.cards;
    data['medals'] = this.medals;
    data['medals_bronze'] = this.medalsBronze;
    data['medals_silver'] = this.medalsSilver;
    data['teleporter_pads_destroyed'] = this.teleporterPadsDestroyed;
    data['turrets_destroyed'] = this.turretsDestroyed;
    data['kpd'] = this.kpd;
    return data;
  }
}

class OverallStats {
  String prestigeImage;
  String rankImage;
  int prestige;
  int level;
  int endorsementLevel;
  double endorsementShotcaller;
  double endorsementTeammate;
  double endorsementSportsmanship;
  String supportRoleImage;
  String supportTierImage;
  String supportTier;
  int supportComprank;
  String tankRoleImage;
  String tankTierImage;
  String tankTier;
  int tankComprank;
  String damageRoleImage;
  String damageTierImage;
  String damageTier;
  int damageComprank;
  String avatar;
  int wins;
  int games;
  int losses;
  int winRate;

  OverallStats(
      {this.prestigeImage,
      this.rankImage,
      this.prestige,
      this.level,
      this.endorsementLevel,
      this.endorsementShotcaller,
      this.endorsementTeammate,
      this.endorsementSportsmanship,
      this.supportRoleImage,
      this.supportTierImage,
      this.supportTier,
      this.supportComprank,
      this.tankRoleImage,
      this.tankTierImage,
      this.tankTier,
      this.tankComprank,
      this.damageRoleImage,
      this.damageTierImage,
      this.damageTier,
      this.damageComprank,
      this.avatar,
      this.wins,
      this.games,
      this.losses,
      this.winRate});

  OverallStats.fromJson(Map<String, dynamic> json) {
    prestigeImage = json['prestige_image'];
    rankImage = json['rank_image'];
    prestige = json['prestige'];
    level = json['level'];
    endorsementLevel = json['endorsement_level'];
    endorsementShotcaller = json['endorsement_shotcaller'];
    endorsementTeammate = json['endorsement_teammate'];
    endorsementSportsmanship = json['endorsement_sportsmanship'];
    supportRoleImage = json['support_role_image'];
    supportTierImage = json['support_tier_image'];
    supportTier = json['support_tier'];
    supportComprank = json['support_comprank'];
    tankRoleImage = json['tank_role_image'];
    tankTierImage = json['tank_tier_image'];
    tankTier = json['tank_tier'];
    tankComprank = json['tank_comprank'];
    damageRoleImage = json['damage_role_image'];
    damageTierImage = json['damage_tier_image'];
    damageTier = json['damage_tier'];
    damageComprank = json['damage_comprank'];
    avatar = json['avatar'];
    wins = json['wins'];
    games = json['games'];
    losses = json['losses'];
    winRate = json['win_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prestige_image'] = this.prestigeImage;
    data['rank_image'] = this.rankImage;
    data['prestige'] = this.prestige;
    data['level'] = this.level;
    data['endorsement_level'] = this.endorsementLevel;
    data['endorsement_shotcaller'] = this.endorsementShotcaller;
    data['endorsement_teammate'] = this.endorsementTeammate;
    data['endorsement_sportsmanship'] = this.endorsementSportsmanship;
    data['support_role_image'] = this.supportRoleImage;
    data['support_tier_image'] = this.supportTierImage;
    data['support_tier'] = this.supportTier;
    data['support_comprank'] = this.supportComprank;
    data['tank_role_image'] = this.tankRoleImage;
    data['tank_tier_image'] = this.tankTierImage;
    data['tank_tier'] = this.tankTier;
    data['tank_comprank'] = this.tankComprank;
    data['damage_role_image'] = this.damageRoleImage;
    data['damage_tier_image'] = this.damageTierImage;
    data['damage_tier'] = this.damageTier;
    data['damage_comprank'] = this.damageComprank;
    data['avatar'] = this.avatar;
    data['wins'] = this.wins;
    data['games'] = this.games;
    data['losses'] = this.losses;
    data['win_rate'] = this.winRate;
    return data;
  }
}

class RollingAverageStats {
  double allDamageDone;
  double barrierDamageDone;
  double deaths;
  double eliminations;
  double finalBlows;
  double healingDone;
  double heroDamageDone;
  double objectiveKills;
  double objectiveTime;
  double soloKills;
  double timeSpentOnFire;

  RollingAverageStats(
      {this.allDamageDone,
      this.barrierDamageDone,
      this.deaths,
      this.eliminations,
      this.finalBlows,
      this.healingDone,
      this.heroDamageDone,
      this.objectiveKills,
      this.objectiveTime,
      this.soloKills,
      this.timeSpentOnFire});

  RollingAverageStats.fromJson(Map<String, dynamic> json) {
    allDamageDone = json['all_damage_done'];
    barrierDamageDone = json['barrier_damage_done'];
    deaths = json['deaths'];
    eliminations = json['eliminations'];
    finalBlows = json['final_blows'];
    healingDone = json['healing_done'];
    heroDamageDone = json['hero_damage_done'];
    objectiveKills = json['objective_kills'];
    objectiveTime = json['objective_time'];
    soloKills = json['solo_kills'];
    timeSpentOnFire = json['time_spent_on_fire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_damage_done'] = this.allDamageDone;
    data['barrier_damage_done'] = this.barrierDamageDone;
    data['deaths'] = this.deaths;
    data['eliminations'] = this.eliminations;
    data['final_blows'] = this.finalBlows;
    data['healing_done'] = this.healingDone;
    data['hero_damage_done'] = this.heroDamageDone;
    data['objective_kills'] = this.objectiveKills;
    data['objective_time'] = this.objectiveTime;
    data['solo_kills'] = this.soloKills;
    data['time_spent_on_fire'] = this.timeSpentOnFire;
    return data;
  }
}

class Request {
  int apiVer;
  String route;

  Request({this.apiVer, this.route});

  Request.fromJson(Map<String, dynamic> json) {
    apiVer = json['api_ver'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_ver'] = this.apiVer;
    data['route'] = this.route;
    return data;
  }
}
