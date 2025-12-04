import 'model.dart';

class PostState{
  final bool isLoading;
  final List<Post> posts;
  final String? error;

  PostState({
    this.isLoading = false,
    this.posts = const [],
    this.error,
  });

  PostState copywith({
    bool? isLoading,
    List<Post>? posts,
    String? error,
}){
    return PostState(
      isLoading: isLoading??this.isLoading,
      posts: posts??this.posts,
      error: error??this.error,
    );
  }
}