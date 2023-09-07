import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/bussiness_logic/cubit/hidedetails.dart';
import 'package:zoomit_bloc/constant.dart';
import 'package:zoomit_bloc/presentation/utils/extension.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        width: ScreenSize(context).width() / 1.6,
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('تنظیمات'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                      activeColor: kGreyColor,
                      value: themeisSwitched,
                      onChanged: (value) => setState(() {
                            themeisSwitched = value;
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ToggleTheme());
                          })),
                  const Text('تغییر تم', style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                      activeColor: kGreyColor,
                      value: hideDetailsisSwitched,
                      onChanged: (value) => setState(() {
                            hideDetailsisSwitched = value;
                            BlocProvider.of<ShowAllDetailsCubit>(context)
                                .showAllDetails();
                          })),
                  const Text(
                    'پنهان کردن جزئیات خبر',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
