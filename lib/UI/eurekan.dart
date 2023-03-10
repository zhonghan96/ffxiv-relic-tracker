import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_text/extended_text.dart';

import '/Utility/config.dart';
import '/Utility/path_provider_helper.dart';
import '/Utility/eurekan_helper.dart';

class EurekanPage extends StatelessWidget {
  const EurekanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          AntiquatedStep(),
          AnemosStep(),
          ElementalStep(),
          PyrosStep(),
          EurekaStep(),
          PhyseosStep(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

//                  _   _                   _           _
//      /\         | | (_)                 | |         | |
//     /  \   _ __ | |_ _  __ _ _   _  __ _| |_ ___  __| |
//    / /\ \ | '_ \| __| |/ _` | | | |/ _` | __/ _ \/ _` |
//   / ____ \| | | | |_| | (_| | |_| | (_| | ||  __/ (_| |
//  /_/    \_\_| |_|\__|_|\__, |\__,_|\__,_|\__\___|\__,_|
//                           | |
//                           |_|

class AntiquatedStep extends StatelessWidget {
  const AntiquatedStep({super.key});

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
                  'Antiquated Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(
                        Uri.parse(EurekanInfo.eurekanLinks['antiquated']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color3,
            iconColor: ColorPallete.color3,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text:
                            'Acquired from level 70 job quest. A replacement can be purchased from Calamity Salvager for 1,000 ',
                        style: TextFormating.widgetContent),
                    ImageSpan(Image.asset('assets/images/20px-Gil.png').image,
                        imageWidth: 20, imageHeight: 20),
                    TextSpan(
                      text: ' Gil',
                      style: TextFormating.widgetContent.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorPallete.color3),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//      /\
//     /  \   _ __   ___ _ __ ___   ___  ___
//    / /\ \ | '_ \ / _ \ '_ ` _ \ / _ \/ __|
//   / ____ \| | | |  __/ | | | | | (_) \__ \
//  /_/    \_\_| |_|\___|_| |_| |_|\___/|___/

class AnemosStep extends StatelessWidget {
  const AnemosStep({super.key});

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
                  'Anemos Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(EurekanInfo.eurekanLinks['anemos']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color3,
            iconColor: ColorPallete.color3,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'Upgraded from an Antiquated Weapon with 1,300 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Protean_crystal_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Protean Crystals',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 3 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Pazuzus_feather_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: " Pazuzu's Feathers",
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
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
                        child: AnemosTable(),
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

class AnemosTable extends StatefulWidget {
  const AnemosTable({super.key});

  @override
  State<AnemosTable> createState() => _AnemosTableState();
}

class _AnemosTableState extends State<AnemosTable> {
  ProteanCrystalNotifier proteanCrystalNotifier = ProteanCrystalNotifier();
  PazuzusFeatherNotifier pazuzusFeatherNotifier = PazuzusFeatherNotifier();

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
                            color: ColorPallete.color3,
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
                text: 'Exchanged from Gerolt with ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Anemos_crystal_icon1.png').image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Anemos Crystals',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' obtained from killing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Notorious Monsters',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in Eureka Anemos',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Protean_crystal_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(AnemosCal.proteanCrystalForEach, 1)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['anemos']['proteanCrystal'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['anemos']['proteanCrystal'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                proteanCrystalNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: proteanCrystalNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AnemosCal().calProteanCrystal().toString(),
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
                text: 'Sources:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 3 from killing Pazuzu in ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Wail in the Willows\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- Purchased from Expedition Birdwatcher for 300 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Protean_crystal_icon1.png').image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Protean Crystals',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Pazuzus_feather_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(AnemosCal.pazuzusFeatherForEach, 1)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['anemos']['pazuzusFeather'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['anemos']['pazuzusFeather'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                pazuzusFeatherNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: pazuzusFeatherNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AnemosCal().calPazuzusFeather().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   ______ _                           _        _
//  |  ____| |                         | |      | |
//  | |__  | | ___ _ __ ___   ___ _ __ | |_ __ _| |
//  |  __| | |/ _ \ '_ ` _ \ / _ \ '_ \| __/ _` | |
//  | |____| |  __/ | | | | |  __/ | | | || (_| | |
//  |______|_|\___|_| |_| |_|\___|_| |_|\__\__,_|_|

class ElementalStep extends StatelessWidget {
  const ElementalStep({super.key});

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
                  'Elemental Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(EurekanInfo.eurekanLinks['elemental']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color3,
            iconColor: ColorPallete.color3,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from an Anemos Weapon with 31 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Frosted_protean_crystal_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Frosted Protean Crystals',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ', 500 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/Pagos_crystal_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: " Pagos Crystals",
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 5 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/Louhis_ice_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: " Louhi's Ice",
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
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
                        child: ElementalTable(),
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

class ElementalTable extends StatefulWidget {
  const ElementalTable({super.key});

  @override
  State<ElementalTable> createState() => _ElementalTableState();
}

class _ElementalTableState extends State<ElementalTable> {
  FrostedCrystalNotifier frostedCrystalNotifier = FrostedCrystalNotifier();
  PagosCrystalNotifier pagosCrystalNotifier = PagosCrystalNotifier();
  LouhisIceNotifier louhisIceNotifier = LouhisIceNotifier();

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
                            color: ColorPallete.color3,
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
                text: 'Collect vitiated aether by killing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Notorious Monsters',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    ' in Eureka Pagos and turn it in at the Crystal Forge (6.0, 21.5)',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Frosted_protean_crystal_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(ElementalCal.frostedCrystalForEach, 2)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.eurekanData['elemental']['frostedCrystal']
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
                SavedData.eurekanData['elemental']['frostedCrystal'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                frostedCrystalNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: frostedCrystalNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  ElementalCal().calFrostedCrystal().toString(),
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
                text: 'Acquired by killing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Notorious Monsters',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in Eureka Pagos',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Pagos_crystal_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(ElementalCal.pagosCrystalForEach, 2)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['elemental']['pagosCrystal'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['elemental']['pagosCrystal'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                pagosCrystalNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: pagosCrystalNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  ElementalCal().calPagosCrystal().toString(),
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
                text: 'Sources:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 2 from killing Louhi in ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Louhi on Ice\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- Purchased from Expedition Birdwatcher for 50 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Pagos_crystal_icon1.png').image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Pagos Crystals',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Louhis_ice_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(ElementalCal.louhisIceForEach, 2)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['elemental']['louhisIce'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['elemental']['louhisIce'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                louhisIceNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: louhisIceNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  ElementalCal().calLouhisIce().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   _____
//  |  __ \
//  | |__) |   _ _ __ ___  ___
//  |  ___/ | | | '__/ _ \/ __|
//  | |   | |_| | | | (_) \__ \
//  |_|    \__, |_|  \___/|___/
//          __/ |
//         |___/

class PyrosStep extends StatelessWidget {
  const PyrosStep({super.key});

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
                  'Pyros Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(EurekanInfo.eurekanLinks['pyros']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color3,
            iconColor: ColorPallete.color3,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from an Elemental Weapon with 650 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/Pyros_crystal_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Pyros Crystals',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 5 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Penthesileas_flame_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: " Penthesilea's Flame",
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
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
                        child: PyrosTable(),
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

class PyrosTable extends StatefulWidget {
  const PyrosTable({super.key});

  @override
  State<PyrosTable> createState() => _PyrosTableState();
}

class _PyrosTableState extends State<PyrosTable> {
  PyrosCrystalNotifier pyrosCrystalNotifier = PyrosCrystalNotifier();
  PenthesileasFlameNotifier penthesileasFlameNotifier =
      PenthesileasFlameNotifier();

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
                            color: ColorPallete.color3,
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
                text: 'Acquired by killing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Notorious Monsters',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in Eureka Pyros',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Pyros_crystal_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(PyrosCal.pyrosCrystalForEach, 3)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['pyros']['pyrosCrystal'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['pyros']['pyrosCrystal'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                pyrosCrystalNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: pyrosCrystalNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  PyrosCal().calPyrosCrystal().toString(),
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
                text: 'Sources:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 3 from killing Penthesilea in ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Lost Epic\n',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: '- Purchased from Expedition Birdwatcher for 50 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Pyros_crystal_icon1.png').image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Pyros Crystals',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Penthesileas_flame_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(PyrosCal.penthesileasFlameForEach, 3)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue: SavedData.eurekanData['pyros']['penthesileasFlame']
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
                SavedData.eurekanData['pyros']['penthesileasFlame'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                penthesileasFlameNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: penthesileasFlameNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  PyrosCal().calPenthesileasFlame().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   ______               _
//  |  ____|             | |
//  | |__  _   _ _ __ ___| | ____ _
//  |  __|| | | | '__/ _ \ |/ / _` |
//  | |___| |_| | | |  __/   < (_| |
//  |______\__,_|_|  \___|_|\_\__,_|

class EurekaStep extends StatelessWidget {
  const EurekaStep({super.key});

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
                  'Eureka Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(EurekanInfo.eurekanLinks['eureka']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color3,
            iconColor: ColorPallete.color3,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from a Pyros Weapon with 350 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Hydatos_crystal_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Hydatos Crystals',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 5 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Crystalline_scale_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Crystalline Scales',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
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
                        child: EurekaTable(),
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

class EurekaTable extends StatefulWidget {
  const EurekaTable({super.key});

  @override
  State<EurekaTable> createState() => _EurekaTableState();
}

class _EurekaTableState extends State<EurekaTable> {
  HydatosCrystalNotifier hydatosCrystalNotifier = HydatosCrystalNotifier();
  CrystalineScaleNotifier crystalineScaleNotifier = CrystalineScaleNotifier();

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
                            color: ColorPallete.color3,
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
                text: 'Acquired by killing ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Notorious Monsters',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' in Eureka Hydatos',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/Hydatos_crystal_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(EurekaCal.hydatosCrystalForEach, 4)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['eureka']['hydatosCrystal'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['eureka']['hydatosCrystal'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                hydatosCrystalNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: hydatosCrystalNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  EurekaCal().calHydatosCrystal().toString(),
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
                text: '3 will drop from killing Provenance Watcher in ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Eureka_notorious_monster_(map_icon).png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Crystalline Provenance',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ]),
            child: Image.asset(
              'assets/images/Crystalline_scale_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(EurekaCal.crystalineScaleForEach, 4)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['eureka']['crystalineScale'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['eureka']['crystalineScale'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                crystalineScaleNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: crystalineScaleNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  EurekaCal().calCrystalineScale().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//   _____  _
//  |  __ \| |
//  | |__) | |__  _   _ ___  ___  ___  ___
//  |  ___/| '_ \| | | / __|/ _ \/ _ \/ __|
//  | |    | | | | |_| \__ \  __/ (_) \__ \
//  |_|    |_| |_|\__, |___/\___|\___/|___/
//                 __/ |
//                |___/

class PhyseosStep extends StatelessWidget {
  const PhyseosStep({super.key});

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
                  'Physeos Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(EurekanInfo.eurekanLinks['physeos']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color3,
            iconColor: ColorPallete.color3,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from an Eureka Weapon with 100 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Eureka_fragment_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Eureka Fragments',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color3,
                              fontWeight: FontWeight.w600),
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
                        child: PhyseosTable(),
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

class PhyseosTable extends StatefulWidget {
  const PhyseosTable({super.key});

  @override
  State<PhyseosTable> createState() => _PhyseosTableState();
}

class _PhyseosTableState extends State<PhyseosTable> {
  EurekaFragmentNotifier eurekaFragmentNotifier = EurekaFragmentNotifier();

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
                            color: ColorPallete.color3,
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
                text: 'Obtained exclusively within ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(Image.asset('assets/images/Duty.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                text: ' The Baldesion Arsenal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' up to a total of 28 fragments per complete clear',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/40px-Eureka_fragment_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            EurekanInfo()
                .calNeededBase(PhyseosCal.eurekaFragmentForEach, 5)
                .toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.eurekanData['physeos']['eurekaFragment'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.eurekanData['physeos']['eurekaFragment'] =
                    int.parse(input);
                SavedData().updateLocalStorage();
                eurekaFragmentNotifier.updateNotifierValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: eurekaFragmentNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  PhyseosCal().calEurekaFragment().toString(),
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

class ProteanCrystalNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['anemos']['proteanCrystal']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['anemos']['proteanCrystal'];
  }
}

class PazuzusFeatherNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['anemos']['pazuzusFeather']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['anemos']['pazuzusFeather'];
  }
}

class FrostedCrystalNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['elemental']['frostedCrystal']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['elemental']['frostedCrystal'];
  }
}

class PagosCrystalNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['elemental']['pagosCrystal']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['elemental']['pagosCrystal'];
  }
}

class LouhisIceNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['elemental']['louhisIce']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['elemental']['louhisIce'];
  }
}

class PyrosCrystalNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['pyros']['pyrosCrystal']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['pyros']['pyrosCrystal'];
  }
}

class PenthesileasFlameNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['pyros']['penthesileasFlame']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['pyros']['penthesileasFlame'];
  }
}

class HydatosCrystalNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['eureka']['hydatosCrystal']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['eureka']['hydatosCrystal'];
  }
}

class CrystalineScaleNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['eureka']['crystalineScale']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['eureka']['crystalineScale'];
  }
}

class EurekaFragmentNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.eurekanData['physeos']['eurekaFragment']);

  void updateNotifierValue() {
    _notifier.value = SavedData.eurekanData['physeos']['eurekaFragment'];
  }
}
