import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
late ThemeMode themeMode; 
  ThemeCubit() : super(ThemeMode.light);


    var isLight = true;
  final box = GetStorage();
  // _loadThemeFromBox() {
  //   if (box.read('theme') != null) {
  //     isLight = box.read('theme');
  //   }
  // }
  
  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(themeMode = ThemeMode.dark);

    } else {
      emit(themeMode = ThemeMode.light);
    }
    box.write('theme', isLight);
  }
}
