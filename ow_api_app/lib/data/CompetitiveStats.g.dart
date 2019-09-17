// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompetitiveStats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitiveStats _$CompetitiveStatsFromJson(Map<String, dynamic> json) {
  return CompetitiveStats(
      eliminationsAvg: (json['eliminationsAvg'] as num)?.toDouble(),
      damageDoneAvg: (json['damageDoneAvg'] as num)?.toDouble(),
      deathsAvg: (json['deathsAvg'] as num)?.toDouble(),
      healingDoneAvg: (json['healingDoneAvg'] as num)?.toDouble(),
      objectiveKillsAvg: (json['objectiveKillsAvg'] as num)?.toDouble(),
      objectiveTimeAvg: json['objectiveTimeAvg'] as String,
      soloKillsAvg: (json['soloKillsAvg'] as num)?.toDouble(),
      competitiveGames: json['games'] == null
          ? null
          : CompetitiveGames.fromJson(json['games'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CompetitiveStatsToJson(CompetitiveStats instance) =>
    <String, dynamic>{
      'eliminationsAvg': instance.eliminationsAvg,
      'damageDoneAvg': instance.damageDoneAvg,
      'deathsAvg': instance.deathsAvg,
      'healingDoneAvg': instance.healingDoneAvg,
      'objectiveKillsAvg': instance.objectiveKillsAvg,
      'objectiveTimeAvg': instance.objectiveTimeAvg,
      'soloKillsAvg': instance.soloKillsAvg,
      'games': instance.competitiveGames
    };

CompetitiveGames _$CompetitiveGamesFromJson(Map<String, dynamic> json) {
  return CompetitiveGames(
      competitiveGamesPlayed: json['played'] as int,
      competitiveGamesWon: json['won'] as int);
}

Map<String, dynamic> _$CompetitiveGamesToJson(CompetitiveGames instance) =>
    <String, dynamic>{
      'played': instance.competitiveGamesPlayed,
      'won': instance.competitiveGamesWon
    };
