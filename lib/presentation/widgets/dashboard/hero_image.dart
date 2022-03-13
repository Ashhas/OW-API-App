import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String heroName;
  final double? imageWidth;
  final double? imageHeight;

  const HeroImage({
    Key? key,
    required this.heroName,
    this.imageWidth = 112,
    this.imageHeight = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (heroName == "Diva") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/dva.png',
      );
    } else if (heroName == "Orisa") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/orisa.png',
      );
    } else if (heroName == "Reinhardt") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/rein.png',
      );
    } else if (heroName == "Roadhog") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/roadhog.png',
      );
    } else if (heroName == "Sigma") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/sigma.png',
      );
    } else if (heroName == "Winston") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/winston.png',
      );
    } else if (heroName == "WreckingBall") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/wrecking-ball.png',
      );
    } else if (heroName == "Zarya") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/zarya.png',
      );
    } else if (heroName == "Ashe") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/ashe.png',
      );
    } else if (heroName == "Bastion") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/bastion.png',
      );
    } else if (heroName == "Doomfist") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/doomfist.png',
      );
    } else if (heroName == "Echo") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/echo.png',
      );
    } else if (heroName == "Genji") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/genji.png',
      );
    } else if (heroName == "Hanzo") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/hanzo.png',
      );
    } else if (heroName == "Junkrat") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/junkrat.png',
      );
    } else if (heroName == "McCree") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/mccree.png',
      );
    } else if (heroName == "Mei") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/mei.png',
      );
    } else if (heroName == "Pharah") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/pharah.png',
      );
    } else if (heroName == "Reaper") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/reaper.png',
      );
    } else if (heroName == "Soldier76") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/soldier-76.png',
      );
    } else if (heroName == "Sombra") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/sombra.png',
      );
    } else if (heroName == "Symmetra") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/symmetra.png',
      );
    } else if (heroName == "Torbjorn") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/torbjorn.png',
      );
    } else if (heroName == "Tracer") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/tracer.png',
      );
    } else if (heroName == "Widowmaker") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/widowmaker.png',
      );
    } else if (heroName == "Ana") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/ana.png',
      );
    } else if (heroName == "Baptiste") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/baptiste.png',
      );
    } else if (heroName == "Brigitte") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/brigitte.png',
      );
    } else if (heroName == "Lucio") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/lucio.png',
      );
    } else if (heroName == "Mercy") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/mercy.png',
      );
    } else if (heroName == "Moira") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/moira.png',
      );
    } else if (heroName == "Zenyatta") {
      return _defaultImageBox(
        imageUrl: 'assets/heroIcons/zenyatta.png',
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  _defaultImageBox({required String imageUrl}) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Center(
        child: Image(
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
