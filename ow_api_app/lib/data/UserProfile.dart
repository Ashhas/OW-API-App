import 'dart:convert';
import 'CompetitiveStats.dart';

UserProfile profileFromJson(Map<String, dynamic> profile) {
  var jsonData = profile;
  return UserProfile.fromJson(jsonData);
}

class UserProfile {
  final String profileIcon;
  final String profileName;
  final int profileLevel;
  final int skillRating;
  final int allGamesWon;
  final CompetitiveStats competitiveStats;

  UserProfile(
      {this.profileIcon,
      this.profileName,
      this.profileLevel,
      this.skillRating,
      this.allGamesWon,
      this.competitiveStats});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        profileIcon: json['icon'],
        profileName: json['name'],
        profileLevel: json['level'],
        skillRating: json['rating'],
        allGamesWon: json['gamesWon'],
        competitiveStats: CompetitiveStats.fromJson(json['competitiveStats']));
  }
}
