import 'dart:convert';

import 'package:gender_equality/constants/apis.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:gender_equality/models/post_model.dart';

class PostService with ChangeNotifier {
  PostService() {
    fetchPosts();
  }
  //variables (all variable must be private
  //)
  List<PostModel> _postLists = [];

  //setters (if variable it used  class and variable it is private)

  //getters (if variable it used out of class and variable it is private)
  List<PostModel> get postList => _postLists;

  //methods or functions
  // Future<bool> fetchPosts() async {
  //   bool _hasError = false;
  //   // _postLists = samplePostsData;
  //   final response = await http.get(Uri.parse(httpApi));
  //   notifyListeners();
  //   return _hasError;
  // }

  Future<bool> fetchPosts() async {
    bool _hasError = false;
    final List<PostModel> _fetchedPosts = [];
    final response = await http.get(Uri.parse('$httpApi' + 'blog/posts'),
        headers: {"accept": "application/json"});

    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> _data = json.decode(response.body);
      _data['data'].forEach((post) {
        final _post = PostModel.fromMap(post);
        _fetchedPosts.add(_post);
      });

      _postLists = _fetchedPosts;
      notifyListeners();
    } else {
      _hasError = true;
    }
    return _hasError;
  }
}
