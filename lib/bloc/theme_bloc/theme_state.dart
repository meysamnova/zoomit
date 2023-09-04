
import 'package:flutter/material.dart';

abstract class ThemeState {}

class InitialTheme extends ThemeState {

}

class LoadedTheme extends ThemeState {
  ThemeMode themeMode;
  LoadedTheme({
    required this.themeMode,
  });
}
