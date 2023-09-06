import 'package:zoomit_bloc/data/model/zoomit_model.dart';

abstract class HomeState {}

class LadingState extends HomeState {}

class LoadedState extends HomeState {
  final List<ZoomitModel> dataList;

  LoadedState(this.dataList);
}

class ErrorState extends HomeState {
  final String error;

  ErrorState(this.error);
}



