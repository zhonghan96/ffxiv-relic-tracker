import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_text/extended_text.dart';

import '/Utility/config.dart';
import '/Utility/path_provider_helper.dart';
import '/Utility/zodiac_helper.dart';

class ZodiacPage extends StatelessWidget {
  const ZodiacPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ZodiacStep(),
          ZenithStep(),
          AtmaStep(),
          AnimusStep(),
          NovusStep(),
          NexusStep(),
          BravesStep(),
          ZetaStep(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

//   ______         _ _
//  |___  /        | (_)
//     / / ___   __| |_  __ _  ___
//    / / / _ \ / _` | |/ _` |/ __|
//   / /_| (_) | (_| | | (_| | (__
//  /_____\___/ \__,_|_|\__,_|\___|

class ZodiacStep extends StatelessWidget {
  const ZodiacStep({super.key});

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
                  'Base Zodiac',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['zodiac']));
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
                            'You can obtain your Zodiac Weapon by completing the Featured Quest: ',
                        style: TextFormating.widgetContent),
                    ImageSpan(Image.asset('assets/images/quest_icon.png').image,
                        imageWidth: 20, imageHeight: 20),
                    TextSpan(
                        text: 'A Relic Reborn',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['zodiac']));
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

//   ______          _ _   _
//  |___  /         (_) | | |
//     / / ___ _ __  _| |_| |__
//    / / / _ \ '_ \| | __| '_ \
//   / /_|  __/ | | | | |_| | | |
//  /_____\___|_| |_|_|\__|_| |_|

class ZenithStep extends StatelessWidget {
  const ZenithStep({super.key});

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
                  'Zenith Zodiac',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['zenith']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color1,
            iconColor: ColorPallete.color1,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from a Zodiac Weapon with 3 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset('assets/images/thavnairian_mist.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: 'Thavnairian Mists',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color1,
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
                        child: ZenithTable(),
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

class ZenithTable extends StatefulWidget {
  const ZenithTable({super.key});

  @override
  State<ZenithTable> createState() => _ZenithTableState();
}

class _ZenithTableState extends State<ZenithTable> {
  ThavnarianMistNotifier thavnarianMistNotifier = ThavnarianMistNotifier();

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
                text: 'Purchased from Sundry Splendors for 20',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Allagan_Tomestone_of_Poetics.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: 'Allagan Tomestones of Poetics',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              )
            ]),
            child: Image.asset(
              'assets/images/thavnairian_mist.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            ZenithCal().calNeededMist().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['zenith']['mist'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['zenith']['mist'] = int.parse(input);
              SavedData().updateLocalStorage();
              thavnarianMistNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: thavnarianMistNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  ZenithCal().calMist().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ])
      ],
    );
  }
}

//           _
//      /\  | |
//     /  \ | |_ _ __ ___   __ _
//    / /\ \| __| '_ ` _ \ / _` |
//   / ____ \ |_| | | | | | (_| |
//  /_/    \_\__|_| |_| |_|\__,_|

class AtmaStep extends StatelessWidget {
  const AtmaStep({super.key});

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
                  'Atma Zodiac',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['atma']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color1,
            iconColor: ColorPallete.color1,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upgraded from a Zenith Weapon with 1 of each of the following:',
                        style: TextFormating.widgetContent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            'Note: Tap on the resource for more information',
                            style: TextFormating.widgetSubcontent),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: AtmaTable(),
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

class AtmaTable extends StatefulWidget {
  const AtmaTable({super.key});

  @override
  State<AtmaTable> createState() => _AtmaTableState();
}

class _AtmaTableState extends State<AtmaTable> {
  LionNotifier lionNotifier = LionNotifier();
  WaterNotifier waterNotifier = WaterNotifier();
  RamNotifier ramNotifier = RamNotifier();
  CrabNotifier crabNotifier = CrabNotifier();
  FishNotifier fishNotifier = FishNotifier();
  BullNotifier bullNotifier = BullNotifier();
  ScalesNotifier scalesNotifier = ScalesNotifier();
  TwinsNotifier twinsNotifier = TwinsNotifier();
  ScorpionNotifier scorpionNotifier = ScorpionNotifier();
  ArcherNotifier archerNotifier = ArcherNotifier();
  GoatNotifier goatNotifier = GoatNotifier();
  MaidenNotifier maidenNotifier = MaidenNotifier();

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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Outer La Noscea',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_lion_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['lion'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['lion'] = int.parse(input);
              SavedData().updateLocalStorage();
              lionNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: lionNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calLion().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Upper La Noscea',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_water-bearer_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['water'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['water'] = int.parse(input);
              SavedData().updateLocalStorage();
              waterNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: waterNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calWater().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Middle La Noscea',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_ram_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['ram'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['ram'] = int.parse(input);
              SavedData().updateLocalStorage();
              ramNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: ramNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calRam().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Western La Noscea',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_crab_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['crab'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['crab'] = int.parse(input);
              SavedData().updateLocalStorage();
              crabNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: crabNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calCrab().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Lower La Noscea',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_fish_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['fish'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['fish'] = int.parse(input);
              SavedData().updateLocalStorage();
              fishNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: fishNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calFish().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Eastern Thanalan',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_bull_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['bull'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['bull'] = int.parse(input);
              SavedData().updateLocalStorage();
              bullNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: bullNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calBull().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Central Thanalan',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_scales_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['scales'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['scales'] = int.parse(input);
              SavedData().updateLocalStorage();
              scalesNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: scalesNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calScales().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Western Thanalan',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_twins_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['twins'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['twins'] = int.parse(input);
              SavedData().updateLocalStorage();
              twinsNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: twinsNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calTwins().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Southern Thanalan',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_scorpion_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['scorpion'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['scorpion'] = int.parse(input);
              SavedData().updateLocalStorage();
              scorpionNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: scorpionNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calScorpion().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in North Shroud',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_archer_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['archer'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['archer'] = int.parse(input);
              SavedData().updateLocalStorage();
              archerNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: archerNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calArcher().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in East Shroud',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_goat_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['goat'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['goat'] = int.parse(input);
              SavedData().updateLocalStorage();
              goatNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: goatNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calGoat().toString(),
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
                  text: 'Acquired from completing ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs in Central Shroud',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with Zenith Weapon equipped',
                  style: TextFormating.widgetContent)
            ]),
            child: Image.asset(
              'assets/images/20px-Atma_of_the_maiden_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            AtmaCal().calNeededAtma().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['atma']['maiden'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['atma']['maiden'] = int.parse(input);
              SavedData().updateLocalStorage();
              maidenNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: maidenNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  AtmaCal().calMaiden().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ]),
      ],
    );
  }
}

//                  _
//      /\         (_)
//     /  \   _ __  _ _ __ ___  _   _ ___
//    / /\ \ | '_ \| | '_ ` _ \| | | / __|
//   / ____ \| | | | | | | | | | |_| \__ \
//  /_/    \_\_| |_|_|_| |_| |_|\__,_|___/

class AnimusStep extends StatelessWidget {
  const AnimusStep({super.key});

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
                  'Animus Zodiac',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['animus']));
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
                        text: 'Upgraded from an Atma Weapon by completing 9 ',
                        style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/20px-Book_of_skylight_icon1.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                        text: ' Trials of the Braves',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['animus']));
                          }),
                    TextSpan(
                        text:
                            ", obtained from G'jusana in Revenant's Toll for 100 ",
                        style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/Allagan_Tomestone_of_Poetics.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                      text: 'Allagan Tomestone of Poetics',
                      style: TextFormating.widgetContent.copyWith(
                          color: ColorPallete.color1,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ' each', style: TextFormating.widgetContent),
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

//   _   _
//  | \ | |
//  |  \| | _____   ___   _ ___
//  | . ` |/ _ \ \ / / | | / __|
//  | |\  | (_) \ V /| |_| \__ \
//  |_| \_|\___/ \_/  \__,_|___/

class NovusStep extends StatelessWidget {
  const NovusStep({super.key});

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
                  'Novus Zodiac',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['novus']));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color1,
            iconColor: ColorPallete.color1,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Upgraded from an Animus Weapon with 3 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/20px-Superior_enchanted_ink_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Superior Enchanted Ink',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color1,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' and 75 ',
                          style: TextFormating.widgetContent,
                        ),
                        ImageSpan(
                            Image.asset(
                                    'assets/images/20px-Alexandrite_icon1.png')
                                .image,
                            imageWidth: 20,
                            imageHeight: 20),
                        TextSpan(
                          text: ' Alexandrite',
                          style: TextFormating.widgetContent.copyWith(
                              color: ColorPallete.color1,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' with an assortment of Materia I - IV',
                          style: TextFormating.widgetContent,
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
                        child: NovusTable(),
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

class NovusTable extends StatefulWidget {
  const NovusTable({super.key});

  @override
  State<NovusTable> createState() => _NovusTableState();
}

class _NovusTableState extends State<NovusTable> {
  InkNotifier inkNotifier = InkNotifier();
  AlexNotifier alexNotifier = AlexNotifier();

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
                text: 'Purchased from Sundry Splendors for 25',
                style: TextFormating.widgetContent,
              ),
              ImageSpan(
                  Image.asset('assets/images/Allagan_Tomestone_of_Poetics.png')
                      .image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                text: 'Allagan Tomestones of Poetics',
                style: TextFormating.widgetContent
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: ' each',
                style: TextFormating.widgetContent,
              )
            ]),
            child: Image.asset(
              'assets/images/20px-Superior_enchanted_ink_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            NovusCal().calNeededInk().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue: SavedData.zodiacData['novus']['ink'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['novus']['ink'] = int.parse(input);
              SavedData().updateLocalStorage();
              inkNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: inkNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  NovusCal().calInk().toString(),
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
                text: 'Can be gathered in 3 ways:\n',
                style: TextFormating.widgetContent,
              ),
              TextSpan(
                  text: '- Completing ', style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/Fate_mob_icon1.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' FATEs',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' with an Animus Weapon equipped\n',
                  style: TextFormating.widgetContent),
              TextSpan(
                  text: '- Bought from a Hunt Billmaster for 50 ',
                  style: TextFormating.widgetContent),
              ImageSpan(Image.asset('assets/images/20px-Allied_Seal.png').image,
                  imageWidth: 20, imageHeight: 20),
              TextSpan(
                  text: ' Allied Seals\n',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
              TextSpan(
                  text: '- From treasure chests from ',
                  style: TextFormating.widgetContent),
              ImageSpan(
                  Image.asset('assets/images/Mysterious_map_icon1.png').image,
                  imageWidth: 20,
                  imageHeight: 20),
              TextSpan(
                  text: ' Mysterious Maps',
                  style: TextFormating.widgetContent
                      .copyWith(fontWeight: FontWeight.w600)),
            ]),
            child: Image.asset(
              'assets/images/20px-Alexandrite_icon1.png',
              height: 30,
              width: 30,
            ),
          ),
          Text(
            NovusCal().calNeededAlex().toString(),
            style: TextFormating.widgetContent,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            initialValue:
                SavedData.zodiacData['novus']['alexandrite'].toString(),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              if (input == '') {
                input = '0';
              }
              SavedData.zodiacData['novus']['alexandrite'] = int.parse(input);
              SavedData().updateLocalStorage();
              alexNotifier.updateNotiferValue();
            },
          ),
          ValueListenableBuilder(
              valueListenable: alexNotifier._notifier,
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  NovusCal().calAlex().toString(),
                  style: TextFormating.widgetContent,
                  textAlign: TextAlign.center,
                );
              })
        ])
      ],
    );
  }
}

//   _   _
//  | \ | |
//  |  \| | _____  ___   _ ___
//  | . ` |/ _ \ \/ / | | / __|
//  | |\  |  __/>  <| |_| \__ \
//  |_| \_|\___/_/\_\\__,_|___/

class NexusStep extends StatelessWidget {
  const NexusStep({super.key});

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
                  'Nexus Zodiac',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['nexus']));
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
                        text: 'Upgraded from a Novus Weapon by gathering 2000 ',
                        style: TextFormating.widgetContent),
                    TextSpan(
                        text: 'Light Points',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['novus']));
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

//   ____
//  |  _ \
//  | |_) |_ __ __ ___   _____  ___
//  |  _ <| '__/ _` \ \ / / _ \/ __|
//  | |_) | | | (_| |\ V /  __/\__ \
//  |____/|_|  \__,_| \_/ \___||___/

class BravesStep extends StatelessWidget {
  const BravesStep({super.key});

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
                  'Zodiac Braves',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['braves']));
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
                            'Complete the following quests and obtain their respective items:\n',
                        style: TextFormating.widgetContent),
                    TextSpan(text: '- ', style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/20px-Repeatablefeaturequest.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                        text: ' A Ponze of Flesh\n',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['novus']));
                          }),
                    TextSpan(text: '- ', style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/20px-Repeatablefeaturequest.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                        text: ' Labor of Love\n',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['novus']));
                          }),
                    TextSpan(text: '- ', style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/20px-Repeatablefeaturequest.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                        text: ' A Treasured Mother\n',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['novus']));
                          }),
                    TextSpan(text: '- ', style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/20px-Repeatablefeaturequest.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                        text: ' Method in His Malice\n',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['novus']));
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

//   ______    _
//  |___  /   | |
//     / / ___| |_ __ _
//    / / / _ \ __/ _` |
//   / /_|  __/ || (_| |
//  /_____\___|\__\__,_|

class ZetaStep extends StatelessWidget {
  const ZetaStep({super.key});

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
                  'Zodiac Zeta',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(ZodiacInfo.zodiacLinks['zeta']));
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
                            'Upgraded from a Braves Weapon by charging 12 Mahatmas (purchased with 50 ',
                        style: TextFormating.widgetContent),
                    ImageSpan(
                        Image.asset(
                                'assets/images/Allagan_Tomestone_of_Poetics.png')
                            .image,
                        imageWidth: 20,
                        imageHeight: 20),
                    TextSpan(
                      text: ' Allagan Tomestone of Poetics',
                      style: TextFormating.widgetContent.copyWith(
                          color: ColorPallete.color1,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: ') with 40 ', style: TextFormating.widgetContent),
                    TextSpan(
                        text: 'Mahatma Points',
                        style: TextFormating.hyperlink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse(ZodiacInfo.zodiacLinks['zeta']));
                          }),
                    TextSpan(text: ' each', style: TextFormating.widgetContent),
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

//   _      _     _
//  | |    (_)   | |
//  | |     _ ___| |_ ___ _ __   ___ _ __
//  | |    | / __| __/ _ \ '_ \ / _ \ '__|
//  | |____| \__ \ ||  __/ | | |  __/ |
//  |______|_|___/\__\___|_| |_|\___|_|

class ThavnarianMistNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['zenith']['mist']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['zenith']['mist'];
  }
}

class LionNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['lion']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['lion'];
  }
}

class WaterNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['water']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['water'];
  }
}

class RamNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['ram']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['ram'];
  }
}

class CrabNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['crab']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['crab'];
  }
}

class FishNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['fish']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['fish'];
  }
}

class BullNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['bull']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['bull'];
  }
}

class ScalesNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['scales']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['scales'];
  }
}

class TwinsNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['twins']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['twins'];
  }
}

class ScorpionNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['scorpion']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['scorpion'];
  }
}

class ArcherNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['archer']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['archer'];
  }
}

class GoatNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['goat']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['goat'];
  }
}

class MaidenNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['atma']['maiden']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['atma']['maiden'];
  }
}

class InkNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['novus']['ink']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['novus']['ink'];
  }
}

class AlexNotifier {
  final ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['novus']['alexandrite']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['novus']['alexandrite'];
  }
}
