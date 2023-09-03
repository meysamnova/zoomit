import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_bloc.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_state.dart';
import 'package:zoomit_bloc/cubit/theme_cubit.dart';
import 'package:zoomit_bloc/theme/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).toggleTheme();
                },
                icon: const Icon(Icons.sunny)),
            const Spacer(),
            const Padding(
                padding: EdgeInsets.all(8.0), child: Text('آخرین مطالب'))
          ]),
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
                    child: ListView.builder(
                  itemCount: state.dataList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //!title
                                    TextButton(
                                        child: Text(
                                          state.dataList[index].title,
                                          softWrap: true,
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontSize: width < 800 ? 13 : 20),
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
                                      padding: const EdgeInsets.only(right: 7),
                                      child: Text(state.dataList[index].lead,
                                          softWrap: true,
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontSize: width < 800 ? 13 : 20)),
                                    ),
                                    //!comment
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(state
                                            .dataList[index].totalDiscussCount
                                            .toString()),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.chat_bubble_outline,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      const Divider()
                    ],
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
