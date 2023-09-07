
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext{
    width() => MediaQuery.of(this).size.width;
   height() => MediaQuery.of(this).size.height;
}

