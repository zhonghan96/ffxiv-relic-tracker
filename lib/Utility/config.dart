import 'package:flutter/material.dart';

class TextFormating {
  static TextStyle appBarText = const TextStyle(fontSize: 20);

  static TextStyle drawerHeader =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle drawerListItemsHeader = const TextStyle(fontSize: 16);
  static TextStyle drawerListItems = const TextStyle(fontSize: 14);
  static TextStyle drawerFootnote = const TextStyle(fontSize: 10);

  static TextStyle widgetHeader =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle widgetContent = const TextStyle(fontSize: 14);
  static TextStyle hyperlink =
      const TextStyle(fontSize: 14, color: Colors.lightBlueAccent);
  static TextStyle widgetSubcontent =
      const TextStyle(fontSize: 12, fontStyle: FontStyle.italic);

  static TextStyle acknowledgements =
      const TextStyle(fontSize: 16);
}

class ColorPallete {
  static Color appBar = const Color(0xFF4E31AA);
  static Color drawerHeader = const Color(0xFF2F58CD);
  static Color color1 = const Color(0xFFa2c4c9);
  static Color color2 = const Color(0xFF9fc5e8);
  static Color color3 = const Color(0xFFa4c2f4);
  static Color color4 = const Color(0xFFB4A7D6);
  static Color color5 = const Color(0xFFD5A6BD);
}

//    _____ _                 _____        __
//   / ____| |               |_   _|      / _|
//  | |    | | __ _ ___ ___    | |  _ __ | |_ ___
//  | |    | |/ _` / __/ __|   | | | '_ \|  _/ _ \
//  | |____| | (_| \__ \__ \  _| |_| | | | || (_) |
//   \_____|_|\__,_|___/___/ |_____|_| |_|_| \___/

class StaticLists {
  static List tableHeaders = ['Resource', 'Needed', 'Inventory', 'Remaining'];

  static List classList = [
    'PLD',
    'WAR',
    'DRK',
    'GNB',
    'DRG',
    'MNK',
    'NIN',
    'SAM',
    'RPR',
    'BRD',
    'MCH',
    'DNC',
    'BLM',
    'SMN',
    'RDM',
    'WHM',
    'SCH',
    'AST',
    'SGE'
  ];
}
