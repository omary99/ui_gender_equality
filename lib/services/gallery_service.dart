import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gender_equality/models/media_model.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryService with ChangeNotifier {
  bool _isSingleSelect = true;

  List<AssetEntity> _assets = [];

  int _currentPage = 0;

  List<MediaModel> _mediaToUpload = [];

  ///setters...
  set setSingleSelect(bool value) {
    _isSingleSelect = value;
    notifyListeners();
  }

  loadMediaToUpload(AssetEntity asset) async {
    File? _file = await asset.file;

    final MediaModel _mediaModel =
        MediaModel(file: _file!, caption: '', asset: asset);
    _mediaToUpload.add(_mediaModel);
    notifyListeners();
  }

  editCaption(MediaModel mediaModel, String caption) {
    _mediaToUpload
        .firstWhere((element) => element.asset == mediaModel.asset)
        .caption = caption;
    notifyListeners();
  }

  set setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  set selectAsset(AssetEntity asset) {
    _assets.forEach((element) {
      if (element.id == asset.id) {
        element.isFavorite = !element.isFavorite;
        if (element.isFavorite) {
          loadMediaToUpload(asset);
        } else {
          _mediaToUpload.removeWhere((element) => element.asset == asset);
        }
        return;
      }
      notifyListeners();
    });
  }

  Future<bool> selectSingleAsset(AssetEntity asset) async {
    bool _isLoading = true;
    _mediaToUpload.clear();
    notifyListeners();

    await loadMediaToUpload(asset);
    _isLoading = false;
    notifyListeners();

    return _isLoading;
  }

  clearSelectedAssets() {
    _mediaToUpload.clear();
    notifyListeners();
  }

  //getters...
  bool get isSingleSelect => _isSingleSelect;
  List<AssetEntity> get assets => _assets;
  List<MediaModel> get mediaToUpload => _mediaToUpload.toList();
  int get currentPage => _currentPage;

  //methods...
  fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI
    _assets = recentAssets;
    notifyListeners();
  }
}
