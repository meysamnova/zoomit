import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/presentation/utils/extension.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        width: ScreenSize(context).width() / 1.6,
        child: ListView(
          children: [
            const ListTile(title: Text('تنظیمات')),
            ListTile(
                title: const Text('تغییر تم'),
                leading: IconButton(
                    onPressed: () {
                      BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
                    },
                    icon: const Icon(Icons.sunny))),
          ],
        ));
  }
}
