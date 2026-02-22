import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerClass {
  static File? fileImage;
  static Future<File?> imagePicker() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      fileImage = File(image.path);
      return fileImage;
    } catch (e) {
      throw Exception('Error in Pick Image');
    }
  }
}
