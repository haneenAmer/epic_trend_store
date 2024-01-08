import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class footerWidget extends StatefulWidget {
  const footerWidget({super.key});

  @override
  State<footerWidget> createState() => _footerWidgetState();
}

class _footerWidgetState extends State<footerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: const Color(0xffF0F0F0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              S.of(context).shahad_store,
              style: headerTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).bodyText_footer,
              style: smallTextStyle(Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.facebook,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white),
                    child: const FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchWhatsAppUri();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white),
                      child: const FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchWhatsAppUri() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+9647712710192',
      text: "Hey! I'm inquiring about the apartment listing",
    );
    // Convert the WhatsAppUnilink instance to a Uri.
    // The "launch" method is part of "url_launcher".
    await launch(link.toString());
  }
}
