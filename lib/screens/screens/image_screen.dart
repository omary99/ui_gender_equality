import 'package:flutter/material.dart';

import 'package:gender_equality/services/services.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _reportService = Provider.of<ReportService>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Images'),),
          body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Image.file(
                    _reportService.selectedImageFile!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Container(
                  height: 40,
                  width: 40,
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.send))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
