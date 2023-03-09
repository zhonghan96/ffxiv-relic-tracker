import 'package:flutter/gestures.dart';
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
    return const Placeholder();
  }
}

class AnemosTable extends StatefulWidget {
  const AnemosTable({super.key});

  @override
  State<AnemosTable> createState() => _AnemosTableState();
}

class _AnemosTableState extends State<AnemosTable> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
    return const Placeholder();
  }
}

class ElementalTable extends StatefulWidget {
  const ElementalTable({super.key});

  @override
  State<ElementalTable> createState() => _ElementalTableState();
}

class _ElementalTableState extends State<ElementalTable> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
    return const Placeholder();
  }
}

class PyrosTable extends StatefulWidget {
  const PyrosTable({super.key});

  @override
  State<PyrosTable> createState() => _PyrosTableState();
}

class _PyrosTableState extends State<PyrosTable> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
    return const Placeholder();
  }
}

class EurekaTable extends StatefulWidget {
  const EurekaTable({super.key});

  @override
  State<EurekaTable> createState() => _EurekaTableState();
}

class _EurekaTableState extends State<EurekaTable> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
    return const Placeholder();
  }
}

class PhyseosTable extends StatefulWidget {
  const PhyseosTable({super.key});

  @override
  State<PhyseosTable> createState() => _PhyseosTableState();
}

class _PhyseosTableState extends State<PhyseosTable> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
