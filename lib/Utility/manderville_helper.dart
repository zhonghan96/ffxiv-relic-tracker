import 'path_provider_helper.dart';

class MandervilleInfo {
  static List mandervilleSteps = ['Manderville', 'Amazing M'];

  static Map mandervilleLinks = {
    'manderville':
        'https://ffxiv.consolegameswiki.com/wiki/Manderville_Weapons#Manderville_Weapons_.28iLvl_615.29',
    'amazingManderville':
        'https://ffxiv.consolegameswiki.com/wiki/Manderville_Weapons#Amazing_Manderville_Weapons_.28iLvl_630.29'
  };

  calNeededBase(itemsForEach, index) {
    int tally = 0;
    var keysList = SavedData.mandervilleData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.mandervilleData['summary'][keysList[i]][index] == false) {
        tally += 1;
      }
    }
    return tally * itemsForEach;
  }
}

class MandervilleCal {
  static int meteoritesForEach = 3;

  calMeteorites() {
    return MandervilleInfo().calNeededBase(meteoritesForEach, 0) -
        SavedData.mandervilleData['manderville']['meteorites'];
  }
}

class AmazingMandervilleCal {
  static int condritesForEach = 3;

  calCondrites() {
    return MandervilleInfo().calNeededBase(condritesForEach, 1) -
        SavedData.mandervilleData['amazingManderville']['condrites'];
  }
}
