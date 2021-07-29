import 'package:flutter/material.dart';
import 'package:gender_equality/wechat/widgets/selected_assets_list_view.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class UploadMediaScreen extends StatefulWidget {
  const UploadMediaScreen({required this.assets});
  final List<AssetEntity> assets;

  @override
  _UploadMediaScreenState createState() => _UploadMediaScreenState();
}

class _UploadMediaScreenState extends State<UploadMediaScreen> {
  final ValueNotifier<bool> isDisplayingDetail = ValueNotifier<bool>(true);

  void removeAsset(int index) {
    widget.assets.removeAt(index);
    if (widget.assets.isEmpty) {
      isDisplayingDetail.value = false;
    }
    setState(() {});
  }

  void onResult(List<AssetEntity>? result) {
    if (result != null && result != widget.assets) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectedAssetsListView(
      assets: widget.assets,
      isDisplayingDetail: isDisplayingDetail,
      onResult: (assets) {},
      onRemoveAsset: removeAsset,
    );
  }
}
