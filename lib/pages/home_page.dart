import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_bloc.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_event.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_state.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:zoomit_bloc/bloc/theme_bloc/theme_event.dart';
import 'package:zoomit_bloc/cubit/chips_cubit.dart';
import 'package:zoomit_bloc/theme/constant.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width;

    final List<String> chipsList = [

      'راهنمای خرید',
      'پربازدیدهای ماه',
            'آخرین مطالب',
    ];

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
                },
                icon: const Icon(Icons.sunny)),
            const Spacer(),
            const Padding(padding: EdgeInsets.all(8.0), child: Text('زومیت'))
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                BlocBuilder<ChipsCubit, int>(
                  builder: (context, state) {
                    return Wrap(
                        spacing: 8,
                        children: List.generate(
                            chipsList.length,
                            (index) => ChoiceChip(
                                 materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                                 visualDensity:  const VisualDensity(horizontal: 0, vertical: -4) ,                                                   
                                label: Text(chipsList[index],style: const TextStyle(fontSize: 12)),
                                selected: state == index,
                                onSelected: (value) {
                                  BlocProvider.of<ChipsCubit>(context)
                                      .indexChips(index);
                                  switch (index) {
                                    case 0:
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(GetDataGuideEvent());
                                          refreshIndicatorIndex =0;
                                      break;
                                    case 1:
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(GetDataMostVisitedMonthEvent());
                                          refreshIndicatorIndex = 1;

                                      break;
                                    case 2:
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(GetDataEvent());
                                          refreshIndicatorIndex = 2;

                                      break;
                                      
                                  }
                                })));
                  },
                )
              ]),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LadingState) {
                return const Expanded(
                    child: Center(
                        child:
                            CircularProgressIndicator(color: kLightBlueColor)));
              }
              if (state is LoadedState) {
                return Expanded(
                    child: RefreshIndicator(
                  color: kLightBlueColor,
                  onRefresh: () {
                    return Future(() =>
                        BlocProvider.of<HomeBloc>(context).add(refreshIndicatorIndex ==2?GetDataEvent(): refreshIndicatorIndex ==0?GetDataGuideEvent(): GetDataMostVisitedMonthEvent()));
                  },
                  child: ListView.builder(
                    itemCount: state.dataList.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //!image
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://api2.zoomit.ir/media/${state.dataList[index].coverImageLink.id}",
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Container(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          //!title
                                          TextButton(
                                              child: Text(
                                                state.dataList[index].title,
                                                softWrap: true,
                                                textAlign: TextAlign.right,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize:
                                                        width < 800 ? 13 : 20),
                                              ),
                                              onPressed: () async {
                                                final Uri url = Uri.parse(
                                                    'https://www.zoomit.ir/${state.dataList[index].slug}');

                                                if (!await launchUrl(url)) {
                                                  throw Exception(
                                                      'Could not launch $url');
                                                }
                                              }),
                                          //!lead
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Text(
                                                state.dataList[index].lead,
                                                softWrap: true,
                                                textAlign: TextAlign.right,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize:
                                                        width < 800 ? 13 : 20)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                              //!comment
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        state.dataList[index].isAdvertisement
                                            ? 'تبلیغات'
                                            : '',
                                        style:
                                            const TextStyle(color: kRedColor)),
                                    const SizedBox(width: 20),
                                    Text(
                                        state.dataList[index].totalDiscussCount
                                            .toString(),
                                        style: const TextStyle(fontSize: 12)),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.chat_bubble_outline,
                                        size: 15),
                                    const SizedBox(width: 20),
                                    Text(
                                        state.dataList[index].readingTime
                                            .toString(),
                                        style: const TextStyle(fontSize: 12)),
                                    const SizedBox(width: 3),
                                    const Icon(Icons.timer_outlined, size: 18),
                                    const SizedBox(width: 20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ));
              }
              return Container();
            },
          )
        ],
      )),
    );
  }
}
