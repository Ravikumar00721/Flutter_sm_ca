import 'package:f_sm_ca/riverpod/statenotifierprovider/state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: Text("CRUD API Example")),
      body: postState.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: postState.posts.length,
        itemBuilder: (context, index) {
          final post = postState.posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref
                    .read(postProvider.notifier)
                    .deletePost(post.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postProvider.notifier).fetchPosts();
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
