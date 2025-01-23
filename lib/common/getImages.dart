import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> captureSingleImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    print('No image selected.');
    return null;
  }
}

Future<File?> selectSingleImage() async {
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  } on Exception {
    print('No image selected.');
    return null;
  }
}

Future<File?> selectMultipleImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.image,
    // allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'docx', 'gif'],
  );

  if (result != null) {
    File file = File(result.files.single.path??"");

    return file;
  } else {
    print('No image selected.');
    return null;
  }
}
