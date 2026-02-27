import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/business_logic/bloc/home_bloc/home_bloc.dart';
import 'package:zoomit_bloc/business_logic/bloc/home_bloc/home_event.dart';
import 'package:zoomit_bloc/business_logic/cubit/chips_cubit.dart';
import 'package:zoomit_bloc/theme/constant.dart';

class ChipsComponent extends StatelessWidget {
  const ChipsComponent({super.key});

  static const List<String> chipsList = [
    'محبوب ترین',
    'راهنمای خرید',
    'پربازدیدترین های روز',
    'آخرین مطالب',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        reverse: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ChipsCubit, int>(
              builder: (context, state) {
                return Wrap(
                  spacing: 8,
                  children: List.generate(
                    chipsList.length,
                    (index) => ChoiceChip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        horizontal: 0,
                        vertical: -4,
                      ),

                      label: Text(
                        chipsList[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                      selected: state == index,
                      onSelected: (value) {
                        BlocProvider.of<ChipsCubit>(context).indexChips(index);
                        switch (index) {
                          case 0:
                            BlocProvider.of<HomeBloc>(
                              context,
                            ).add(GetDataMostVisitedMonthEvent());
                            refreshIndicatorIndex = 0;
                            break;
                          case 1:
                            BlocProvider.of<HomeBloc>(
                              context,
                            ).add(GetDataGuideEvent());
                            refreshIndicatorIndex = 1;
                            break;
                          case 2:
                            BlocProvider.of<HomeBloc>(
                              context,
                            ).add(GetDataMostVisitedDayEvent());
                            refreshIndicatorIndex = 2;
                            break;
                          case 3:
                            BlocProvider.of<HomeBloc>(
                              context,
                            ).add(GetDataEvent());
                            refreshIndicatorIndex = 3;
                            break;
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
