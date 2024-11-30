import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class BoardingController extends ChangeNotifier {
  List<String> folderNames = [];
  Future<bool> getFolderNames() async {
    folderNames = [];
    final AssetManifest assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    List<String> tmpList = assetManifest.listAssets().toList();
    for (var element in tmpList) {
      folderNames.add(element.split("/").last.replaceAll(".json", ""));
    }
    return true;
  }
}
