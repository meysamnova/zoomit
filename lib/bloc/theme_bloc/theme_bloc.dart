import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
   final box = GetStorage();
  ThemeBloc() : super(InitialTheme()) {
    bool isLight = true;
    on<SaveTheme>((event, emit) async {
      isLight = box.read('theme');
 var bb=isLight ? ThemeMode.light : ThemeMode.dark;
emit(LoadedTheme(themeMode: bb));
    });
    on<ToggleTheme>((event, emit) async {
      isLight= !isLight;
      box.write('theme', isLight);
    var aa= isLight ? ThemeMode.light : ThemeMode.dark;
emit(LoadedTheme(themeMode: aa));

     
    });
  }
}
