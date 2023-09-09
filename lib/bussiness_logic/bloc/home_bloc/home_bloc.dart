import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/home_bloc/home_event.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/home_bloc/home_state.dart';

import 'package:zoomit_bloc/data/model/zoomit_model.dart';
import 'package:zoomit_bloc/data/network/network.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static List<ZoomitModel> zoomitList = [];
  late Response response;

  HomeBloc() : super(LadingState()) {
    on<GetDataEvent>((event, emit) async {
      try {
        response = await Network.getApi();
        if (response.statusCode == 200) {
          List<dynamic> rawData = response.data['source'];
          zoomitList.clear();
          for (var element in rawData) {
            zoomitList.add(ZoomitModel.fromJson(element));
          }
          emit(LoadedState(zoomitList));
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    //!راهنمای خرید
    on<GetDataGuideEvent>((event, emit) async {
      var response = await Network.getBuyGuideApi();
      List<dynamic> rawData = response.data['items'];
      zoomitList.clear();
      for (var element in rawData) {
        zoomitList.add(ZoomitModel.fromJson(element));
      }

      emit(LoadedState(zoomitList));
    });

    //!آموزش های کاربردی
    on<GetDataMostVisitedMonthEvent>((event, emit) async {
      var response = await Network.getMostVisitedMonthApi();
      List<dynamic> rawData = response.data['items'];
      zoomitList.clear();
      for (var element in rawData) {
        zoomitList.add(ZoomitModel.fromJson(element));
      }
      emit(LoadedState(zoomitList));
    });
  }
}
