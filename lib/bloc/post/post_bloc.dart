import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/post_model.dart';
import '../../repository/post_repository.dart';
import '../../utils/post_status.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostState()) {
    on<FetchPostEvent>(_fetchPost);
  }

  void _fetchPost(FetchPostEvent event, Emitter<PostState> emit) async {
    postRepository
        .fetchPostApiCall()
        .then((value) => emit(state.copyWith(
            postStatus: PostStatus.success,
            postList: value,
            message: 'Success')))
        .onError((error, stackTrace) => emit(state.copyWith(
            postStatus: PostStatus.failed,
            postList: [],
            message: 'Error while fetching')));
  }
}
