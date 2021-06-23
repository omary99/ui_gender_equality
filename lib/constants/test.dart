// import 'package:flutter/material.dart';
// import 'package:gender_equality/constants/apis.dart';
// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
 
// class UploadImageDemo extends StatefulWidget {
//   UploadImageDemo() : super();
 
//   final String title = "Upload Image Demo";
 
//   @override
//   UploadImageDemoState createState() => UploadImageDemoState();
// }
 
// class UploadImageDemoState extends State<UploadImageDemo> {
//   //
//   static final String uploadEndPoint =
//       'http://localhost/flutter_test/upload_image.php';
//  Future< File  >? file;
//   String status = '';
//   String? base64Image;
//   File? tmpFile;
//   String errMessage = 'Error Uploading Image';

//  final _picker = ImagePicker();

 
//   chooseImage() async{
//       final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
//        file = File(pickedFile!.path) as Future<File>;
//     setState(() {
      
        
      
//     });
    
//     setStatus('');
//   }
 
//   setStatus(String message) {
//     setState(() {
//       status = message;
//     });
//   }
 
//   startUpload() {
//     setStatus('Uploading Image...');
//     if (null == tmpFile) {
//       setStatus(errMessage);
//       return;
//     }
 
//     upload("tdsx");
//   }
 
//   upload(String fileName) {

//      final Map<String, dynamic> _body = {
//       'body': fileName,
//       'latitude': '21.98',
//       'longitude': '34.56',
//       'media_type': 'image',
//       "media_file": base64Image,
//     };

//     final Map<String, String> _headers = {
//       "accepts": "application/json",
//       HttpHeaders.authorizationHeader: 'Bearer $token'
//     };
//     http.post( Uri.parse('$httpApi' + 'report'),
//      body: _body,
//      headers: _headers
    
//     ).then((result) {
//       setStatus(result.statusCode == 200 ? result.body : errMessage);
//     }).catchError((error) {
//       setStatus(error);
//     });
//   }
 
//   Widget showImage() {
//     return FutureBuilder<File>(
//       future: file,
//       builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done &&
//             null != snapshot.data) {
//           tmpFile = snapshot.data;
//           base64Image = base64Encode(snapshot.data!.readAsBytesSync());
//           return Flexible(
//             child: Image.file(
//               snapshot.data!,
//               fit: BoxFit.fill,
//             ),
//           );
//         } else if (null != snapshot.error) {
//           return const Text(
//             'Error Picking Image',
//             textAlign: TextAlign.center,
//           );
//         } else {
//           return const Text(
//             'No Image Selected',
//             textAlign: TextAlign.center,
//           );
//         }
//       },
//     );
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Upload Image Demo"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextButton(
//               onPressed: chooseImage,
//               child: Text('Choose Image'),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             showImage(),
//             SizedBox(
//               height: 20.0,
//             ),
//             TextButton(
//               onPressed: startUpload,
//               child: Text('Upload Image'),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Text(
//               status,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 20.0,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }