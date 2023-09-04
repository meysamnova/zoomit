import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoomit_bloc/bloc/comment_bloc/comment_bloc.dart';
import 'package:zoomit_bloc/bloc/comment_bloc/comment_event.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_bloc.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_event.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_state.dart';
import 'package:zoomit_bloc/pages/home_page.dart';
import 'package:zoomit_bloc/theme/theme_manager.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(GetDataEvent()),
        ),
        BlocProvider(
          create: (context) => CommentBloc()..add(GetCommentEvent()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(SaveTheme()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedTheme) {
            return MaterialApp(
              theme: ThemeConfig.lightTheme,
              darkTheme: ThemeConfig.darkTheme,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          }else{
            return MaterialApp(
              theme: ThemeConfig.lightTheme,
              darkTheme: ThemeConfig.darkTheme,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          }
       
        },
      ),
    );
  }
}
