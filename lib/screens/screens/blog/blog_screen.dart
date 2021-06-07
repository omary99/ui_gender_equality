import 'package:flutter/material.dart';
import 'package:gender_equality/models/post_model.dart';
import 'package:gender_equality/screens/screens/blog/components/post_card.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PostCard(
              //postModel called
              post: samplePostsData[index],
            ));
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: samplePostsData.length,
    );
  }
}
