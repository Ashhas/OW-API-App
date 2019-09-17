import 'package:json_annotation/json_annotation.dart';

part 'CompetitiveStats.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetitiveStats {
  @JsonKey(name: 'eliminationsAvg')
  final double eliminationsAvg;

  @JsonKey(name: 'damageDoneAvg')
  final double damageDoneAvg;

  @JsonKey(name: 'deathsAvg')
  final double deathsAvg;

  @JsonKey(name: 'healingDoneAvg')
  final double healingDoneAvg;

  @JsonKey(name: 'objectiveKillsAvg')
  final double objectiveKillsAvg;

  @JsonKey(name: 'objectiveTimeAvg')
  final String objectiveTimeAvg;

  @JsonKey(name: 'soloKillsAvg')
  final double soloKillsAvg;

  @JsonKey(name: 'games')
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

  factory CompetitiveStats.fromJson(Map<String, dynamic> json) =>
      _$CompetitiveStatsFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitiveStatsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CompetitiveGames {
  @JsonKey(name: 'played')
  final int competitiveGamesPlayed;

  @JsonKey(name: 'won')
  final int competitiveGamesWon;

  CompetitiveGames({this.competitiveGamesPlayed, this.competitiveGamesWon});

  factory CompetitiveGames.fromJson(Map<String, dynamic> json) =>
      _$CompetitiveGamesFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitiveGamesToJson(this);
}
