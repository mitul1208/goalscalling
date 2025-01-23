import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List> testCompressFile(File file) async {
  int originalSize = file.lengthSync();

  print('Original File in int : ' + file.lengthSync().toString());
  if (originalSize < 500000) {
    print('return without compress');
    return file.readAsBytesSync();
  }

  var result = await FlutterImageCompress.compressWithFile(
    file.absolute.path,
    minWidth: 2300,
    minHeight: 1500,
    quality: 75,
    rotate: 0,
  );

  print('Original File : ' + file.lengthSync().toString());
  print('Compressed File : ' + result!.length.toString());
  return result;
}
