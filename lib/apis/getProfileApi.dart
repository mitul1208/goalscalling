import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_searchabledropdown/common/ImageCompression.dart';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/userModel.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User> profileApi({email, password}) async {
  Response response = await get(Uri.parse(GET_PROFILE),
      headers: {'Authorization': 'Bearer ' + await getToken()});
  dynamic data = jsonDecode(response.body);
  print(data);
  SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
  sharedPreferences.setString("name", data['first_name'] + " " + data['last_name']);
  sharedPreferences.setString("email", data['email']);
  sharedPreferences.setString("id", data["id"].toString());
  sharedPreferences.setString("image", data["image"]);
    // SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    //  sharedPreferences.setString("image", data['image']);
  User abc = User.fromJson(data);
  return abc;
}

Future<User> updateProfileApi({email, password}) async {
  Response response = await post(Uri.parse(UPDATE_PROFILE),
      headers: {'Authorization': 'Bearer ' + await getToken()}, body: {});
  dynamic data = jsonDecode(response.body);
  print(data);
  User abc = User.fromJson(data);
  return abc;
}

Future<bool> updateUserData( {first_name, last_name, email, phone}) async {
   Response response = await post(Uri.parse(UPDATE_PROFILE),
     headers: {'Authorization': 'Bearer ' + await getToken()},
   body: {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "phone": phone,
    });
    dynamic data = jsonDecode(response.body);
    print(data['user']);
    if(data['status']==1){
      successMessage(message: data["msg"]);
      return true;
      // List<User> abc = [];
      // User abc = User.fromJson(data['user']);
      // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // sharedPreferences.setString("token",data['token']);
      // sharedPreferences.setString("name", data['user']['first_name']+" "+ data['user']['last_name']);
      // sharedPreferences.setString("email",data['user']['email']);
      // sharedPreferences.setString("id", data['user']["id"].toString());
      // sharedPreferences.setString("image",data['user']["image"]);
      // return abc;
    }
    else{
      errorMessage(data['msg']);
      return false;
    }
}

Future<bool> uploadProfileImage(
    {File image, first_name, last_name, email, phone}) async {
  // if (await checkInternet() == false) {
  //   showToastMessage('No Internet');
  //   return false;
  // }
  try {
    var uri = Uri.parse(UPDATE_PROFILE);
    var request = http.MultipartRequest('POST', uri);

    if (image != null) {
      Uint8List uintImage = await testCompressFile(image);
      Stream<List<int>> imageStream =
          http.ByteStream.fromBytes(List<int>.from(uintImage));
      request.files.add(
        http.MultipartFile(
            'user_image',
            // ignore: deprecated_member_use
            // http.ByteStream(DelegatingStream.typed(image.openRead())),
            // await image.length(),
            imageStream,
            uintImage.length,
            filename: basename(image.path)),
        // http.MultipartFile(
        //   'image',
        //   imageStream,
        //   uintImage.length,
        // ),
      );
    }
    request.fields['first_name'] = first_name;
    request.fields['last_name'] = last_name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.headers['Authorization'] = 'Bearer ' + await getToken();
    var result = await request.send();

    final respStr = await result.stream.bytesToString();

    var res = jsonDecode(respStr);
        print(res);
    if (res["status"] == 1) {
      successMessage(message: res["msg"]);
      print(res['user']["image"]);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("image", res['user']["image"].toString().replaceAll(" ",""));
    }
    return true;
  } on Exception catch (e) {
    print('[ERROR] $e');
    return false;
  }
}
