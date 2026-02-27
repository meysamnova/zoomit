import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/bussiness_logic/cubit/hidedetails.dart';
import 'package:zoomit_bloc/theme/constant.dart';
import 'package:zoomit_bloc/presentation/utils/extension.dart';

import 'about_popup.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
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
                  activeThumbColor: kGreenColor,
                  value: box.read('theme') ?? true ? false : true,
                  onChanged: (value) => setState(() {
                    BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
                  }),
                ),
                const Spacer(),
                const Text('تغییر تم', style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(
                  inactiveTrackColor: Colors.transparent,
                  activeThumbColor: kGreenColor,
                  value: box.read('isHide') ?? false ? true : false,
                  onChanged: (value) => setState(() {
                    BlocProvider.of<ShowAllDetailsCubit>(
                      context,
                    ).showAllDetails();
                  }),
                ),
                const Spacer(),
                const Text(
                  'پنهان کردن جزئیات خبر',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            AboutPopup(),
          ],
        ),
      ),
    );
  }
}
