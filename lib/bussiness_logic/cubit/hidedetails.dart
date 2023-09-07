//!state
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/constant.dart';

class ShowAllDetailsState {
   bool  isShow;

  ShowAllDetailsState({required this.isShow});
}
//!cubit

class ShowAllDetailsCubit extends Cubit<ShowAllDetailsState> {
  ShowAllDetailsCubit() : super(ShowAllDetailsState(isShow: box.read('isShow') ?? true?true:false));

  void showAllDetails(){
   emit(ShowAllDetailsState(isShow: state.isShow = !state.isShow));

   box.write('isShow', state.isShow);
         state.isShow = box.read('isShow') ?? true;
  }
}
