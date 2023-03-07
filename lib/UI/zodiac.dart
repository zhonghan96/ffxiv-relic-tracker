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
        children: const [ZodiacStep(), ZenithStep()],
      ),
    );
  }
}

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
                  'Zodiac Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://ffxiv.consolegameswiki.com/wiki/Zodiac_Weapons/Quest'));
                  },
                )
              ],
            ),
            textColor: ColorPallete.color1,
            iconColor: ColorPallete.color1,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(children: [
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
                            launchUrl(Uri.parse(
                                'https://ffxiv.consolegameswiki.com/wiki/Zodiac_Weapons/Quest'));
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
                  'Zenith Weapon',
                  style: TextFormating.widgetHeader,
                ),
                IconButton(
                  icon: const Icon(Icons.help),
                  iconSize: 15,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://ffxiv.consolegameswiki.com/wiki/Zenith_Zodiac_Weapons/Quest'));
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
                      RichText(
                          text: TextSpan(children: [
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
                text: 'Purchased from Sundry Speldors for 20',
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
                text: ' each.',
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

//   _      _     _
//  | |    (_)   | |
//  | |     _ ___| |_ ___ _ __   ___ _ __
//  | |    | / __| __/ _ \ '_ \ / _ \ '__|
//  | |____| \__ \ ||  __/ | | |  __/ |
//  |______|_|___/\__\___|_| |_|\___|_|

class ThavnarianMistNotifier {
  ValueNotifier _notifier =
      ValueNotifier(SavedData.zodiacData['zenith']['mist']);

  void updateNotiferValue() {
    _notifier.value = SavedData.zodiacData['zenith']['mist'];
  }
}
