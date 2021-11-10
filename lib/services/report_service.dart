import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gender_equality/constants/apis.dart';
import 'package:gender_equality/constants/enum.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ReportService with ChangeNotifier {
  ReportService() {
    fetchReports();
  }
//file types

  FileType _fileType = FileType.Image;

  set setFileType(FileType type) {
    _fileType = type;
    notifyListeners();
  }

//getters
  FileType get seletedFileType => _fileType;

  //method for image picker
  File? _mediaFile;
  final _picker = ImagePicker();
  Future<bool> chooseImage() async {
    bool _isPicked = false;
    final PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _mediaFile = File(pickedFile.path);
      _isPicked = true;
    }

//This will set the file type
    setFileType = FileType.Image;
    //_mediaFile.
    notifyListeners();
    return _isPicked;
  }

  //method for video picker

  final _videoPicker = ImagePicker();
  Future<bool> chooseVideo() async {
    bool _isVideoPicked = false;
    final PickedFile? pickedFile =
        await _videoPicker.getVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      _mediaFile = File(pickedFile.path);
      _isVideoPicked = true;
    }

    //This will set the file type
    setFileType = FileType.Video;
    notifyListeners();
    print('hello');
    return _isVideoPicked;
  }

  //variables
  List<ReportModel> _reportLists = [];

  //setters
  //getters
  List<ReportModel> get reportList => _reportLists;
  File? get selectedMediaFile => _mediaFile;

  //methods

  //fetched reports method
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

//send reports methods
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

//send reports with image methods
  Future<bool> sendReporpptWithMedia(
      {String? caption, required AssetEntity asset}) async {
    File? _file = await asset.file;
    var dio = Dio();

    bool _hasError = false;

    var formData = FormData.fromMap({
      'body': 'iyuyi',
      'latitude': '21.98',
      'longitude': '34.56',
      'media_type': asset.type.toString().replaceAll('AssetType.', ''),
      'file': await MultipartFile.fromFile(_file!.path, filename: 'media_file'),
    });
    var response = await dio.post('$httpApi' + 'report', data: formData);

    print(
        "00000000000000000000000000000000000000000000000000000000000000000000");
    print(response.data);
    print(
        "00000000000000000000000000000000000000000000000000000000000000000000");

    return _hasError;
  }

//send reports with image methods
  Future<bool> sendReportWithMedia(
      { String?  caption, required AssetEntity asset}) async {
    final _file = await asset.file;
    Dio dio = new Dio();
    bool _hasError = false;
     
    final Map<String, dynamic> _body = {
      'body': caption  != null? caption: "",
      'latitude': '21.98',
      'longitude': '34.56',
      'media_type': asset.type.toString().replaceAll('AssetType.', ''),
      'media_file':
          await MultipartFile.fromFile(_file!.path, filename: "media_file")
    };

    final Map<String, String> _headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };

    await dio
        .post('$httpApi' + 'report',
            data: FormData.fromMap(_body), options: Options(headers: _headers))
        .then((response) {
      final Map<String, dynamic> data = response.data;

      final _reportImage = ReportModel.fromMap(data['data']);
      _reportLists.add(_reportImage);

      notifyListeners();
      print(data);
      if (response.statusCode == 201) {
        _hasError = false;
      } else {
        _hasError = true;
      }
    });
    return _hasError;
  }
}
