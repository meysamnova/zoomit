
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_event.dart';
import 'package:zoomit_bloc/bloc/home_bloc/home_state.dart';

import 'package:zoomit_bloc/model/zoomit_model.dart';
import 'package:zoomit_bloc/network/network.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static List<ZoomitModel> zoomitList = [];

  HomeBloc() : super(LadingState()) {
    on<GetDataEvent>((event, emit) async {

      var response = await Network.getApi();
          List<dynamic> rawData = response.data['source'];
      for (var element in rawData) {
        zoomitList.add(ZoomitModel.fromJson(element));
      }
      emit(LoadedState(zoomitList));
    });

  }
}

