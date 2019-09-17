import 'package:json_annotation/json_annotation.dart';
import 'CompetitiveStats.dart';

part 'UserProfile.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile {
  @JsonKey(name: 'icon')
  final String profileIcon;

  @JsonKey(name: 'name')
  final String profileName;

  @JsonKey(name: 'level')
  final int profileLevel;

  @JsonKey(name: 'rating')
  final int skillRating;

  @JsonKey(name: 'gamesWon')
  final int allGamesWon;

  @JsonKey(name: 'competitiveStats')
  final CompetitiveStats competitiveStats;

  UserProfile(
      {this.profileIcon,
      this.profileName,
      this.profileLevel,
      this.skillRating,
      this.allGamesWon,
      this.competitiveStats});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
