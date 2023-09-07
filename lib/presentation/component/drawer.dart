import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_event.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
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
