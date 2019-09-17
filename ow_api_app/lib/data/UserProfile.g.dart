// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
      profileIcon: json['icon'] as String,
      profileName: json['name'] as String,
      profileLevel: json['level'] as int,
      skillRating: json['rating'] as int,
      allGamesWon: json['gamesWon'] as int,
      competitiveStats: json['competitiveStats'] == null
          ? null
          : CompetitiveStats.fromJson(
              json['competitiveStats'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'icon': instance.profileIcon,
      'name': instance.profileName,
      'level': instance.profileLevel,
      'rating': instance.skillRating,
      'gamesWon': instance.allGamesWon,
      'competitiveStats': instance.competitiveStats
    };
