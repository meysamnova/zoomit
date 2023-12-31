import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const Color kpurplecolor = Color(0xff6c63ff);
const kBlackColor = Colors.black;
const kSemiBlackColor = Color.fromARGB(255, 12, 16, 49);
const kWhiteColor = Colors.white;
const kRedColor = Color.fromARGB(255, 255, 155, 148);
const kRedAccent = Color.fromARGB(147, 252, 78, 78);
const kGreenColor = Colors.green;
const kLightBlueColor = Color(0xFF5886FF);
const kGreyColor = Color.fromARGB(160, 121, 121, 121);
const newTaskBorder = Color.fromARGB(11, 176, 176, 176);
const kdarktitle = Color.fromARGB(255, 232, 226, 216);
final dio = Dio();
final scaffoldKey = GlobalKey<ScaffoldState>();
int refreshIndicatorIndex = 3;
final box = GetStorage();
