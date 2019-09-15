class CompetitiveStats {
  final double eliminationsAvg;
  final double damageDoneAvg;
  final double deathsAvg;
  final double healingDoneAvg;
  final double objectiveKillsAvg;
  final double objectiveTimeAvg;
  final double soloKillsAvg;
  final CompetitiveGames competitiveGames;

  CompetitiveStats(
      {this.eliminationsAvg,
      this.damageDoneAvg,
      this.deathsAvg,
      this.healingDoneAvg,
      this.objectiveKillsAvg,
      this.objectiveTimeAvg,
      this.soloKillsAvg,
      this.competitiveGames});

  factory CompetitiveStats.fromJson(Map<String, dynamic> parsedJson) {
    return CompetitiveStats(
      eliminationsAvg: parsedJson['eliminationsAvg'],
      damageDoneAvg: parsedJson['damageDoneAvg'],
      deathsAvg: parsedJson['deathsAvg'],
      healingDoneAvg: parsedJson['healingDoneAvg'],
      objectiveKillsAvg: parsedJson['objectiveKillsAvg'],
      objectiveTimeAvg: parsedJson['objectiveTimeAvg'],
      soloKillsAvg: parsedJson['soloKillsAvg'],
      competitiveGames: CompetitiveGames.fromJson(parsedJson['games']),
    );
  }
}

class CompetitiveGames {
  final int competitiveGamesPlayed;
  final int competitiveGamesWon;

  CompetitiveGames({this.competitiveGamesPlayed, this.competitiveGamesWon});

  factory CompetitiveGames.fromJson(Map<String, dynamic> json) {
    return CompetitiveGames(
        competitiveGamesPlayed: json['played'],
        competitiveGamesWon: json['won']);
  }
}
