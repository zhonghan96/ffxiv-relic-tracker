import 'path_provider_helper.dart';

class ResistanceInfo {
  static List resistanceSteps = [
    'Resistance',
    'Augmented V1',
    'Recollection',
    "Law's Order",
    "Augmented V2",
    'Blades'
  ];

  static Map resistanceLinks = {
    'resistance':
        'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Resistance_Weapons_.28iLvl_485.29',
    'augmentedV1':
        'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Augmented_Resistance_Weapons_.28iLvl_500.29',
    'recollection':
        'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Recollection_Weapons_.28iLvl_500.29',
    'lawsOrder':
        'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Law.27s_Order_Weapons_.28iLvl_510.29',
    'augmentedV2':
        'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Augmented_Law.27s_Order_Weapons_.28iLvl_515.29',
    'blades':
        'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Blade.27s_Weapons_.28iLvl_535.29'
  };

  calNeededBase(itemsForEach, index) {
    int tally = 0;
    var keysList = SavedData.resistanceData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.resistanceData['summary'][keysList[i]][index] == false) {
        tally += 1;
      }
    }
    return tally * itemsForEach;
  }
}

class ResistanceCal {
  static int scalepowdersForEach = 4;

  calScalepowders() {
    return ResistanceInfo().calNeededBase(scalepowdersForEach, 0) -
        SavedData.resistanceData['resistance']['scalepowders'];
  }
}

class AugmentedV1Cal {
  static int memoriesForEach = 20;

  calTorturedMem() {
    return ResistanceInfo().calNeededBase(memoriesForEach, 1) -
        SavedData.resistanceData['augmentedV1']['torturedMem'];
  }

  calSorrowfulMem() {
    return ResistanceInfo().calNeededBase(memoriesForEach, 1) -
        SavedData.resistanceData['augmentedV1']['sorrowfulMem'];
  }

  calHarrowingMem() {
    return ResistanceInfo().calNeededBase(memoriesForEach, 1) -
        SavedData.resistanceData['augmentedV1']['harrowingMem'];
  }
}

class RecollectionCal {
  static int memoriesForEach = 6;

  calBitterMem() {
    return ResistanceInfo().calNeededBase(memoriesForEach, 2) -
        SavedData.resistanceData['recollection']['bitterMem'];
  }
}

class LawsOrderCal {
  static int memoriesForEach = 15;

  calLoathsomeMem() {
    return ResistanceInfo().calNeededBase(memoriesForEach, 3) -
        SavedData.resistanceData['lawsOrder']['loathsomeMem'];
  }
}

class AugmentedV2Cal {
  static int artiForEach = 15;

  calTimewornArti() {
    return ResistanceInfo().calNeededBase(artiForEach, 4) -
        SavedData.resistanceData['augmentedV2']['timewornArti'];
  }
}

class BladesCal {
  static int emotionsForEach = 15;

  calRawEmotions() {
    return ResistanceInfo().calNeededBase(emotionsForEach, 5) -
        SavedData.resistanceData['blades']['rawEmotions'];
  }
}
