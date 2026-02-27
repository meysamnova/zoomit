import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoomit_bloc/presentation/utils/extension.dart';

class AboutPopup extends StatelessWidget {
  const AboutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: SizedBox(
                    height: 240,
                    width: 100,
                    child: Container(
                      margin: const EdgeInsets.only(top: 25, left: 20),
                      width: ScreenSize(context).width() / 1.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Developed by'),
                          const Text(
                            'Meysam Shamadil',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                'https://www.github.com/meysamnova/zoomit',
                              );

                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            child: const Text('Github'),
                          ),
                          TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                'https://www.t.me/pytopia',
                              );

                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            child: const Text('Telegram'),
                          ),
                          TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                'https://www.twitter.com/pytopia',
                              );

                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            child: const Text('Twitter'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('About'),
        ),
      ],
    );
  }
}
