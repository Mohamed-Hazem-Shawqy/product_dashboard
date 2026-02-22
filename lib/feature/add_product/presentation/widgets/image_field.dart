import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_dashboard/core/helper_func/image_picker.dart';
import 'package:product_dashboard/core/utils/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          await ImagePickerClass.imagePicker();
          isLoading = false;
          setState(() {});
          widget.onFileChanged(ImagePickerClass.fileImage);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.appDarkGrayColor),
          ),
          child: ImagePickerClass.fileImage != null
              ? Stack(
                  children: [
                    Image.file(ImagePickerClass.fileImage!),

                    IconButton(
                      onPressed: () {
                        ImagePickerClass.fileImage = null;
                        widget.onFileChanged(ImagePickerClass.fileImage);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                )
              : Icon(Icons.image_outlined, size: 150),
        ),
      ),
    );
  }
}
