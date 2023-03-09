import 'path_provider_helper.dart';

class AnimaInfo {
  static List animaSteps = [
    'Animated',
    'Awoken',
    'Anima',
    'Hyperconductive',
    'Reconditioned',
    'Sharpened',
    'Complete',
    'Lux'
  ];

  static Map animaLinks = {
    'animated':
        'https://ffxiv.consolegameswiki.com/wiki/Animated_Weapons/Quest',
    'awoken': 'https://ffxiv.consolegameswiki.com/wiki/Awoken_Weapons/Quest',
    'anima': 'https://ffxiv.consolegameswiki.com/wiki/Anima_Weapons/Quest',
    'hyperconductive':
        'https://ffxiv.consolegameswiki.com/wiki/Hyperconductive_Anima_Weapons/Quest',
    'reconditioned':
        'https://ffxiv.consolegameswiki.com/wiki/Reconditioned_Anima_Weapons/Quest',
    'sharpened':
        'https://ffxiv.consolegameswiki.com/wiki/Sharpened_Anima_Weapons/Quest',
    'complete':
        'https://ffxiv.consolegameswiki.com/wiki/Complete_Anima_Weapons/Quest',
    'lux': 'https://ffxiv.consolegameswiki.com/wiki/Lux_Anima_Weapons/Quest'
  };

  calNeededBase(itemsForEach, index) {
    int tally = 0;
    var keysList = SavedData.animaData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.animaData['summary'][keysList[i]][index] == false) {
        tally += 1;
      }
    }
    return tally * itemsForEach;
  }
}

class AnimatedCal {
  static int noduleForEach = 1;

  calAstralNodule() {
    return AnimaInfo().calNeededBase(noduleForEach, 0) -
        SavedData.animaData['animated']['astral'];
  }

  calUmbralNodule() {
    return AnimaInfo().calNeededBase(noduleForEach, 0) -
        SavedData.animaData['animated']['umbral'];
  }
}

class AnimaCal {
  static int item1ForEach = 10;
  static int item2ForEach = 4;

  calBone() {
    return AnimaInfo().calNeededBase(item1ForEach, 2) -
        SavedData.animaData['anima']['bone'];
  }

  calShell() {
    return AnimaInfo().calNeededBase(item1ForEach, 2) -
        SavedData.animaData['anima']['shell'];
  }

  calOre() {
    return AnimaInfo().calNeededBase(item1ForEach, 2) -
        SavedData.animaData['anima']['ore'];
  }

  calSeeds() {
    return AnimaInfo().calNeededBase(item1ForEach, 2) -
        SavedData.animaData['anima']['seeds'];
  }

  calAdam() {
    return AnimaInfo().calNeededBase(item2ForEach, 2) -
        SavedData.animaData['anima']['adamantite'];
  }

  calTitan() {
    return AnimaInfo().calNeededBase(item2ForEach, 2) -
        SavedData.animaData['anima']['titanium'];
  }

  calArrow() {
    return AnimaInfo().calNeededBase(item2ForEach, 2) -
        SavedData.animaData['anima']['arrow'];
  }

  calKing() {
    return AnimaInfo().calNeededBase(item2ForEach, 2) -
        SavedData.animaData['anima']['kingcake'];
  }
}

class HyperconductiveCal {
  static int oilForEach = 5;

  oilCal() {
    return AnimaInfo().calNeededBase(oilForEach, 3) -
        SavedData.animaData['hyperconductive']['aetherOil'];
  }
}

class ReconditionedCal {
  static int itemsForEach = 60;

  calUmbrite() {
    return AnimaInfo().calNeededBase(itemsForEach, 4) -
        SavedData.animaData['reconditioned']['umbrite'];
  }

  calSand() {
    return AnimaInfo().calNeededBase(itemsForEach, 4) -
        SavedData.animaData['reconditioned']['crystalSand'];
  }
}

class SharpenedCal {
  static int itemsForEach = 50;

  calClusters() {
    return AnimaInfo().calNeededBase(itemsForEach, 5) -
        SavedData.animaData['sharpened']['clusters'];
  }
}

class CompleteCal {
  static int itemsForEach = 15;

  calPneumite() {
    return AnimaInfo().calNeededBase(itemsForEach, 6) -
        SavedData.animaData['complete']['pneumite'];
  }
}

class LuxCal {
  static int itemsForEach = 1;

  calInk() {
    return AnimaInfo().calNeededBase(itemsForEach, 7) -
        SavedData.animaData['lux']['ink'];
  }
}
