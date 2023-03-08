import 'package:ffxiv_relic_tracker/Utility/path_provider_helper.dart';
import 'package:flutter/material.dart';

import '/Utility/config.dart';
import '/Utility/zodiac_helper.dart';
import '/Utility/anima_helper.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
              future: SavedData().initZodiacData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ExpansionTile(
                              title: Text('Zodiac Weapons',
                                  style: TextFormating.widgetHeader),
                              textColor: ColorPallete.color1,
                              iconColor: ColorPallete.color1,
                              children: [cardTable('Zodiac Weapons')],
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>((Colors.white))));
              }),
          FutureBuilder(
              future: SavedData().initAnimaData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ExpansionTile(
                              title: Text('Anima Weapons',
                                  style: TextFormating.widgetHeader),
                              textColor: ColorPallete.color2,
                              iconColor: ColorPallete.color2,
                              children: [cardTable('Anima Weapons')],
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>((Colors.white))));
              }),
          FutureBuilder(
              future: SavedData().initEurekanData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ExpansionTile(
                              title: Text('Eurekan Weapons',
                                  style: TextFormating.widgetHeader),
                              textColor: ColorPallete.color3,
                              iconColor: ColorPallete.color3,
                              children: [cardTable('Eurekan Weapons')],
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>((Colors.white))));
              }),
          FutureBuilder(
              future: SavedData().initResistanceData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ExpansionTile(
                              title: Text('Resistance Weapons',
                                  style: TextFormating.widgetHeader),
                              textColor: ColorPallete.color4,
                              iconColor: ColorPallete.color4,
                              children: [cardTable('Resistance Weapons')],
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>((Colors.white))));
              }),
          FutureBuilder(
              future: SavedData().initMandervilleData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 10),
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ExpansionTile(
                              title: Text('Manderville Weapons',
                                  style: TextFormating.widgetHeader),
                              textColor: ColorPallete.color5,
                              iconColor: ColorPallete.color5,
                              children: [cardTable('Manderville Weapons')],
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>((Colors.white))));
              }),
        ],
      ),
    );
  }
}

cardTable(relicCategory) {
  List relicClassList = [];

  switch (relicCategory) {
    case 'Zodiac Weapons':
      relicClassList = [
        ...StaticLists.classList.sublist(0, 2),
        ...StaticLists.classList.sublist(4, 7),
        ...StaticLists.classList.sublist(9, 11),
        ...StaticLists.classList.sublist(12, 14),
        ...StaticLists.classList.sublist(15, 17)
      ];
      break;
    case 'Anima Weapons':
      relicClassList = [
        ...StaticLists.classList.sublist(0, 3),
        ...StaticLists.classList.sublist(4, 7),
        ...StaticLists.classList.sublist(9, 11),
        ...StaticLists.classList.sublist(12, 14),
        ...StaticLists.classList.sublist(15, 18)
      ];
      break;
    case 'Eurekan Weapons':
      relicClassList = [
        ...StaticLists.classList.sublist(0, 3),
        ...StaticLists.classList.sublist(4, 8),
        ...StaticLists.classList.sublist(9, 11),
        ...StaticLists.classList.sublist(12, 18),
      ];
      break;
    case 'Resistance Weapons':
      relicClassList = [
        ...StaticLists.classList.sublist(0, 8),
        ...StaticLists.classList.sublist(9, 18),
      ];
      break;
    case 'Manderville Weapons':
      relicClassList = StaticLists.classList;
      break;
  }

  return Row(
    children: [
      Column(children: [
        const SizedBox(
          height: 10,
        ),
        ...relicClassList
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.5),
                child: Text(
                  e,
                  style: TextFormating.widgetContent,
                ),
              ),
            )
            .toList(),
      ]),
      (relicCategory == 'Zodiac Weapons')
          ? SizedBox(
              height: 550,
              width: 275,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                            children: ZodiacInfo.zodiacSteps
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                        style: TextFormating.widgetContent,
                                      ),
                                    ))
                                .toList()),
                        ...checkboxTable(relicCategory)
                      ])
                ],
              ),
            )
          : (relicCategory == 'Anima Weapons')
              ? SizedBox(
                  height: 646,
                  width: 275,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Table(
                          defaultColumnWidth: const IntrinsicColumnWidth(),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                                children: AnimaInfo.animaSteps
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            e,
                                            textAlign: TextAlign.center,
                                            style: TextFormating.widgetContent,
                                          ),
                                        ))
                                    .toList()),
                            ...checkboxTable(relicCategory)
                          ])
                    ],
                  ),
                )
              : (relicCategory == 'Eurekan Weapons')
                  ? SizedBox(
                      height: 742,
                      width: 275,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Table(
                              defaultColumnWidth: const IntrinsicColumnWidth(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                    children: StaticLists.eurekanSteps
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                e,
                                                textAlign: TextAlign.center,
                                                style:
                                                    TextFormating.widgetContent,
                                              ),
                                            ))
                                        .toList()),
                                ...checkboxTable(relicCategory)
                              ])
                        ],
                      ),
                    )
                  : (relicCategory == 'Resistance Weapons')
                      ? SizedBox(
                          height: 838,
                          width: 275,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Table(
                                  defaultColumnWidth:
                                      const IntrinsicColumnWidth(),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(
                                        children: StaticLists.resistanceSteps
                                            .map((e) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Text(
                                                    e,
                                                    textAlign: TextAlign.center,
                                                    style: TextFormating
                                                        .widgetContent,
                                                  ),
                                                ))
                                            .toList()),
                                    ...checkboxTable(relicCategory)
                                  ])
                            ],
                          ),
                        )
                      : (relicCategory == 'Manderville Weapons')
                          ? SizedBox(
                              height: 935,
                              width: 275,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Table(
                                      defaultColumnWidth:
                                          const IntrinsicColumnWidth(),
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: StaticLists
                                                .mandervilleSteps
                                                .map((e) => Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: Text(
                                                        e,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextFormating
                                                            .widgetContent,
                                                      ),
                                                    ))
                                                .toList()),
                                        ...checkboxTable(relicCategory)
                                      ])
                                ],
                              ),
                            )
                          : Container()
    ],
  );
}

checkboxTable(relicCategory) {
  List<TableRow> output = [];

  if (relicCategory == 'Zodiac Weapons') {
    final keysList = SavedData.zodiacData['summary'].keys.toList();

    for (var i = 0; i < SavedData.zodiacData['summary'].length; i++) {
      List<Widget> tableCells = [];
      for (var j = 0;
          j < SavedData.zodiacData['summary'][keysList[i]].length;
          j++) {
        tableCells.add(CheckBox(
          checkboxValue: SavedData.zodiacData['summary'][keysList[i]][j],
          relicCategory: relicCategory,
          jobClass: keysList[i],
          index: j,
        ));
      }
      output.add(TableRow(children: tableCells));
    }
  } else if (relicCategory == 'Anima Weapons') {
    final keysList = SavedData.animaData['summary'].keys.toList();

    for (var i = 0; i < SavedData.animaData['summary'].length; i++) {
      List<Widget> tableCells = [];
      for (var j = 0;
          j < SavedData.animaData['summary'][keysList[i]].length;
          j++) {
        tableCells.add(CheckBox(
          checkboxValue: SavedData.animaData['summary'][keysList[i]][j],
          relicCategory: relicCategory,
          jobClass: keysList[i],
          index: j,
        ));
      }
      output.add(TableRow(children: tableCells));
    }
  } else if (relicCategory == 'Eurekan Weapons') {
    final keysList = SavedData.eurekanData['summary'].keys.toList();

    for (var i = 0; i < SavedData.eurekanData['summary'].length; i++) {
      List<Widget> tableCells = [];
      for (var j = 0;
          j < SavedData.eurekanData['summary'][keysList[i]].length;
          j++) {
        tableCells.add(CheckBox(
          checkboxValue: SavedData.eurekanData['summary'][keysList[i]][j],
          relicCategory: relicCategory,
          jobClass: keysList[i],
          index: j,
        ));
      }
      output.add(TableRow(children: tableCells));
    }
  } else if (relicCategory == 'Resistance Weapons') {
    final keysList = SavedData.resistanceData['summary'].keys.toList();

    for (var i = 0; i < SavedData.resistanceData['summary'].length; i++) {
      List<Widget> tableCells = [];
      for (var j = 0;
          j < SavedData.resistanceData['summary'][keysList[i]].length;
          j++) {
        tableCells.add(CheckBox(
          checkboxValue: SavedData.resistanceData['summary'][keysList[i]][j],
          relicCategory: relicCategory,
          jobClass: keysList[i],
          index: j,
        ));
      }
      output.add(TableRow(children: tableCells));
    }
  } else if (relicCategory == 'Manderville Weapons') {
    final keysList = SavedData.mandervilleData['summary'].keys.toList();

    for (var i = 0; i < SavedData.mandervilleData['summary'].length; i++) {
      List<Widget> tableCells = [];
      for (var j = 0;
          j < SavedData.mandervilleData['summary'][keysList[i]].length;
          j++) {
        tableCells.add(CheckBox(
          checkboxValue: SavedData.mandervilleData['summary'][keysList[i]][j],
          relicCategory: relicCategory,
          jobClass: keysList[i],
          index: j,
        ));
      }
      output.add(TableRow(children: tableCells));
    }
  }

  return output;
}

class CheckBox extends StatefulWidget {
  bool checkboxValue;
  final String relicCategory;
  final String jobClass;
  final int index;
  CheckBox(
      {Key? key,
      required this.checkboxValue,
      required this.relicCategory,
      required this.jobClass,
      required this.index})
      : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.checkboxValue,
      onChanged: (bool? value) {
        setState(() {
          switch (widget.relicCategory) {
            case 'Zodiac Weapons':
              {
                SavedData.zodiacData['summary'][widget.jobClass][widget.index] =
                    value;
                break;
              }
            case 'Anima Weapons':
              {
                SavedData.animaData['summary'][widget.jobClass][widget.index] =
                    value;
                break;
              }
            case 'Eurekan Weapons':
              {
                SavedData.eurekanData['summary'][widget.jobClass]
                    [widget.index] = value;
                break;
              }
            case 'Resistance Weapons':
              {
                SavedData.resistanceData['summary'][widget.jobClass]
                    [widget.index] = value;
                break;
              }
            case 'Manderville Weapons':
              {
                SavedData.mandervilleData['summary'][widget.jobClass]
                    [widget.index] = value;
                break;
              }
          }
          SavedData().updateLocalStorage();
          widget.checkboxValue = value!;
        });
      },
    );
  }
}
