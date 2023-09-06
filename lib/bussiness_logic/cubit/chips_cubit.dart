//!state
import 'package:flutter_bloc/flutter_bloc.dart';


//!cubit

class ChipsCubit extends Cubit<int> {
  ChipsCubit() : super(2);

  void indexChips(int index) => emit(index);

}
