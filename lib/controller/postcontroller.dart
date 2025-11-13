import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController{
  late TextEditingController prix ; 
  late TextEditingController description ; 
  late TextEditingController titre ; 
  late ImagePickerController image;
  
  @override
  void onInit() {
    prix = TextEditingController();
    description = TextEditingController();
    titre = TextEditingController();
    image = ImagePickerController();
    super.onInit();
  }

   @override
  void dispose() {
    prix.dispose();
    description.dispose();
    titre.dispose();
    super.dispose();
  }
}
class ImagePickerController {
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      _pickedImage = File(pickedImage.path);
    }
  }

  File? get pickedImage => _pickedImage;
}