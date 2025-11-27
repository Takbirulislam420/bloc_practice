part of 'api_bloc.dart';

class ApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const ApiState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = "",
  });

  ApiState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
  }) {
    return ApiState(
      message: message ?? this.message,
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
    );
  }

  @override
  List<Object> get props => [postStatus, postList, message];
}

class ApiInitial extends ApiState {}
