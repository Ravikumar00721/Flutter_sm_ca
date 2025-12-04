import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;


class StpApiService {
  final baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> fetchPosts() async{
    final res = await http.get(Uri.parse(baseUrl));
    final data=jsonDecode(res.body) as List;
    return data.map((e)=>Post.fromJson(e)).toList();
  }

  Future<Post> createPost(String title, String body) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": body}),
    );

    return Post.fromJson(jsonDecode(res.body));
  }

  Future<Post> updatePost(int id, String title, String body) async {
    final res = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": body}),
    );

    return Post.fromJson(jsonDecode(res.body));
  }

  Future<void> deletePost(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"));
  }

}