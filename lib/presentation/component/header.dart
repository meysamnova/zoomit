import 'package:flutter/material.dart';
import '../../constant.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
          child: Text('زومیت'),
        ),
        IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
