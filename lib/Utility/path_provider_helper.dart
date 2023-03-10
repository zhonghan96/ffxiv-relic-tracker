import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class SavedData {
  static Map zodiacData = {};
  static Map animaData = {};
  static Map eurekanData = {};
  static Map resistanceData = {};
  static Map mandervilleData = {};

  static Map newDataSet = {
    'zodiac': {
      'summary': {
        'pld': List.filled(8, false),
        'war': List.filled(8, false),
        'drg': List.filled(8, false),
        'mnk': List.filled(8, false),
        'nin': List.filled(8, false),
        'brd': List.filled(8, false),
        'mch': List.filled(8, false),
        'blm': List.filled(8, false),
        'smn': List.filled(8, false),
        'whm': List.filled(8, false),
        'sch': List.filled(8, false),
      },
      'zenith': {'mist': 0},
      'atma': {
        'lion': 0,
        'water': 0,
        'ram': 0,
        'crab': 0,
        'fish': 0,
        'bull': 0,
        'scales': 0,
        'twins': 0,
        'scorpion': 0,
        'archer': 0,
        'goat': 0,
        'maiden': 0
      },
      'novus': {'ink': 0, 'alexandrite': 0},
    },
    'anima': {
      'summary': {
        'pld': List.filled(8, false),
        'war': List.filled(8, false),
        'drk': List.filled(8, false),
        'drg': List.filled(8, false),
        'mnk': List.filled(8, false),
        'nin': List.filled(8, false),
        'brd': List.filled(8, false),
        'mch': List.filled(8, false),
        'blm': List.filled(8, false),
        'smn': List.filled(8, false),
        'whm': List.filled(8, false),
        'sch': List.filled(8, false),
        'ast': List.filled(8, false),
      },
      'animated': {'astral': 0, 'umbral': 0},
      'anima': {
        'bone': 0,
        'shell': 0,
        'ore': 0,
        'seeds': 0,
        'adamantite': 0,
        'titanium': 0,
        'arrow': 0,
        'kingcake': 0
      },
      'hyperconductive': {'aetherOil': 0},
      'reconditioned': {'umbrite': 0, 'crystalSand': 0},
      'sharpened': {'clusters': 0},
      'complete': {'pneumite': 0},
      'lux': {'ink': 0}
    },
    'eurekan': {
      'summary': {
        'pld': List.filled(6, false),
        'war': List.filled(6, false),
        'drk': List.filled(6, false),
        'drg': List.filled(6, false),
        'mnk': List.filled(6, false),
        'nin': List.filled(6, false),
        'sam': List.filled(6, false),
        'brd': List.filled(6, false),
        'mch': List.filled(6, false),
        'blm': List.filled(6, false),
        'smn': List.filled(6, false),
        'rdm': List.filled(6, false),
        'whm': List.filled(6, false),
        'sch': List.filled(6, false),
        'ast': List.filled(6, false),
      },
      'anemos': {'proteanCrystal': 0, 'pazuzusFeather': 0},
      'elemental': {'frostedCrystal': 0, 'pagosCrystal': 0, 'louhisIce': 0},
      'pyros': {'pyrosCrystal': 0, 'penthesileasFlame': 0},
      'eureka': {'hydatosCrystal': 0, 'crystalineScale': 0},
      'physeos': {'eurekaFragment': 0}
    },
    'resistance': {
      'summary': {
        'pld': List.filled(6, false),
        'war': List.filled(6, false),
        'drk': List.filled(6, false),
        'gnb': List.filled(6, false),
        'drg': List.filled(6, false),
        'mnk': List.filled(6, false),
        'nin': List.filled(6, false),
        'sam': List.filled(6, false),
        'brd': List.filled(6, false),
        'mch': List.filled(6, false),
        'dnc': List.filled(6, false),
        'blm': List.filled(6, false),
        'smn': List.filled(6, false),
        'rdm': List.filled(6, false),
        'whm': List.filled(6, false),
        'sch': List.filled(6, false),
        'ast': List.filled(6, false),
      },
      'resistance': {'scalepowders': 0},
      'augmentedV1': {'torturedMem': 0, 'sorrowfulMem': 0, 'harrowingMem': 0},
      'recollection': {'bitterMem': 0},
      'lawsOrder': {'loathsomeMem': 0},
      'augmentedV2': {'timewornArti': 0},
      'blades': {'rawEmotions': 0}
    },
    'manderville': {
      'summary': {
        'pld': List.filled(2, false),
        'war': List.filled(2, false),
        'drk': List.filled(2, false),
        'gnb': List.filled(2, false),
        'drg': List.filled(2, false),
        'mnk': List.filled(2, false),
        'nin': List.filled(2, false),
        'sam': List.filled(2, false),
        'rpr': List.filled(2, false),
        'brd': List.filled(2, false),
        'mch': List.filled(2, false),
        'dnc': List.filled(2, false),
        'blm': List.filled(2, false),
        'smn': List.filled(2, false),
        'rdm': List.filled(2, false),
        'whm': List.filled(2, false),
        'sch': List.filled(2, false),
        'ast': List.filled(2, false),
        'sge': List.filled(2, false),
      },
      'manderville': {'meteorites': 0},
      'amazingManderville': {'condrites': 0}
    },
  };

  getStorageDir() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/ffxivweapon.txt');
  }

  initLocalStorage() async {
    final file = await getStorageDir();

    if (!file.existsSync()) {
      file.create(recursive: true);
      file.writeAsString(json.encode(newDataSet));
    }

    return file;
  }

  initZodiacData() async {
    final file = await initLocalStorage();
    zodiacData = json.decode(await file.readAsString())['zodiac'];
    return zodiacData;
  }

  initAnimaData() async {
    final file = await initLocalStorage();
    animaData = json.decode(await file.readAsString())['anima'];
    return animaData;
  }

  initEurekanData() async {
    final file = await initLocalStorage();
    eurekanData = json.decode(await file.readAsString())['eurekan'];
    return eurekanData;
  }

  initResistanceData() async {
    final file = await initLocalStorage();
    resistanceData = json.decode(await file.readAsString())['resistance'];
    return resistanceData;
  }

  initMandervilleData() async {
    final file = await initLocalStorage();
    mandervilleData = json.decode(await file.readAsString())['manderville'];
    return mandervilleData;
  }

  updateLocalStorage() async {
    final file = await getStorageDir();

    final Map dataSet = {
      'zodiac': zodiacData,
      'anima': animaData,
      'eurekan': eurekanData,
      'resistance': resistanceData,
      'manderville': mandervilleData,
    };

    file.writeAsString(json.encode(dataSet));
  }

  updateBaseFile() async {
    final file = await getStorageDir();

    file.writeAsString(json.encode(newDataSet));
  }
}
