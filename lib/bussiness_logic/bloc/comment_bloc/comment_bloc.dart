import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/comment_bloc/comment_event.dart';
import 'package:zoomit_bloc/bussiness_logic/bloc/comment_bloc/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(LoadingComment()) {
    on<GetCommentEvent>((event, emit) async {});
  }
}
