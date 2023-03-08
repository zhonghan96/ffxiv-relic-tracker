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
    },
    'manderville': {
      'summary': {
        'pld': List.filled(1, false),
        'war': List.filled(1, false),
        'drk': List.filled(1, false),
        'gnb': List.filled(1, false),
        'drg': List.filled(1, false),
        'mnk': List.filled(1, false),
        'nin': List.filled(1, false),
        'sam': List.filled(1, false),
        'rpr': List.filled(1, false),
        'brd': List.filled(1, false),
        'mch': List.filled(1, false),
        'dnc': List.filled(1, false),
        'blm': List.filled(1, false),
        'smn': List.filled(1, false),
        'rdm': List.filled(1, false),
        'whm': List.filled(1, false),
        'sch': List.filled(1, false),
        'ast': List.filled(1, false),
        'sge': List.filled(1, false),
      },
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

  initAllData() async {
    // TODO: Remove once app is ready, not needed outside of testing
    final file = await initLocalStorage();
    zodiacData = json.decode(await file.readAsString())['zodiac'];
    animaData = json.decode(await file.readAsString())['anima'];
    eurekanData = json.decode(await file.readAsString())['eurekan'];
    resistanceData = json.decode(await file.readAsString())['resistance'];
    mandervilleData = json.decode(await file.readAsString())['manderville'];
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
