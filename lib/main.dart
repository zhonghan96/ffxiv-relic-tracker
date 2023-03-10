import 'package:flutter/material.dart';

import 'UI/summary_page.dart';
import 'UI/zodiac.dart';
import 'UI/anima.dart';
import 'UI/eurekan.dart';
import 'UI/resistance.dart';
import 'UI/manderville.dart';

import 'Utility/config.dart';
// import 'Utility/path_provider_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Only needed during development & testing
    // SavedData().initAllData();

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
        ),
        backgroundColor: ColorPallete.appBar,
      ),
      drawer: Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 130.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: ColorPallete.drawerHeader),
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
              itemCount: StaticLists.drawerItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    StaticLists.drawerItems[index],
                    style: TextFormating.drawerListItems,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(pageTitle: StaticLists.drawerItems[index]),
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
      // Button to update Local Save File with new Data Structure
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   SavedData().updateBaseFile();
      // }),
    );
  }
}
