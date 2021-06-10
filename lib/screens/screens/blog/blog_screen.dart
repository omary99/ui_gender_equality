import 'package:flutter/material.dart';
import 'package:gender_equality/screens/screens/blog/components/post_card.dart';
import 'package:gender_equality/services/services.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _postService = Provider.of<PostService>(context);
    return ListView.separated(
      itemBuilder: (_, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PostCard(
              //postModel called
              post: _postService.postList[index],
            ));
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: _postService.postList.length,
    );
  }
}
