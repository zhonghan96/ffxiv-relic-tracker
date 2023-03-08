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

  calNeededBase(itemsForEach, index) {
    int tally = 0;
    var keysList = SavedData.zodiacData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.zodiacData['summary'][keysList[i]][index] == false) {
        tally += 1;
      }
    }
    return tally * itemsForEach;
  }
}

class ZenithCal {
  static int mistForEach = 3;

  calMist() {
    return ZodiacInfo().calNeededBase(mistForEach, 1) -
        SavedData.zodiacData['zenith']['mist'];
  }
}

class AtmaCal {
  static int itemsForEach = 1;

  calLion() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['lion'];
  }

  calWater() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['water'];
  }

  calRam() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['ram'];
  }

  calCrab() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['crab'];
  }

  calFish() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['fish'];
  }

  calBull() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['bull'];
  }

  calScales() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['scales'];
  }

  calTwins() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['twins'];
  }

  calScorpion() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['scorpion'];
  }

  calArcher() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['archer'];
  }

  calGoat() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['goat'];
  }

  calMaiden() {
    return ZodiacInfo().calNeededBase(itemsForEach, 2) -
        SavedData.zodiacData['atma']['maiden'];
  }
}

class NovusCal {
  static int inkForEach = 3;
  static int alexForEach = 75;

  calInk() {
    return ZodiacInfo().calNeededBase(inkForEach, 4) -
        SavedData.zodiacData['novus']['ink'];
  }

  calAlex() {
    return ZodiacInfo().calNeededBase(alexForEach, 4) -
        SavedData.zodiacData['novus']['alexandrite'];
  }
}
