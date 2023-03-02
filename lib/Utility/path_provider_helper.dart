import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class SavedData {
  static Map dataSet = {
    'summary': summaryData,
    'zodiac': zodiacData,
    'anima': animaData,
    'eurekan': eurekanData,
    'resistance': resistanceData,
    'manderville': mandervilleData,
  };

  static Map summaryData = {};
  static Map zodiacData = {};
  static Map animaData = {};
  static Map eurekanData = {};
  static Map resistanceData = {};
  static Map mandervilleData = {};

  static Map newDataSet = {
    'summary': {
      'pld': List.filled(29, false),
      'war': List.filled(29, false),
      'drk': [...List.filled(8, 'N/A'), ...List.filled(21, false)],
      'gnb': [...List.filled(22, 'N/A'), ...List.filled(7, false)],
      'drg': List.filled(29, false),
      'mnk': List.filled(29, false),
      'nin': List.filled(29, false),
      'sam': [...List.filled(16, 'N/A'), ...List.filled(13, false)],
      'rpr': [...List.filled(28, 'N/A'), ...List.filled(1, false)],
      'brd': List.filled(29, false),
      'mch': List.filled(29, false),
      'dnc': [...List.filled(22, 'N/A'), ...List.filled(7, false)],
      'blm': List.filled(29, false),
      'smn': List.filled(29, false),
      'rdm': [...List.filled(16, 'N/A'), ...List.filled(13, false)],
      'whm': List.filled(29, false),
      'sch': List.filled(29, false),
      'ast': [...List.filled(8, 'N/A'), ...List.filled(21, false)],
      'sge': [...List.filled(28, 'N/A'), ...List.filled(1, false)],
    },
    'zodiac': '',
    'anima': '',
    'eurekan': '',
    'resistance': '',
    'manderville': ''
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

  initSummaryData() async {
    final file = await initLocalStorage();
    summaryData = json.decode(await file.readAsString())['summary'];
    return summaryData;
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

    file.writeAsString(json.encode(dataSet));
  }
}
