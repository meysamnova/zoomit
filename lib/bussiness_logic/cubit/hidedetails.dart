//!state
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/constant.dart';

class ShowAllDetailsState {
   bool  isHide;

  ShowAllDetailsState({required this.isHide});
}
//!cubit

class ShowAllDetailsCubit extends Cubit<ShowAllDetailsState> {
  ShowAllDetailsCubit() : super(ShowAllDetailsState(
            isHide: box.read('isHide') ?? false?true:false));

  void showAllDetails(){
   emit(ShowAllDetailsState(isHide: state.isHide = !state.isHide));

   box.write('isHide', state.isHide);
  }
}
