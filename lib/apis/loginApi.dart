import 'dart:convert';

import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/userModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> loginApi({email, password}) async {
  Response response = await post(Uri.parse(LOGIN_URL), body: {"password": password, "email": email});
  dynamic data = jsonDecode(response.body);
  print(data['user']);
  if (data['status'] == 1) {
    // List<User> abc = [];
    User abc = User.fromJson(data['user']);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", data['token']);
    sharedPreferences.setString("name", data['user']['first_name'] + " " + data['user']['last_name']);
    sharedPreferences.setString("email", data['user']['email']);
    sharedPreferences.setString("id", data['user']["id"].toString());
    sharedPreferences.setString("image", data['user']["image"]);
    return abc;
  } else {
    errorMessage(data['msg']);
    return null;
  }
}
