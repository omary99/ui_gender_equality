import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gender_equality/constants/apis.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ReportService with ChangeNotifier {
  ReportService() {
    fetchReports();
  }

  //method for image picker
  File? _imageFile;
  final _picker = ImagePicker();
  Future<bool> chooseImage() async {
    bool _isPicked = false;
    final PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      _isPicked = true;
    }
    notifyListeners();
    return _isPicked;
  }

  //variables
  List<ReportModel> _reportLists = [];

  //setters
  //getters
  List<ReportModel> get reportList => _reportLists;
  File? get selectedImageFile => _imageFile;

  //methods
  Future<bool> fetchReports() async {
    bool _hasError = false;
    final List<ReportModel> _fetchedReports = [];

    final response = await http.get(Uri.parse('$httpApi' + 'reports'),
        headers: {"accepts": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> _data = json.decode(response.body);
      _data['data'].forEach((report) {
        final _report = ReportModel.fromMap(report);
        _fetchedReports.add(_report);
      });

      _reportLists = _fetchedReports;
      notifyListeners();
      print(_reportLists.length);
      notifyListeners();
    } else {
      _hasError = true;
    }
    return _hasError;
  }

  Future<bool> sendReports(String caption) async {
    bool _hasError = false;
    final Map<String, dynamic> _body = {
      'body': caption,
      'latitude': '21.98',
      'longitude': '34.56',
      'media_type': 'text'
    };

    final Map<String, String> _headers = {
      "accepts": "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };

    final response = await http.post(Uri.parse('$httpApi' + 'report'),
        body: _body, headers: _headers);

    print(response.statusCode);
    if (response.statusCode == 201) {
      final Map<String, dynamic> _data = json.decode(response.body);

      final _report = ReportModel.fromMap(_data['data']);
      _reportLists.add(_report);

      notifyListeners();
    } else {
      _hasError = true;
    }
    return _hasError;
  }

  Future<bool> sendReportWithImage(String fileName) async {
    Dio dio = new Dio();
    bool _hasError = false;
    final Map<String, dynamic> _body = {
      'body': fileName,
      'latitude': '21.98',
      'longitude': '34.56',
      'media_type': 'text',
      "file":
          await MultipartFile.fromFile(_imageFile!.path, filename: "media_file")
    };

    final Map<String, String> _headers = {
      "accepts": "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };

    await dio
        .post('$httpApi' + 'report',
            data: FormData.fromMap(_body), options: Options(headers: _headers))
        .then((response) {
      final Map<String, dynamic> data = response.data;
      print(data);
      if (response.statusCode == 200) {
        _hasError = false;
      } else {
        _hasError = true;
      }
    });
    return _hasError;
  }
}
