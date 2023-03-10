import 'path_provider_helper.dart';

class EurekanInfo {
  static List eurekanSteps = [
    'Antiquated',
    'Anemos',
    'Elemental',
    'Pyros',
    'Eureka',
    'Physeos'
  ];

  static Map eurekanLinks = {
    'antiquated':
        'https://ffxiv.consolegameswiki.com/wiki/Eurekan_Weapons#Antiquated_Weapons',
    'anemos':
        'https://ffxiv.consolegameswiki.com/wiki/Eurekan_Weapons#Anemos_Weapons',
    'elemental':
        'https://ffxiv.consolegameswiki.com/wiki/Eurekan_Weapons#Elemental_Weapons',
    'pyros':
        'https://ffxiv.consolegameswiki.com/wiki/Eurekan_Weapons#Pyros_Weapons',
    'eureka':
        'https://ffxiv.consolegameswiki.com/wiki/Eurekan_Weapons#Eureka_Weapons',
    'physeos':
        'https://ffxiv.consolegameswiki.com/wiki/Eurekan_Weapons#Physeos_Weapons'
  };

  calNeededBase(itemsForEach, index) {
    int tally = 0;
    var keysList = SavedData.eurekanData['summary'].keys.toList();

    for (var i = 0; i < keysList.length; i++) {
      if (SavedData.eurekanData['summary'][keysList[i]][index] == false) {
        tally += 1;
      }
    }
    return tally * itemsForEach;
  }
}

class AnemosCal {
  static int proteanCrystalForEach = 1300;
  static int pazuzusFeatherForEach = 3;

  calProteanCrystal() {
    return EurekanInfo().calNeededBase(proteanCrystalForEach, 1) -
        SavedData.eurekanData['anemos']['proteanCrystal'];
  }

  calPazuzusFeather() {
    return EurekanInfo().calNeededBase(pazuzusFeatherForEach, 1) -
        SavedData.eurekanData['anemos']['pazuzusFeather'];
  }
}

class ElementalCal {
  static int frostedCrystalForEach = 31;
  static int pagosCrystalForEach = 500;
  static int louhisIceForEach = 5;

  calFrostedCrystal() {
    return EurekanInfo().calNeededBase(frostedCrystalForEach, 2) -
        SavedData.eurekanData['elemental']['frostedCrystal'];
  }

  calPagosCrystal() {
    return EurekanInfo().calNeededBase(pagosCrystalForEach, 2) -
        SavedData.eurekanData['elemental']['pagosCrystal'];
  }

  calLouhisIce() {
    return EurekanInfo().calNeededBase(louhisIceForEach, 2) -
        SavedData.eurekanData['elemental']['louhisIce'];
  }
}

class PyrosCal {
  static int pyrosCrystalForEach = 650;
  static int penthesileasFlameForEach = 5;

  calPyrosCrystal() {
    return EurekanInfo().calNeededBase(pyrosCrystalForEach, 3) -
        SavedData.eurekanData['pyros']['pyrosCrystal'];
  }

  calPenthesileasFlame() {
    return EurekanInfo().calNeededBase(penthesileasFlameForEach, 3) -
        SavedData.eurekanData['pyros']['penthesileasFlame'];
  }
}

class EurekaCal {
  static int hydatosCrystalForEach = 350;
  static int crystalineScaleForEach = 5;

  calHydatosCrystal() {
    return EurekanInfo().calNeededBase(hydatosCrystalForEach, 4) -
        SavedData.eurekanData['eureka']['hydatosCrystal'];
  }

  calCrystalineScale() {
    return EurekanInfo().calNeededBase(crystalineScaleForEach, 4) -
        SavedData.eurekanData['eureka']['crystalineScale'];
  }
}

class PhyseosCal {
  static int eurekaFragmentForEach = 100;

  calEurekaFragment() {
    return EurekanInfo().calNeededBase(eurekaFragmentForEach, 5) -
        SavedData.eurekanData['physeos']['eurekaFragment'];
  }
}
