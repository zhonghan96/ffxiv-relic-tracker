import 'path_provider_helper.dart';

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
