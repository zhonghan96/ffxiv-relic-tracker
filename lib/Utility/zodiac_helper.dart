import 'path_provider_helper.dart';

class ZodiacInfo {
  static List zodiacSteps = [
    'Zodiac',
    'Zenith',
    'Atma',
    'Animus',
    'Novus',
    'Nexus',
    'Braves',
    'Zeta'
  ];

  static Map zodiacLinks = {
    'zodiac': 'https://ffxiv.consolegameswiki.com/wiki/Zodiac_Weapons/Quest',
    'zenith':
        'https://ffxiv.consolegameswiki.com/wiki/Zenith_Zodiac_Weapons/Quest',
    'atma': 'https://ffxiv.consolegameswiki.com/wiki/Atma_Zodiac_Weapons/Quest',
    'animus':
        'https://ffxiv.consolegameswiki.com/wiki/Animus_Zodiac_Weapons/Quest',
    'novus':
        'https://ffxiv.consolegameswiki.com/wiki/Novus_Zodiac_Weapons/Quest',
    'nexus':
        'https://ffxiv.consolegameswiki.com/wiki/Nexus_Zodiac_Weapons/Quest',
    'braves':
        'https://ffxiv.consolegameswiki.com/wiki/Zodiac_Braves_Weapons/Quest',
    'zeta': 'https://ffxiv.consolegameswiki.com/wiki/Zodiac_Zeta_Weapons/Quest'
  };
}

class ZenithCal {
  static int mistForEach = 3;

  calNeededMist() {
    int tally = 0;
    var keysList = SavedData.zodiacData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.zodiacData['summary'][keysList[i]][1] == false) {
        tally += 1;
      }
    }
    return tally * mistForEach;
  }

  calMist() {
    return calNeededMist() - SavedData.zodiacData['zenith']['mist'];
  }
}

class AtmaCal {
  static int itemsForEach = 1;

  calNeededAtma() {
    int tally = 0;
    var keysList = SavedData.zodiacData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.zodiacData['summary'][keysList[i]][2] == false) {
        tally += 1;
      }
    }
    return tally * itemsForEach;
  }

  calLion() {
    return calNeededAtma() - SavedData.zodiacData['atma']['lion'];
  }

  calWater() {
    return calNeededAtma() - SavedData.zodiacData['atma']['water'];
  }

  calRam() {
    return calNeededAtma() - SavedData.zodiacData['atma']['ram'];
  }

  calCrab() {
    return calNeededAtma() - SavedData.zodiacData['atma']['crab'];
  }

  calFish() {
    return calNeededAtma() - SavedData.zodiacData['atma']['fish'];
  }

  calBull() {
    return calNeededAtma() - SavedData.zodiacData['atma']['bull'];
  }

  calScales() {
    return calNeededAtma() - SavedData.zodiacData['atma']['scales'];
  }

  calTwins() {
    return calNeededAtma() - SavedData.zodiacData['atma']['twins'];
  }

  calScorpion() {
    return calNeededAtma() - SavedData.zodiacData['atma']['scorpion'];
  }

  calArcher() {
    return calNeededAtma() - SavedData.zodiacData['atma']['archer'];
  }

  calGoat() {
    return calNeededAtma() - SavedData.zodiacData['atma']['goat'];
  }

  calMaiden() {
    return calNeededAtma() - SavedData.zodiacData['atma']['maiden'];
  }
}

class NovusCal {
  static int inkForEach = 3;
  static int alexForEach = 75;

  calNeededInk() {
    int tally = 0;
    var keysList = SavedData.zodiacData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.zodiacData['summary'][keysList[i]][4] == false) {
        tally += 1;
      }
    }
    return tally * inkForEach;
  }

  calNeededAlex() {
    int tally = 0;
    var keysList = SavedData.zodiacData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.zodiacData['summary'][keysList[i]][4] == false) {
        tally += 1;
      }
    }
    return tally * alexForEach;
  }

  calInk() {
    return calNeededInk() - SavedData.zodiacData['novus']['ink'];
  }

  calAlex() {
    return calNeededAlex() - SavedData.zodiacData['novus']['alexandrite'];
  }
}
