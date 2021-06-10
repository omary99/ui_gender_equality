import 'package:flutter/material.dart';
import 'package:gender_equality/App.dart';
import 'package:gender_equality/services/post_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PostService())],
      child: App()));
}
