import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/Utility/config.dart';

class AcknowledgementPage extends StatelessWidget {
  const AcknowledgementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
                text:
                    'Special thanks for everybody who has contributed to and maintained the ',
                style: TextFormating.acknowledgements),
            TextSpan(
                text: '\n\nFFXIV Wiki ',
                style: TextFormating.acknowledgements.copyWith(
                    fontSize: 20,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(
                        'https://ffxiv.consolegameswiki.com/wiki/FF14_Wiki'));
                  }),
            TextSpan(
                text:
                    '\n\nThe credit for compiling all information in this app goes to you all.',
                style: TextFormating.acknowledgements),
          ]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
