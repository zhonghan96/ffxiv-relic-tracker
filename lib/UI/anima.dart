import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_text/extended_text.dart';

import '/Utility/config.dart';
import '/Utility/path_provider_helper.dart';
import '/Utility/anima_helper.dart';

class AnimaPage extends StatelessWidget {
  const AnimaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          AnimatedStep(),
          AwokenStep(),
          AnimaStep(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

//                  _                 _           _
//      /\         (_)               | |         | |
//     /  \   _ __  _ _ __ ___   __ _| |_ ___  __| |
//    / /\ \ | '_ \| | '_ ` _ \ / _` | __/ _ \/ _` |
//   / ____ \| | | | | | | | | | (_| | ||  __/ (_| |
//  /_/    \_\_| |_|_|_| |_| |_|\__,_|\__\___|\__,_|

class AnimatedStep extends StatelessWidget {
  const AnimatedStep({super.key});

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
                  'Animated Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(AnimaInfo.animaLinks['animated']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color2,
            iconColor: ColorPallete.color2,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text:
                              'You can obtain your Animated Weapon by trading in 1 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Astral_nodule_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Astral Nodule',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color2,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 1 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Umbral_nodule_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Umbral Nodule',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color2,
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
                        child: AnimatedTable(),
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

class AnimatedTable extends StatefulWidget {
  const AnimatedTable({super.key});

  @override
  State<AnimatedTable> createState() => _AnimatedTableState();
}

class _AnimatedTableState extends State<AnimatedTable> {
  AstralNoduleNotifier astralNoduleNotifier = AstralNoduleNotifier();
  UmbralNoduleNotifier umbralNoduleNotifier = UmbralNoduleNotifier();

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
                            color: ColorPallete.color1,
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
                text: 'Trade in your ',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: 'Zodiac Zeta Weapon',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' or collect the following items from ',
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
                text: ' in their respective regions:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 1 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Luminous_wind_crystal_icon1.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Luminous Wind Crystal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' from The Sea of Clouds\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 1 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Luminous_fire_crystal_icon1.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Luminous Fire Crystal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' from Azys Lla\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 1 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset(
                          'assets/images/Luminous_lightning_crystal_icon1.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Luminous Lightning Crystal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' from The Churning Mists',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/40px-Astral_nodule_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AnimaInfo().calNeededBase(AnimatedCal.noduleForEach, 0).toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.animaData['animated']['astral'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.animaData['animated']['astral'] = int.parse(input);
                SavedData().updateLocalStorage();
                astralNoduleNotifier.updateNotiferValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: astralNoduleNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AnimatedCal().calAstralNodule().toString(),
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
                text: 'Trade in your ',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: 'Zodiac Zeta Weapon',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' or collect the following items from ',
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
                text: ' in their respective regions:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 1 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Luminous_ice_crystal_icon1.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Luminous Ice Crystal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' from Coerthas Western Highlands\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 1 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Luminous_earth_crystal_icon1.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Luminous Earth Crystal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' from The Dravanian Forelands\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                text: '- 1 ',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Luminous_water_crystal_icon1.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: ' Luminous Water Crystal',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' from The Dravanian Hinterlands',
                style: TextFormating.widgetContent,
              ),
            ]),
            child: Image.asset(
              'assets/images/40px-Umbral_nodule_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AnimaInfo().calNeededBase(AnimatedCal.noduleForEach, 0).toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              initialValue:
                  SavedData.animaData['animated']['umbral'].toString(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
              keyboardType: TextInputType.number,
              onChanged: (input) {
                if (input == '') {
                  input = '0';
                }
                SavedData.animaData['animated']['umbral'] = int.parse(input);
                SavedData().updateLocalStorage();
                umbralNoduleNotifier.updateNotiferValue();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: umbralNoduleNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AnimatedCal().calUmbralNodule().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//                        _
//      /\               | |
//     /  \__      _____ | | _____ _ __
//    / /\ \ \ /\ / / _ \| |/ / _ \ '_ \
//   / ____ \ V  V / (_) |   <  __/ | | |
//  /_/    \_\_/\_/ \___/|_|\_\___|_| |_|

class AwokenStep extends StatelessWidget {
  const AwokenStep({super.key});

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
                  'Awoken Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(AnimaInfo.animaLinks['awoken']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color1,
            iconColor: ColorPallete.color1,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text:
                            'Upgraded from an Animated Weapon by completing the quest ',
                        style: TextFormating.widgetContent),
                    ImageSpan(Image.asset('assets/images/quest_icon.png').image,
                        imageWidth: 20, imageHeight: 20),
                    TextSpan(
                        text: ' Toughening Up',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(AnimaInfo.animaLinks['awoken']));
                          })
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

//                  _
//      /\         (_)
//     /  \   _ __  _ _ __ ___   __ _
//    / /\ \ | '_ \| | '_ ` _ \ / _` |
//   / ____ \| | | | | | | | | | (_| |
//  /_/    \_\_| |_|_|_| |_| |_|\__,_|

class AnimaStep extends StatelessWidget {
  const AnimaStep({super.key});

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
                  'Anima Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(AnimaInfo.animaLinks['anima']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color2,
            iconColor: ColorPallete.color2,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from an Awoken Weapon with 1 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Enchanted_rubber_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Enchanted Rubber',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color2,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ', 1 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/Fast-drying_carboncoat_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Fast-drying Carboncoat',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color2,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ', 1 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/Divine_water_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Divine Water',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color2,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 1 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/40px-Fast-acting_Allagan_Catalyst_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Fast-acting Allagan Catalyst',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color2,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ', exchange as shown bellow:',
                          style: TextFormating.widgetContent,
                        ),
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                                children: ['Material', '10x of', '4x of']
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 4),
                                          child: Text(
                                            e,
                                            style: TextFormating.widgetContent
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorPallete.color2),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                    .toList()),
                            TableRow(
                                children: [
                              'assets/images/Enchanted_rubber_icon1.png',
                              'assets/images/40px-Unidentifiable_bone_icon1.png',
                              'assets/images/Adamantite_francesca_icon1.png'
                            ]
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Image.asset(
                                            e,
                                            height: 30,
                                            width: 30,
                                          ),
                                        ))
                                    .toList()),
                            TableRow(
                                children: [
                              'assets/images/Fast-drying_carboncoat_icon1.png',
                              'assets/images/40px-Unidentifiable_shell_icon1.png',
                              'assets/images/Titanium_alloy_mirror_icon1.png'
                            ]
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Image.asset(
                                            e,
                                            height: 30,
                                            width: 30,
                                          ),
                                        ))
                                    .toList()),
                            TableRow(
                                children: [
                              'assets/images/Divine_water_icon1.png',
                              'assets/images/40px-Unidentifiable_ore_icon1.png',
                              'assets/images/Dispelling_arrow_icon1.png'
                            ]
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Image.asset(
                                            e,
                                            height: 30,
                                            width: 30,
                                          ),
                                        ))
                                    .toList()),
                            TableRow(
                                children: [
                              'assets/images/40px-Fast-acting_Allagan_Catalyst_icon1.png',
                              'assets/images/40px-Unidentifiable_seeds_icon1.png',
                              'assets/images/Kingcake_icon1.png'
                            ]
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Image.asset(
                                            e,
                                            height: 30,
                                            width: 30,
                                          ),
                                        ))
                                    .toList()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: AnimaTable(),
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

class AnimaTable extends StatefulWidget {
  const AnimaTable({super.key});

  @override
  State<AnimaTable> createState() => _AnimaTableState();
}

class _AnimaTableState extends State<AnimaTable> {
  BoneNotifier boneNotifier = BoneNotifier();
  ShellNotifier shellNotifier = ShellNotifier();
  OreNotifier oreNotifier = OreNotifier();
  SeedsNotifier seedsNotifier = SeedsNotifier();
  AdamNotifier adamNotifier = AdamNotifier();
  TitanNotifier titanNotifier = TitanNotifier();
  ArrowNotifier arrowNotifier = ArrowNotifier();
  KingcakeNotifier kingcakeNotifier = KingcakeNotifier();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//   _    _                                          _            _   _
//  | |  | |                                        | |          | | (_)
//  | |__| |_   _ _ __   ___ _ __ ___ ___  _ __   __| |_   _  ___| |_ ___   _____
//  |  __  | | | | '_ \ / _ \ '__/ __/ _ \| '_ \ / _` | | | |/ __| __| \ \ / / _ \
//  | |  | | |_| | |_) |  __/ | | (_| (_) | | | | (_| | |_| | (__| |_| |\ V /  __/
//  |_|  |_|\__, | .__/ \___|_|  \___\___/|_| |_|\__,_|\__,_|\___|\__|_| \_/ \___|
//           __/ | |
//          |___/|_|

//   _____                          _ _ _   _                      _
//  |  __ \                        | (_) | (_)                    | |
//  | |__) |___  ___ ___  _ __   __| |_| |_ _  ___  _ __   ___  __| |
//  |  _  // _ \/ __/ _ \| '_ \ / _` | | __| |/ _ \| '_ \ / _ \/ _` |
//  | | \ \  __/ (_| (_) | | | | (_| | | |_| | (_) | | | |  __/ (_| |
//  |_|  \_\___|\___\___/|_| |_|\__,_|_|\__|_|\___/|_| |_|\___|\__,_|

//    _____ _                                          _
//   / ____| |                                        | |
//  | (___ | |__   __ _ _ __ _ __   ___ _ __   ___  __| |
//   \___ \| '_ \ / _` | '__| '_ \ / _ \ '_ \ / _ \/ _` |
//   ____) | | | | (_| | |  | |_) |  __/ | | |  __/ (_| |
//  |_____/|_| |_|\__,_|_|  | .__/ \___|_| |_|\___|\__,_|
//                          | |
//                          |_|

//    _____                      _      _           _
//   / ____|                    | |    | |         | |
//  | |     ___  _ __ ___  _ __ | | ___| |_ ___  __| |
//  | |    / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \/ _` |
//  | |___| (_) | | | | | | |_) | |  __/ ||  __/ (_| |
//   \_____\___/|_| |_| |_| .__/|_|\___|\__\___|\__,_|
//                        | |
//                        |_|

//   _
//  | |
//  | |    _   ___  __
//  | |   | | | \ \/ /
//  | |___| |_| |>  <
//  |______\__,_/_/\_\

//   _      _     _
//  | |    (_)   | |
//  | |     _ ___| |_ ___ _ __   ___ _ __
//  | |    | / __| __/ _ \ '_ \ / _ \ '__|
//  | |____| \__ \ ||  __/ | | |  __/ |
//  |______|_|___/\__\___|_| |_|\___|_|

class AstralNoduleNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['animated']['astral']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['animated']['astral'];
  }
}

class UmbralNoduleNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['animated']['umbral']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['animated']['umbral'];
  }
}

class BoneNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['bone']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['bone'];
  }
}

class ShellNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['shell']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['shell'];
  }
}

class OreNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['ore']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['ore'];
  }
}

class SeedsNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['seeds']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['seeds'];
  }
}

class AdamNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['adamantite']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['adamantite'];
  }
}

class TitanNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['titanium']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['titanium'];
  }
}

class ArrowNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['arrow']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['arrow'];
  }
}

class KingcakeNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['anima']['kingcake']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['anima']['kingcake'];
  }
}

class AetherOilNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['hyperconductive']['aetherOil']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['hyperconductive']['aetherOil'];
  }
}

class UmbriteNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['reconditioned']['umbrite']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['reconditioned']['umbrite'];
  }
}

class SandNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['reconditioned']['crystalSand']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['reconditioned']['crystalSand'];
  }
}

class ClusterNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['sharpened']['clusters']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['sharpened']['clusters'];
  }
}

class PneumiteNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['complete']['pneumite']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['complete']['pneumite'];
  }
}

class InkNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.animaData['lux']['ink']);

  void updateNotiferValue() {
    _notifier.value = SavedData.animaData['lux']['ink'];
  }
}
