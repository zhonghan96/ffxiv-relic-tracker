import 'package:flutter/material.dart';

import 'UI/summary_page.dart';
import 'UI/zodiac.dart';
import 'UI/anima.dart';
import 'UI/eurekan.dart';
import 'UI/resistance.dart';
import 'UI/manderville.dart';
import 'UI/acknowledgements.dart';

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
      case 'Acknowledgements':
        return const AcknowledgementPage();
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
          SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Relic Weapons',
                        style: TextFormating.drawerListItemsHeader),
                    childrenPadding: const EdgeInsets.only(left: 10),
                    children: [
                      ListTile(
                        title: Text(
                          'Progress Summary',
                          style: TextFormating.drawerListItems,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(pageTitle: 'Progress Summary'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Zodiac Weapons',
                          style: TextFormating.drawerListItems,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(pageTitle: 'Zodiac Weapons'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Anima Weapons',
                          style: TextFormating.drawerListItems,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(pageTitle: 'Anima Weapons'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Eurekan Weapons',
                          style: TextFormating.drawerListItems,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(pageTitle: 'Eurekan Weapons'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Resistance Weapons',
                          style: TextFormating.drawerListItems,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(
                                  pageTitle: 'Resistance Weapons'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Manderville Weapons',
                          style: TextFormating.drawerListItems,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(
                                  pageTitle: 'Manderville Weapons'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Acknowledgements',
              style: TextFormating.drawerListItemsHeader,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const HomePage(pageTitle: 'Acknowledgements'),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              '© SQUARE ENIX CO., LTD. All Rights Reserved.\nFINAL FANTASY is a registered trademark of Square Enix Holdings Co., Ltd. All material used under license.',
              style: TextFormating.drawerFootnote,
            ),
          )
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
