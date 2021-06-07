import 'package:flutter/material.dart';
import 'package:gender_equality/models/post_model.dart';

class PostCard extends StatelessWidget {
  /// object of postModel And postModel used here

  final PostModel post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(post.avatar),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.authorName,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.headline6,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    post.content,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          image: DecorationImage(
                              image: NetworkImage(post.image), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20)),
                      height: 200),
                  Row(
                    children: [
                      IconButton(
                          color: Colors.blue,
                          onPressed: () {},
                          icon: Icon(Icons.face)),
                      IconButton(
                          color: Colors.green,
                          onPressed: () {},
                          icon: Icon(Icons.message))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
