import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_text/extended_text.dart';

import '/Utility/config.dart';
import '/Utility/path_provider_helper.dart';
import '/Utility/resistance_helper.dart';

class ResistancePage extends StatelessWidget {
  const ResistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ResistanceStep(),
          AugmentedV1Step(),
          RecollectionStep(),
          LawsOrderStep(),
          AugmentedV2Step(),
          BladesStep(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

//   _____           _     _
//  |  __ \         (_)   | |
//  | |__) |___  ___ _ ___| |_ __ _ _ __   ___ ___
//  |  _  // _ \/ __| / __| __/ _` | '_ \ / __/ _ \
//  | | \ \  __/\__ \ \__ \ || (_| | | | | (_|  __/
//  |_|  \_\___||___/_|___/\__\__,_|_| |_|\___\___|

class ResistanceStep extends StatelessWidget {
  const ResistanceStep({super.key});

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
                  'Resistance Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        ResistanceInfo.resistanceLinks['resistance']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color4,
            iconColor: ColorPallete.color4,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'First Resistance weapon can be obtained by completing the ',
                          style: TextFormating.widgetContent,
                        ),
                        TextSpan(
                            text: 'Quest Chain ',
                            style: TextFormating.hyperlink,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse(
                                    'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons/Quest'));
                              }),
                        ImageSpan(
                            Image.asset('assets/images/quest_icon.png').image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Hail to the Queen',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' > ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/quest_icon.png').image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Path to the Past',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' > ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/quest_icon.png').image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' The Bozja Incident',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' > ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/quest_icon.png').image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Fire in the Forge\n\n',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
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
                          text: ' Resistance Is (Not) Futile',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' with 4 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Thavnairian_scalepowder_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Thavnairian Scalepowders',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
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
                        child: ResistanceTable(),
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

class ResistanceTable extends StatefulWidget {
  const ResistanceTable({super.key});

  @override
  State<ResistanceTable> createState() => _ResistanceTableState();
}

class _ResistanceTableState extends State<ResistanceTable> {
  ScalePowdersNotifier scalePowdersNotifier = ScalePowdersNotifier();

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
                            color: ColorPallete.color4,
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
                text: 'Purchased from Sundry Splendors for 250 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Allagan_Tomestone_of_Poetics.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Allagan Tomestone of Poetics',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Thavnairian_scalepowder_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(ResistanceCal.scalepowdersForEach, 0)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['resistance']
                      ['scalepowders']
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
                SavedData.resistanceData['resistance']['scalepowders'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                scalePowdersNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: scalePowdersNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  ResistanceCal().calScalepowders().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//                                            _           _  __      ____
//      /\                                   | |         | | \ \    / /_ |
//     /  \  _   _  __ _ _ __ ___   ___ _ __ | |_ ___  __| |  \ \  / / | |
//    / /\ \| | | |/ _` | '_ ` _ \ / _ \ '_ \| __/ _ \/ _` |   \ \/ /  | |
//   / ____ \ |_| | (_| | | | | | |  __/ | | | ||  __/ (_| |    \  /   | |
//  /_/    \_\__,_|\__, |_| |_| |_|\___|_| |_|\__\___|\__,_|     \/    |_|
//                  __/ |
//                 |___/

class AugmentedV1Step extends StatelessWidget {
  const AugmentedV1Step({super.key});

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
                  'Augmented V1',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        ResistanceInfo.resistanceLinks['augmentedV1']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color4,
            iconColor: ColorPallete.color4,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'Upgraded from a Resistance Weapon through completion of ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' For Want of a Memory',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' by turning in 20 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Tortured_memory_of_the_dying_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Tortured Memories of the Dying',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' 20 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Sorrowful_memory_of_the_dying_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Sorrowful Memories of the Dying',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' and 20 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Harrowing_memory_of_the_dying_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Harrowing Memories of the Dying\n\n',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text:
                              'If this is your first time doing this step, it is highly recommended that you farm them from The Bozjan Southern Front, more details',
                          style: TextFormating.widgetContent,
                        ),
                        TextSpan(
                            text: ' see here',
                            style: TextFormating.hyperlink,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse(ResistanceInfo
                                    .resistanceLinks['augmentedV1']));
                              }),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: AugmentedV1Table(),
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

class AugmentedV1Table extends StatefulWidget {
  const AugmentedV1Table({super.key});

  @override
  State<AugmentedV1Table> createState() => _AugmentedV1TableState();
}

class _AugmentedV1TableState extends State<AugmentedV1Table> {
  TorturedMemNotifier torturedMemNotifier = TorturedMemNotifier();
  SorrowfulMemNotifier sorrowfulMemNotifier = SorrowfulMemNotifier();
  HarrowingMemNotifier harrowingMemNotifier = HarrowingMemNotifier();

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
                            color: ColorPallete.color4,
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
                text: 'Farmed from ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' FATEs',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- Southern Entrenchment in Bozja (average drop rate)\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text:
                    '- Sea of Clouds or Coerthas Western Highlands (100% drop rate)',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Tortured_memory_of_the_dying_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(AugmentedV1Cal.memoriesForEach, 1)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['augmentedV1']
                      ['torturedMem']
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
                SavedData.resistanceData['augmentedV1']['torturedMem'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                torturedMemNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: torturedMemNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AugmentedV1Cal().calTorturedMem().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
        TableRow(children: [
          Tooltip(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            triggerMode: TooltipTriggerMode.tap,
            showDuration: const Duration(seconds: 60),
            richMessage: TextSpan(children: [
              TextSpan(
                text: 'Farmed from ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' FATEs',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- Old Bozja in Bozja (average drop rate)\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text:
                    '- Dravanian Forelands or Churning Mists (100% drop rate)',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Sorrowful_memory_of_the_dying_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(AugmentedV1Cal.memoriesForEach, 1)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['augmentedV1']
                      ['sorrowfulMem']
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
                SavedData.resistanceData['augmentedV1']['sorrowfulMem'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                sorrowfulMemNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: sorrowfulMemNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AugmentedV1Cal().calSorrowfulMem().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
        TableRow(children: [
          Tooltip(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            triggerMode: TooltipTriggerMode.tap,
            showDuration: const Duration(seconds: 60),
            richMessage: TextSpan(children: [
              TextSpan(
                text: 'Farmed from ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' FATEs',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- The Alermuc Climb in Bozja (average drop rate)\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- Azys Lla or Dravanian Hinterlands (100% drop rate)',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Harrowing_memory_of_the_dying_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(AugmentedV1Cal.memoriesForEach, 1)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['augmentedV1']
                      ['harrowingMem']
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
                SavedData.resistanceData['augmentedV1']['harrowingMem'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                harrowingMemNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: harrowingMemNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AugmentedV1Cal().calHarrowingMem().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   _____                _ _           _   _
//  |  __ \              | | |         | | (_)
//  | |__) |___  ___ ___ | | | ___  ___| |_ _  ___  _ __
//  |  _  // _ \/ __/ _ \| | |/ _ \/ __| __| |/ _ \| '_ \
//  | | \ \  __/ (_| (_) | | |  __/ (__| |_| | (_) | | | |
//  |_|  \_\___|\___\___/|_|_|\___|\___|\__|_|\___/|_| |_|

class RecollectionStep extends StatelessWidget {
  const RecollectionStep({super.key});

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
                  'Recollection Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        ResistanceInfo.resistanceLinks['recollection']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color4,
            iconColor: ColorPallete.color4,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'Upgraded from an Augmented Resistance Weapon through the completion of ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' The Will to Resist',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' by trading in 6 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Bitter_memory_of_the_dying_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Bitter Memories of the Dying',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
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
                        child: RecollectionTable(),
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

class RecollectionTable extends StatefulWidget {
  const RecollectionTable({super.key});

  @override
  State<RecollectionTable> createState() => _RecollectionTableState();
}

class _RecollectionTableState extends State<RecollectionTable> {
  BitterMemNotifier bitterMemNotifier = BitterMemNotifier();

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
                            color: ColorPallete.color4,
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
                text: 'Can be obtained from:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- Synced runs of ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/25px-Dungeon.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Level 60 Dungeons\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- Once per day from',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: ' Duty Roulette: Leveling\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- Random drops from enemies in',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: ' The Bozjan Soutern Front',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ]),
            child: Image.asset(
              'assets/images/Bitter_memory_of_the_dying_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(RecollectionCal.memoriesForEach, 2)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['recollection']
                      ['bitterMem']
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
                SavedData.resistanceData['recollection']['bitterMem'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                bitterMemNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: bitterMemNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  RecollectionCal().calBitterMem().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   _                    _        ____          _
//  | |                  ( )      / __ \        | |
//  | |     __ ___      _|/ ___  | |  | |_ __ __| | ___ _ __
//  | |    / _` \ \ /\ / / / __| | |  | | '__/ _` |/ _ \ '__|
//  | |___| (_| |\ V  V /  \__ \ | |__| | | | (_| |  __/ |
//  |______\__,_| \_/\_/   |___/  \____/|_|  \__,_|\___|_|

class LawsOrderStep extends StatelessWidget {
  const LawsOrderStep({super.key});

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
                  "Law's Order Weapon",
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(
                        Uri.parse(ResistanceInfo.resistanceLinks['lawsOrder']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color4,
            iconColor: ColorPallete.color4,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'Upgraded from a Recollection Weapon through the completion of ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Change of Arms',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' with 15 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Loathsome_memory_of_the_dying_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Loathsome Memories of the Dying',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
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
                        child: LawsOrderTable(),
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

class LawsOrderTable extends StatefulWidget {
  const LawsOrderTable({super.key});

  @override
  State<LawsOrderTable> createState() => _LawsOrderTableState();
}

class _LawsOrderTableState extends State<LawsOrderTable> {
  LoathsomeMemNotifier loathsomeMemNotifier = LoathsomeMemNotifier();

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
                            color: ColorPallete.color4,
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
                text: 'Sources are:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 5 from defeating the final boss of ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Raid.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Castrum Lacus Litore\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- 1 from clearning any ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Raid.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Crystal Tower alliance raid\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- A chance of 1 from completing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/40px-Critical_engagement_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Critial Engagements',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in The Bozjan Soutern Front',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Loathsome_memory_of_the_dying_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(LawsOrderCal.memoriesForEach, 3)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['lawsOrder']
                      ['loathsomeMem']
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
                SavedData.resistanceData['lawsOrder']['loathsomeMem'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                loathsomeMemNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: loathsomeMemNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  LawsOrderCal().calLoathsomeMem().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//                                            _           _  __      _____
//      /\                                   | |         | | \ \    / /__ \
//     /  \  _   _  __ _ _ __ ___   ___ _ __ | |_ ___  __| |  \ \  / /   ) |
//    / /\ \| | | |/ _` | '_ ` _ \ / _ \ '_ \| __/ _ \/ _` |   \ \/ /   / /
//   / ____ \ |_| | (_| | | | | | |  __/ | | | ||  __/ (_| |    \  /   / /_
//  /_/    \_\__,_|\__, |_| |_| |_|\___|_| |_|\__\___|\__,_|     \/   |____|
//                  __/ |
//                 |___/

class AugmentedV2Step extends StatelessWidget {
  const AugmentedV2Step({super.key});

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
                  'Augmented V2',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        ResistanceInfo.resistanceLinks['augmentedV2']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color4,
            iconColor: ColorPallete.color4,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              "Upgraded from a Law's Order Weapon through the completion of ",
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' A New Path of Resistance',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' with 15 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Timeworn_artifact_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Timeworn Artifacts\n\n',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text:
                              "If this is the your first time reaching this step, there is a",
                          style: TextFormating.widgetContent,
                        ),
                        TextSpan(
                          text: " one-time grind",
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text:
                              " that needs to be completed prior, for more details",
                          style: TextFormating.widgetContent,
                        ),
                        TextSpan(
                            text: " see here",
                            style: TextFormating.hyperlink,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse(
                                    'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#First_One-Time_Grind'));
                              }),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: AugmentedV2Table(),
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

class AugmentedV2Table extends StatefulWidget {
  const AugmentedV2Table({super.key});

  @override
  State<AugmentedV2Table> createState() => _AugmentedV2TableState();
}

class _AugmentedV2TableState extends State<AugmentedV2Table> {
  TimewornArtiNotifier timewornArtiNotifier = TimewornArtiNotifier();

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
                            color: ColorPallete.color4,
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
                text: 'Sources are:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- A chance to drop in ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Deep_Dungeon.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Palace of the Dead\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- 3 from every run of ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Raid.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Delubrum Reginae\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ]),
            child: Image.asset(
              'assets/images/Timeworn_artifact_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(AugmentedV2Cal.artiForEach, 4)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.resistanceData['augmentedV2']
                      ['timewornArti']
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
                SavedData.resistanceData['augmentedV2']['timewornArti'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                timewornArtiNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: timewornArtiNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AugmentedV2Cal().calTimewornArti().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   ____  _           _
//  |  _ \| |         | |
//  | |_) | | __ _  __| | ___  ___
//  |  _ <| |/ _` |/ _` |/ _ \/ __|
//  | |_) | | (_| | (_| |  __/\__ \
//  |____/|_|\__,_|\__,_|\___||___/

class BladesStep extends StatelessWidget {
  const BladesStep({super.key});

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
                  "Blade's Weapon",
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(
                        Uri.parse(ResistanceInfo.resistanceLinks['blades']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color4,
            iconColor: ColorPallete.color4,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              "Upgraded from an Augmented Law's Order through the completion of ",
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Repeatablefeaturequest.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Irresistible',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text: ' with 15 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/Raw_emotion_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Raw Emotions\n\n',
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text:
                              "If this is the your first time reaching this step, there is a",
                          style: TextFormating.widgetContent,
                        ),
                        TextSpan(
                          text: " one-time grind",
                          style: TextFormating.widgetContent.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorPallete.color4),
                        ),
                        TextSpan(
                          text:
                              " that needs to be completed prior, for more details",
                          style: TextFormating.widgetContent,
                        ),
                        TextSpan(
                            text: " see here",
                            style: TextFormating.hyperlink,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse(
                                    'https://ffxiv.consolegameswiki.com/wiki/Resistance_Weapons#Second_One-Time_Grind'));
                              }),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: BladesTable(),
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

class BladesTable extends StatefulWidget {
  const BladesTable({super.key});

  @override
  State<BladesTable> createState() => _BladesTableState();
}

class _BladesTableState extends State<BladesTable> {
  RawEmotionsNotifier rawEmotionsNotifier = RawEmotionsNotifier();

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
                            color: ColorPallete.color4,
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
                text: 'Sources are:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 3 from completing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Raid.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' The Dalriada\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- 2 from completing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Raid.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Delubrum Reginae\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- 1 from completing synced runs of ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/25px-Dungeon.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Level 70 Stormblood Dungeons\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- A chance to drop in ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Deep_Dungeon.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' Heaven-on-High\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ]),
            child: Image.asset(
              'assets/images/Raw_emotion_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ResistanceInfo()
                .calNeededBase(BladesCal.emotionsForEach, 5)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.resistanceData['blades']['rawEmotions'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.resistanceData['blades']['rawEmotions'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                rawEmotionsNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: rawEmotionsNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  BladesCal().calRawEmotions().toString(),
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

class ScalePowdersNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['resistance']['scalepowders']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['resistance']['scalepowders'];
  }
}

class TorturedMemNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['augmentedV1']['torturedMem']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['augmentedV1']['torturedMem'];
  }
}

class SorrowfulMemNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['augmentedV1']['sorrowfulMem']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['augmentedV1']['sorrowfulMem'];
  }
}

class HarrowingMemNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['augmentedV1']['harrowingMem']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['augmentedV1']['harrowingMem'];
  }
}

class BitterMemNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['recollection']['bitterMem']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['recollection']['bitterMem'];
  }
}

class LoathsomeMemNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['lawsOrder']['loathsomeMem']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['lawsOrder']['loathsomeMem'];
  }
}

class TimewornArtiNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['augmentedV2']['timewornArti']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['augmentedV2']['timewornArti'];
  }
}

class RawEmotionsNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.resistanceData['blades']['rawEmotions']);

  void updateNotifierValue() {
    _notifier.value = SavedData.resistanceData['blades']['rawEmotions'];
  }
}
