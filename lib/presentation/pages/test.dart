import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
    var chipsIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> chipsList = ['one', 'two'];

    return  Scaffold(
      body: Center(child: Wrap(
                      spacing: 8,
                      children: List.generate(
                          chipsList.length,
                          (index) => ChoiceChip(
                              label: Text(chipsList[index]),
                              selected: chipsIndex == index,
                              onSelected: (value) {
                               setState(() {
                                  chipsIndex = index ;
                               });
                              })))),
    );
  }
}