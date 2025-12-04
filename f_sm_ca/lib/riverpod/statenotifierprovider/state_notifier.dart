import 'package:f_sm_ca/riverpod/statenotifierprovider/loading.dart';
import 'package:f_sm_ca/riverpod/statenotifierprovider/stp_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<PostState>{
     final StpApiService service;

     PostNotifier(this.service):super(PostState());

     Future<void> fetchPosts() async{
       state=state.copywith(isLoading: true);
       try{
         final data=await service.fetchPosts();
         state=state.copywith(isLoading: false,posts: data);
       }catch(e)
       {
         state=state.copywith(isLoading: false,error: e.toString());
       }
     }

     Future<void> addPost(String title, String body) async{
       final newPost= await service.createPost(title, body);
       state=state.copywith(posts: [...state.posts,newPost]);
     }

     Future<void> updatePost(int id, String title, String body) async {
       final updated = await service.updatePost(id, title, body);

       final newList=state.posts.map((post){
         if(post.id==id){
           return updated;
         }else{
           return post;
         }
       }).toList();

       state=state.copywith(posts: newList);
     }

     Future<void> deletePost(int id) async {
       await service.deletePost(id);

       state=state.copywith(posts: state.posts.where((post)=>post.id!=id).toList());
     }
}

final postProvider=StateNotifierProvider<PostNotifier,PostState>((ref){
  return PostNotifier(StpApiService());
});