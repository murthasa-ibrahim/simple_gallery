import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  List<String> imageList = [];

  chosePick(source) async {
    final ImagePicker pickIMage = ImagePicker();
    final XFile? image = await pickIMage.pickImage(source: source);
    if (image != null) {
      var dir = await getExternalStorageDirectory();
      if (dir != null && !dir.existsSync()) {
        Directory(dir.path).createSync();
      }
      File imagePath = File(image.path);
      File newImage =
          await imagePath.copy('${dir!.path}/${DateTime.now()}.jpg');

      imageList.add(newImage.path);
    }
    update();
  }
}
