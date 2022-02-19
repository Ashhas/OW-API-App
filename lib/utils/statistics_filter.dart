import 'package:ow_api_app/data/model/profile_model.dart';

class StatisticsFilter {
  /// Sort the TopHeroes list
  static List<Map<String, TopHero?>> sortTopHeroes(Profile profile) {
    List<Map<String, TopHero?>> allTopHeroes = [];

    if (profile.competitiveStats?.topHeroes?.baptiste is TopHero) {
      allTopHeroes
          .add({"Baptiste": profile.competitiveStats?.topHeroes?.baptiste});
    }
    if (profile.competitiveStats?.topHeroes?.zarya is TopHero) {
      allTopHeroes.add({"Zarya": profile.competitiveStats?.topHeroes?.zarya});
    }
    if (profile.competitiveStats?.topHeroes?.winston is TopHero) {
      allTopHeroes
          .add({"Winston": profile.competitiveStats?.topHeroes?.winston});
    }
    if (profile.competitiveStats?.topHeroes?.widowmaker is TopHero) {
      allTopHeroes
          .add({"Widowmaker": profile.competitiveStats?.topHeroes?.widowmaker});
    }
    if (profile.competitiveStats?.topHeroes?.tracer is TopHero) {
      allTopHeroes.add({"Tracer": profile.competitiveStats?.topHeroes?.tracer});
    }
    if (profile.competitiveStats?.topHeroes?.torbjorn is TopHero) {
      allTopHeroes
          .add({"Torbjorn": profile.competitiveStats?.topHeroes?.torbjorn});
    }
    if (profile.competitiveStats?.topHeroes?.symmetra is TopHero) {
      allTopHeroes
          .add({"Symmetra": profile.competitiveStats?.topHeroes?.symmetra});
    }
    if (profile.competitiveStats?.topHeroes?.sombra is TopHero) {
      allTopHeroes.add({"Sombra": profile.competitiveStats?.topHeroes?.sombra});
    }
    if (profile.competitiveStats?.topHeroes?.soldier76 is TopHero) {
      allTopHeroes
          .add({"Soldier76": profile.competitiveStats?.topHeroes?.soldier76});
    }
    if (profile.competitiveStats?.topHeroes?.sigma is TopHero) {
      allTopHeroes.add({"Sigma": profile.competitiveStats?.topHeroes?.sigma});
    }
    if (profile.competitiveStats?.topHeroes?.roadhog is TopHero) {
      allTopHeroes
          .add({"Roadhog": profile.competitiveStats?.topHeroes?.roadhog});
    }
    if (profile.competitiveStats?.topHeroes?.reinhardt is TopHero) {
      allTopHeroes
          .add({"Reinhardt": profile.competitiveStats?.topHeroes?.reinhardt});
    }
    if (profile.competitiveStats?.topHeroes?.reaper is TopHero) {
      allTopHeroes.add({"Reaper": profile.competitiveStats?.topHeroes?.reaper});
    }
    if (profile.competitiveStats?.topHeroes?.pharah is TopHero) {
      allTopHeroes.add({"Pharah": profile.competitiveStats?.topHeroes?.pharah});
    }
    if (profile.competitiveStats?.topHeroes?.orisa is TopHero) {
      allTopHeroes.add({"Orisa": profile.competitiveStats?.topHeroes?.orisa});
    }
    if (profile.competitiveStats?.topHeroes?.moira is TopHero) {
      allTopHeroes.add({"Moira": profile.competitiveStats?.topHeroes?.moira});
    }
    if (profile.competitiveStats?.topHeroes?.mercy is TopHero) {
      allTopHeroes.add({"Mercy": profile.competitiveStats?.topHeroes?.mercy});
    }
    if (profile.competitiveStats?.topHeroes?.mei is TopHero) {
      allTopHeroes.add({"Mei": profile.competitiveStats?.topHeroes?.mei});
    }
    if (profile.competitiveStats?.topHeroes?.mccree is TopHero) {
      allTopHeroes.add({"McCree": profile.competitiveStats?.topHeroes?.mccree});
    }
    if (profile.competitiveStats?.topHeroes?.lucio is TopHero) {
      allTopHeroes.add({"Lucio": profile.competitiveStats?.topHeroes?.lucio});
    }
    if (profile.competitiveStats?.topHeroes?.junkrat is TopHero) {
      allTopHeroes
          .add({"Junkrat": profile.competitiveStats?.topHeroes?.junkrat});
    }
    if (profile.competitiveStats?.topHeroes?.hanzo is TopHero) {
      allTopHeroes.add({"Hanzo": profile.competitiveStats?.topHeroes?.hanzo});
    }
    if (profile.competitiveStats?.topHeroes?.doomfist is TopHero) {
      allTopHeroes
          .add({"Doomfist": profile.competitiveStats?.topHeroes?.doomfist});
    }
    if (profile.competitiveStats?.topHeroes?.brigitte is TopHero) {
      allTopHeroes
          .add({"Brigitte": profile.competitiveStats?.topHeroes?.brigitte});
    }
    if (profile.competitiveStats?.topHeroes?.ashe is TopHero) {
      allTopHeroes.add({"Ashe": profile.competitiveStats?.topHeroes?.ashe});
    }
    if (profile.competitiveStats?.topHeroes?.ana is TopHero) {
      allTopHeroes.add({"Ana": profile.competitiveStats?.topHeroes?.ana});
    }
    if (profile.competitiveStats?.topHeroes?.bastion is TopHero) {
      allTopHeroes
          .add({"Bastion": profile.competitiveStats?.topHeroes?.bastion});
    }
    if (profile.competitiveStats?.topHeroes?.dVa is TopHero) {
      allTopHeroes.add({"Diva": profile.competitiveStats?.topHeroes?.dVa});
    }
    if (profile.competitiveStats?.topHeroes?.echo is TopHero) {
      allTopHeroes.add({"Echo": profile.competitiveStats?.topHeroes?.echo});
    }
    if (profile.competitiveStats?.topHeroes?.genji is TopHero) {
      allTopHeroes.add({"Genji": profile.competitiveStats?.topHeroes?.genji});
    }
    if (profile.competitiveStats?.topHeroes?.wreckingBall is TopHero) {
      allTopHeroes.add(
          {"WreckingBall": profile.competitiveStats?.topHeroes?.wreckingBall});
    }
    if (profile.competitiveStats?.topHeroes?.zenyatta is TopHero) {
      allTopHeroes
          .add({"Zenyatta": profile.competitiveStats?.topHeroes?.zenyatta});
    }

    //Sort List based on TimePlayed
    allTopHeroes.sort((h1, h2) {
      return h2.entries.single.value!.timePlayed!
          .compareTo(h1.entries.single.value!.timePlayed!);
    });

    return allTopHeroes.sublist(0, 3);
  }

  ///Calculate The amount of competitive support games played
  static int calculateSupportGamesPlayed(Profile profile) {
    int supportGamesPlayed = 0;

    if (profile.competitiveStats?.topHeroes?.baptiste is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.baptiste?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile.competitiveStats?.careerStats?.baptiste
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.moira is TopHero) {
      if (profile.competitiveStats?.careerStats?.moira?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile
            .competitiveStats?.careerStats?.moira?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.mercy is TopHero) {
      if (profile.competitiveStats?.careerStats?.mercy?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile
            .competitiveStats?.careerStats?.mercy?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.lucio is TopHero) {
      if (profile.competitiveStats?.careerStats?.lucio?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile
            .competitiveStats?.careerStats?.lucio?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.brigitte is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.brigitte?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile.competitiveStats?.careerStats?.brigitte
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.ana is TopHero) {
      if (profile.competitiveStats?.careerStats?.ana?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile
            .competitiveStats?.careerStats?.ana?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.zenyatta is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.zenyatta?.allHeroGame?.gamesWon !=
          null) {
        supportGamesPlayed += (profile.competitiveStats?.careerStats?.zenyatta
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    return supportGamesPlayed;
  }

  ///Calculate The amount of competitive support games won
  static int calculateSupportGamesWon(Profile profile) {
    int supportGamesWon = 0;

    if (profile.competitiveStats?.topHeroes?.baptiste is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.baptiste?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.baptiste?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.moira is TopHero) {
      if (profile.competitiveStats?.careerStats?.moira?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.moira?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.mercy is TopHero) {
      if (profile.competitiveStats?.careerStats?.mercy?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.mercy?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.lucio is TopHero) {
      if (profile.competitiveStats?.careerStats?.lucio?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.lucio?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.brigitte is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.brigitte?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.brigitte?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.ana is TopHero) {
      if (profile.competitiveStats?.careerStats?.ana?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.ana?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.zenyatta is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.zenyatta?.allHeroGame?.gamesWon !=
          null) {
        supportGamesWon += (profile
            .competitiveStats?.careerStats?.zenyatta?.allHeroGame?.gamesWon)!;
      }
    }

    return supportGamesWon;
  }

  ///Calculate The amount of competitive support games winrate
  static double calculateSupportGamesWinRate(Profile profile) {
    int supportGamesPlayed = 0;
    int supportGamesWon = 0;
    double supportWinRate = 0;

    supportGamesPlayed = calculateSupportGamesPlayed(profile);
    supportGamesWon = calculateSupportGamesWon(profile);

    supportWinRate = ((100 * supportGamesWon) / supportGamesPlayed);

    return supportWinRate;
  }

  ///Calculate The amount of competitive damage games played
  static int calculateDamageGamesPlayed(Profile profile) {
    int damageGamesPlayed = 0;

    if (profile.competitiveStats?.topHeroes?.ashe is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.ashe?.allHeroGame?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.ashe?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.bastion is TopHero) {
      if (profile.competitiveStats?.careerStats?.bastion?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.bastion?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.doomfist is TopHero) {
      if (profile.competitiveStats?.careerStats?.doomfist?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile.competitiveStats?.careerStats?.doomfist
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.echo is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.echo?.allHeroGame?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.echo?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.genji is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.genji?.allHeroGame?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.genji?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.hanzo is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.hanzo?.allHeroGame?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.hanzo?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.junkrat is TopHero) {
      if (profile.competitiveStats?.careerStats?.junkrat?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.junkrat?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.mccree is TopHero) {
      if (profile.competitiveStats?.careerStats?.mccree?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.mccree?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.mei is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.mei?.allHeroGame?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.mei?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.pharah is TopHero) {
      if (profile.competitiveStats?.careerStats?.pharah?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.pharah?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.reaper is TopHero) {
      if (profile.competitiveStats?.careerStats?.reaper?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.reaper?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.soldier76 is TopHero) {
      if (profile.competitiveStats?.careerStats?.soldier76?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile.competitiveStats?.careerStats?.soldier76
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.sombra is TopHero) {
      if (profile.competitiveStats?.careerStats?.sombra?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.sombra?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.symmetra is TopHero) {
      if (profile.competitiveStats?.careerStats?.symmetra?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile.competitiveStats?.careerStats?.symmetra
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.torbjorn is TopHero) {
      if (profile.competitiveStats?.careerStats?.torbjorn?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile.competitiveStats?.careerStats?.torbjorn
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.tracer is TopHero) {
      if (profile.competitiveStats?.careerStats?.tracer?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile
            .competitiveStats?.careerStats?.tracer?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.widowmaker is TopHero) {
      if (profile.competitiveStats?.careerStats?.widowmaker?.allHeroGame
              ?.gamesPlayed !=
          null) {
        damageGamesPlayed += (profile.competitiveStats?.careerStats?.widowmaker
            ?.allHeroGame?.gamesPlayed)!;
      }
    }

    return damageGamesPlayed;
  }

  ///Calculate The amount of competitive damage games won
  static int calculateDamageGamesWon(Profile profile) {
    int damageGamesWon = 0;

    if (profile.competitiveStats?.topHeroes?.ashe is TopHero) {
      if (profile.competitiveStats?.careerStats?.ashe?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.ashe?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.bastion is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.bastion?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.bastion?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.doomfist is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.doomfist?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.doomfist?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.echo is TopHero) {
      if (profile.competitiveStats?.careerStats?.echo?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.echo?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.genji is TopHero) {
      if (profile.competitiveStats?.careerStats?.genji?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.genji?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.hanzo is TopHero) {
      if (profile.competitiveStats?.careerStats?.hanzo?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.hanzo?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.junkrat is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.junkrat?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.junkrat?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.mccree is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.mccree?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.mccree?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.mei is TopHero) {
      if (profile.competitiveStats?.careerStats?.mei?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.mei?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.pharah is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.pharah?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.pharah?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.reaper is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.reaper?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.reaper?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.soldier76 is TopHero) {
      if (profile.competitiveStats?.careerStats?.soldier76?.allHeroGame
              ?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.soldier76?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.sombra is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.sombra?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.sombra?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.symmetra is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.symmetra?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.symmetra?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.torbjorn is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.torbjorn?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.torbjorn?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.tracer is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.tracer?.allHeroGame?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.tracer?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.widowmaker is TopHero) {
      if (profile.competitiveStats?.careerStats?.widowmaker?.allHeroGame
              ?.gamesWon !=
          null) {
        damageGamesWon += (profile
            .competitiveStats?.careerStats?.widowmaker?.allHeroGame?.gamesWon)!;
      }
    }

    return damageGamesWon;
  }

  ///Calculate The competitive damage games winrate
  static double calculateDamageGamesWinRate(Profile profile) {
    int damageGamesPlayed = 0;
    int damageGamesWon = 0;
    double damageWinRate = 0;

    damageGamesPlayed = calculateDamageGamesPlayed(profile);
    damageGamesWon = calculateDamageGamesWon(profile);

    damageWinRate = ((100 * damageGamesWon) / damageGamesPlayed);

    return damageWinRate;
  }

  ///Calculate The amount of competitive tank games played
  static int calculateTankGamesPlayed(Profile profile) {
    int tankGamesPlayed = 0;

    if (profile.competitiveStats?.topHeroes?.orisa is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.orisa?.allHeroGame?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile
            .competitiveStats?.careerStats?.orisa?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.reinhardt is TopHero) {
      if (profile.competitiveStats?.careerStats?.reinhardt?.allHeroGame
              ?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile.competitiveStats?.careerStats?.reinhardt
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.roadhog is TopHero) {
      if (profile.competitiveStats?.careerStats?.roadhog?.allHeroGame
              ?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile
            .competitiveStats?.careerStats?.roadhog?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.sigma is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.sigma?.allHeroGame?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile
            .competitiveStats?.careerStats?.sigma?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.winston is TopHero) {
      if (profile.competitiveStats?.careerStats?.winston?.allHeroGame
              ?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile
            .competitiveStats?.careerStats?.winston?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.wreckingBall is TopHero) {
      if (profile.competitiveStats?.careerStats?.wreckingBall?.allHeroGame
              ?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile.competitiveStats?.careerStats?.wreckingBall
            ?.allHeroGame?.gamesPlayed)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.zarya is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.zarya?.allHeroGame?.gamesPlayed !=
          null) {
        tankGamesPlayed += (profile
            .competitiveStats?.careerStats?.zarya?.allHeroGame?.gamesPlayed)!;
      }
    }

    return tankGamesPlayed;
  }

  ///Calculate The amount of competitive support games won
  static int calculateTankGamesWon(Profile profile) {
    int tankGamesWon = 0;

    if (profile.competitiveStats?.topHeroes?.orisa is TopHero) {
      if (profile.competitiveStats?.careerStats?.orisa?.allHeroGame?.gamesWon !=
          null) {
        tankGamesWon += (profile
            .competitiveStats?.careerStats?.orisa?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.reinhardt is TopHero) {
      if (profile.competitiveStats?.careerStats?.reinhardt?.allHeroGame
              ?.gamesWon !=
          null) {
        tankGamesWon += (profile
            .competitiveStats?.careerStats?.reinhardt?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.roadhog is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.roadhog?.allHeroGame?.gamesWon !=
          null) {
        tankGamesWon += (profile
            .competitiveStats?.careerStats?.roadhog?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.sigma is TopHero) {
      if (profile.competitiveStats?.careerStats?.sigma?.allHeroGame?.gamesWon !=
          null) {
        tankGamesWon += (profile
            .competitiveStats?.careerStats?.sigma?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.winston is TopHero) {
      if (profile
              .competitiveStats?.careerStats?.winston?.allHeroGame?.gamesWon !=
          null) {
        tankGamesWon += (profile
            .competitiveStats?.careerStats?.winston?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.wreckingBall is TopHero) {
      if (profile.competitiveStats?.careerStats?.wreckingBall?.allHeroGame
              ?.gamesWon !=
          null) {
        tankGamesWon += (profile.competitiveStats?.careerStats?.wreckingBall
            ?.allHeroGame?.gamesWon)!;
      }
    }
    if (profile.competitiveStats?.topHeroes?.zarya is TopHero) {
      if (profile.competitiveStats?.careerStats?.zarya?.allHeroGame?.gamesWon !=
          null) {
        tankGamesWon += (profile
            .competitiveStats?.careerStats?.zarya?.allHeroGame?.gamesWon)!;
      }
    }

    return tankGamesWon;
  }

  ///Calculate The competitive tank games winrate
  static double calculateTankGamesWinRate(Profile profile) {
    int tankGamesPlayed = 0;
    int tankGamesWon = 0;
    double tankWinRate = 0;

    tankGamesPlayed = calculateTankGamesPlayed(profile);
    tankGamesWon = calculateTankGamesWon(profile);

    tankWinRate = ((100 * tankGamesWon) / tankGamesPlayed);

    return tankWinRate;
  }
}
