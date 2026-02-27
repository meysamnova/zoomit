import 'package:flutter/material.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/home_bloc/home_state.dart';

Future<dynamic> newsDetailDialog(
  BuildContext context,
  double width,
  LoadedState state,
  int index,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 200,
          width: 100,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 20),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(':جزئیات خبر '),
                const SizedBox(height: 10),
                Text(
                  'نویسنده: ${state.dataList[index].author.fullName!}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'زمان خواندن: ${state.dataList[index].readingTime!} دقیقه',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  ' ساعت انتشار: ${state.dataList[index].publishedDate!.substring(11, 16)}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  ' تاریخ انتشار: ${state.dataList[index].publishedDate!.substring(0, 10)}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'تعداد کامنت: ${state.dataList[index].totalDiscussCount!}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  ' تعداد لایک : ${state.dataList[index].likesCount!}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
