import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_text/extended_text.dart';

import '/Utility/config.dart';
import '/Utility/path_provider_helper.dart';
import '/Utility/manderville_helper.dart';

class MandervillePage extends StatelessWidget {
  const MandervillePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          MandervilleStep(),
          AmazingMandervilleStep(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

//   __  __                 _                 _ _ _
//  |  \/  |               | |               (_) | |
//  | \  / | __ _ _ __   __| | ___ _ ____   ___| | | ___
//  | |\/| |/ _` | '_ \ / _` |/ _ \ '__\ \ / / | | |/ _ \
//  | |  | | (_| | | | | (_| |  __/ |   \ V /| | | |  __/
//  |_|  |_|\__,_|_| |_|\__,_|\___|_|    \_/ |_|_|_|\___|

class MandervilleStep extends StatelessWidget {
  const MandervilleStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Manderville Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        MandervilleInfo.mandervilleLinks['manderville']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color5,
            iconColor: ColorPallete.color5,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'First Manderville weapon can be obtained by completing ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/quest_icon.png').image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Make It a Manderville\n\n',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color5),
                        ),
                        TextSpan(
                          text: 'Subsequent relics can be obtained through ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Make Another Manderville',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color5),
                        ),
                        TextSpan(
                          text: ' with 3 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Manderium_meteorite_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Manderium Meteorites',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color5),
                        ),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: MandervilleTable(),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class MandervilleTable extends StatefulWidget {
  const MandervilleTable({super.key});

  @override
  State<MandervilleTable> createState() => _MandervilleTableState();
}

class _MandervilleTableState extends State<MandervilleTable> {
  MeteoritesNotifier meteoritesNotifier = MeteoritesNotifier();

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            children: StaticLists.tableHeaders
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: TextFormating.widgetContent.copyWith(
                            color: ColorPallete.color5,
                            fontWeight: FontWeight.w600),
                      ),
                    ))
                .toList()),
        TableRow(children: [
          Tooltip(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            triggerMode: TooltipTriggerMode.tap,
            showDuration: const Duration(seconds: 60),
            richMessage: TextSpan(children: [
              TextSpan(
                text:
                    'Purchased from Jubrunnah in Radz-at-Han (12.2, 10.9) for 500 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/20px-Allagan_Tomestone_of_Astronomy.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Allagan Tomestone of Astronomy',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/40px-Manderium_meteorite_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            MandervilleInfo()
                .calNeededBase(MandervilleCal.meteoritesForEach, 0)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.mandervilleData['manderville']
                      ['meteorites']
                  .toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.mandervilleData['manderville']['meteorites'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                meteoritesNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: meteoritesNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  MandervilleCal().calMeteorites().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//                                _               __  __
//      /\                       (_)             |  \/  |
//     /  \   _ __ ___   __ _ _____ _ __   __ _  | \  / |
//    / /\ \ | '_ ` _ \ / _` |_  / | '_ \ / _` | | |\/| |
//   / ____ \| | | | | | (_| |/ /| | | | | (_| | | |  | |
//  /_/    \_\_| |_| |_|\__,_/___|_|_| |_|\__, | |_|  |_|
//                                         __/ |
//                                        |___/

class AmazingMandervilleStep extends StatelessWidget {
  const AmazingMandervilleStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Amazing Manderville',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(MandervilleInfo
                        .mandervilleLinks['amazingManderville']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color5,
            iconColor: ColorPallete.color5,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'Upgraded from a Manderville Weapon through the completion of ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' The Next Mander-level',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color5),
                        ),
                        TextSpan(
                          text: ' with 3 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Complementary_chondrite_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Complementary Condrites',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color5),
                        ),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: AmazingMandervilleTable(),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class AmazingMandervilleTable extends StatefulWidget {
  const AmazingMandervilleTable({super.key});

  @override
  State<AmazingMandervilleTable> createState() =>
      _AmazingMandervilleTableState();
}

class _AmazingMandervilleTableState extends State<AmazingMandervilleTable> {
  CondritesNotifier condritesNotifier = CondritesNotifier();

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            children: StaticLists.tableHeaders
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: TextFormating.widgetContent.copyWith(
                            color: ColorPallete.color5,
                            fontWeight: FontWeight.w600),
                      ),
                    ))
                .toList()),
        TableRow(children: [
          Tooltip(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            triggerMode: TooltipTriggerMode.tap,
            showDuration: const Duration(seconds: 60),
            richMessage: TextSpan(children: [
              TextSpan(
                text:
                    'Purchased from Jubrunnah in Radz-at-Han (12.2, 10.9) for 500 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/20px-Allagan_Tomestone_of_Astronomy.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Allagan Tomestone of Astronomy',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/40px-Complementary_chondrite_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            MandervilleInfo()
                .calNeededBase(AmazingMandervilleCal.condritesForEach, 1)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.mandervilleData['amazingManderville']
                      ['condrites']
                  .toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.mandervilleData['amazingManderville']['condrites'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                condritesNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: condritesNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AmazingMandervilleCal().calCondrites().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   _      _     _
//  | |    (_)   | |
//  | |     _ ___| |_ ___ _ __   ___ _ __
//  | |    | / __| __/ _ \ '_ \ / _ \ '__|
//  | |____| \__ \ ||  __/ | | |  __/ |
//  |______|_|___/\__\___|_| |_|\___|_|

class MeteoritesNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.mandervilleData['manderville']['meteorites']);

  void updateNotifierValue() {
    _notifier.value = SavedData.mandervilleData['manderville']['meteorites'];
  }
}

class CondritesNotifier {
  final ValueNotifier _notifier = ValueNotifier(
      SavedData.mandervilleData['amazingManderville']['condrites']);

  void updateNotifierValue() {
    _notifier.value =
        SavedData.mandervilleData['amazingManderville']['condrites'];
  }
}
