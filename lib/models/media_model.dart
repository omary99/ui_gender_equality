import 'package:extended_image/extended_image.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MediaModel {
  final AssetEntity asset;
  final File file;
  String caption;

  MediaModel({required this.asset, required this.file, required this.caption});
}
