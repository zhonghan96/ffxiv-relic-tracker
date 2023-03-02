import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'UI/summary_page.dart';
import 'UI/zodiac.dart';
import 'UI/anima.dart';
import 'UI/eurekan.dart';
import 'UI/resistance.dart';
import 'UI/manderville.dart';

import 'Utility/config.dart';
import 'Utility/path_provider_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SavedData().initLocalStorage();

    return MaterialApp(
      title: 'FFXIV Relic Weapon Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      home: const HomePage(
        pageTitle: 'Progress Summary',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String pageTitle;
  const HomePage({super.key, required this.pageTitle});

  bodyDisplay() {
    switch (pageTitle) {
      case 'Progress Summary':
        return const SummaryPage();
      case 'Zodiac Weapons':
        return const ZodiacPage();
      case 'Anima Weapons':
        return const AnimaPage();
      case 'Eurekan Weapons':
        return const EurekanPage();
      case 'Resistance Weapons':
        return const ResistancePage();
      case 'Manderville Weapons':
        return const MandervillePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        pageTitle,
        style: TextFormating.appBarText,
      )),
      drawer: Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 130.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: ColorPallete.color4),
              child: Text(
                'FFXIV Relic Weapon Tracker',
                style: TextFormating.drawerHeader,
              ),
            ),
          ),
          SizedBox(
            height: 600.0,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    drawerItems[index],
                    style: TextFormating.drawerListItems,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(pageTitle: drawerItems[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]),
      ),
      body: bodyDisplay(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        print(SavedData.dataSet);
      }),
    );
  }
}
