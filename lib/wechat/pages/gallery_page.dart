///
/// [Author] Alex (https://github.com/Alex525)
/// [Date] 2020-05-31 21:38
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/screens.dart';

import 'multi_assets_page.dart';

bool get currentIsDark =>
    Screens.mediaQuery.platformBrightness == Brightness.dark;

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(pageControllerListener);
  }

  void selectIndex(int index) {
    if (index == currentIndex) {
      return;
    }
    controller.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void pageControllerListener() {
    final int? currentPage = controller.page?.round();
    if (currentPage != null && currentPage != currentIndex) {
      currentIndex = currentPage;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget header(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 30.0),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          header(context),
          Expanded(
            child: MultiAssetsPage(),
          ),
        ],
      ),
    );
  }
}
