import 'package:flutter/material.dart';
import 'package:zoomit_bloc/theme/constant.dart';
import 'package:zoomit_bloc/presentation/component/drawer.dart';
import '../component/Chips.dart';
import '../component/header.dart';
import '../component/newsfeed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const DrawerComponent(),
        body: Column(
          children: [HeaderComponent(), ChipsComponent(), NewsFeedComponent()],
        ),
      ),
    );
  }
}
