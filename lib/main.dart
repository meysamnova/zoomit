import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomit_bloc/bloc/home_bloc.dart';
import 'package:zoomit_bloc/bloc/home_event.dart';
import 'package:zoomit_bloc/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.vazirmatn().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        home:  BlocProvider(
          create: (context) => HomeBloc()..add(GetDataEvent()),
          child: const HomePage(),
        ));
  }
}
