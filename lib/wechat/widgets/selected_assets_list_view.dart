import 'package:flutter/material.dart';
import 'package:gender_equality/screens/screens/components/input_field.dart';
import 'package:gender_equality/services/gallery_service.dart';
import 'package:gender_equality/services/report_service.dart';
import 'package:provider/provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart'
    show AssetEntity, AssetPicker, AssetPickerViewer;
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'asset_widget_builder.dart';

class SelectedAssetsListView extends StatefulWidget {
  SelectedAssetsListView({
    Key? key,
    required this.assets,
    required this.isDisplayingDetail,
    required this.onResult,
    required this.onRemoveAsset,
  }) : super(key: key);

  final List<AssetEntity> assets;
  final ValueNotifier<bool> isDisplayingDetail;
  final Function(List<AssetEntity>? result) onResult;
  final Function(int index) onRemoveAsset;

  @override
  _SelectedAssetsListViewState createState() => _SelectedAssetsListViewState();
}

class _SelectedAssetsListViewState extends State<SelectedAssetsListView> {
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _inputFields = [];
  List<String> _inputFieldsText = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.assets.length; i++) {
      _inputFieldsText.add('');
      _inputFields.add(InputField(
        isFromMedia: true,
        onChange: (val) {
          _inputFieldsText[i] = val;
        },
        controller: TextEditingController(),
      ));
    }
  }

  Widget _selectedAssetWidget(BuildContext context, int index) {
    final AssetEntity asset = widget.assets.elementAt(index);
    return ValueListenableBuilder<bool>(
      valueListenable: widget.isDisplayingDetail,
      builder: (_, bool value, __) => GestureDetector(
        onTap: () async {
          if (value) {
            final List<AssetEntity>? result =
                await AssetPickerViewer.pushToViewer(
              context,
              currentIndex: index,
              previewAssets: widget.assets,
              themeData: AssetPicker.themeData(Colors.pink),
            );
            widget.onResult(result);
          }
        },
        child: RepaintBoundary(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AssetWidgetBuilder(
              entity: asset,
              isDisplayingDetail: value,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedAssetDeleteButton(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => widget.onRemoveAsset(index),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).canvasColor.withOpacity(0.5),
        ),
        child: const Icon(Icons.close, size: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _galleryService = Provider.of<GalleryService>(context);
    final _reportservice = Provider.of<ReportService>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Text(
            '${_galleryService.currentPage + 1} / ${widget.assets.length}'),
        backgroundColor: Colors.transparent,
      ),
      body: PageView(
        onPageChanged: (index) {
          _galleryService.setCurrentPage = index;
        },
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: widget.assets
            .map((e) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: _selectedAssetWidget(
                                      context, _galleryService.currentPage)),
                              ValueListenableBuilder<bool>(
                                valueListenable: widget.isDisplayingDetail,
                                builder: (_, bool value, __) =>
                                    AnimatedPositioned(
                                  duration: kThemeAnimationDuration,
                                  top: value ? 6.0 : -30.0,
                                  right: value ? 6.0 : -30.0,
                                  child: _selectedAssetDeleteButton(
                                      context, _galleryService.currentPage),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(children: [
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 15, color: Colors.white),
                      ]),
                      Row(
                        children: [
                          Expanded(
                              child: _inputFields[_galleryService.currentPage]),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                _isLoading = true;
                                for (int i = 0; i < widget.assets.length; i++) {
                                  _reportservice
                                      .sendReportWithMedia(
                                          caption: _inputFieldsText[i],
                                          asset: widget.assets[i])
                                      .then((value) {
                                    if (i == widget.assets.length - 1) {
                                      setState(() {
                                        _isLoading = false;
                                        Navigator.pop(context);
                                      });
                                    }
                                  });
                                }
                              },
                              child: ClipOval(
                                child: Material(
                                    color: Colors.teal,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: _isLoading
                                          ? CircularProgressIndicator(
                                              strokeWidth: 2.0,
                                            )
                                          : Icon(Icons.send,
                                              color: Colors.white),
                                    )),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
