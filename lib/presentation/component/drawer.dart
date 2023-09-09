import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/bussiness_logic/cubit/hidedetails.dart';
import 'package:zoomit_bloc/constant.dart';
import 'package:zoomit_bloc/presentation/utils/extension.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        width: ScreenSize(context).width() / 1.4,
        child: Container(
          margin: const EdgeInsets.only(top: 15, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('تنظیمات'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                      inactiveTrackColor: Colors.transparent,
                      activeColor: kGreenColor,
                      value: box.read('theme') ?? true ? false : true,
                      onChanged: (value) => setState(() {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ToggleTheme());
                          })),
                  const Spacer(),
                  const Text('تغییر تم', style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                      inactiveTrackColor: Colors.transparent,
                      activeColor: kGreenColor,
                      value: box.read('isHide') ?? false ? true : false,
                      onChanged: (value) => setState(() {
                            BlocProvider.of<ShowAllDetailsCubit>(context)
                                .showAllDetails();
                          })),
                  const Spacer(),
                  const Text(
                    'پنهان کردن جزئیات خبر',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: SizedBox(
                                  height: 200,
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 20),
                                    width: ScreenSize(context).width() / 1.4,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('About'),
                                          const SizedBox(height: 10),
                                          TextButton(
                                              onPressed: () async {
                                                final Uri url = Uri.parse(
                                                    'https://www.github.com/meysamnova/zoomit');

                                                if (!await launchUrl(url)) {
                                                  throw Exception(
                                                      'Could not launch $url');
                                                }
                                              },
                                              child: const Text('Github')),
                                          TextButton(
                                              onPressed: () async {
                                                final Uri url = Uri.parse(
                                                    'https://www.t.me/pytopia');

                                                if (!await launchUrl(url)) {
                                                  throw Exception(
                                                      'Could not launch $url');
                                                }
                                              },
                                              child: const Text('Telegram')),
                                          TextButton(
                                              onPressed: () async {
                                                final Uri url = Uri.parse(
                                                    'https://www.twitter.com/pytopia');

                                                if (!await launchUrl(url)) {
                                                  throw Exception(
                                                      'Could not launch $url');
                                                }
                                              },
                                              child: const Text('Twitter')),
                                        ]),
                                  ),
                                ),
                              );
                            });
                      },
                      child: const Text('about')),
                ],
              )
            ],
          ),
        ));
  }
}
