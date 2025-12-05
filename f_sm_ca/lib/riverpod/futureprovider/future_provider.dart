import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final postProvider=FutureProvider<List<dynamic>>((ref) async{
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to load posts");
  }
});

class FutureScreen extends ConsumerWidget
{
  @override
  Widget build(BuildContext context,WidgetRef ref)
  {
    final postState=ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("FutureProvider API Example"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              ref.refresh(postProvider); // ✅ refresh API
            },
          )
        ],
      ),
      body: postState.when(
        data: (posts){
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context,index){
                final post=posts[index];
                return Card(
                  child: ListTile(
                    title: Text(post["title"]),
                    subtitle: Text(post["body"]),
                  ),
                );
          });
        },
        loading: ()=> Center(child: CircularProgressIndicator(),),
        error: (error,stackTrace)=>Center(child: Text("Error: $error"),)
      ),
    );
  }
}