import 'package:flutter/material.dart';
import 'package:gender_equality/App.dart';
import 'package:gender_equality/services/services.dart';
import 'package:provider/provider.dart';
import 'services/post_service.dart';



void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => PostService(),
    ),
    ChangeNotifierProvider(
      create: (_) => ReportService(),
    ),
  ], child: App()));
}
