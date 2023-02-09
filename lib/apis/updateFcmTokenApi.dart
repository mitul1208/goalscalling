import 'dart:convert';

import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/userModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User> updateDeviceFcmToken({userId, deviceToken}) async {
  Response response = await post(Uri.parse(UPDATE_DEVICE_TOKEN),
      headers: {'Authorization': 'Bearer ' + await getToken()},
      body: {"user_id": userId, "device_token": deviceToken});

  dynamic data = jsonDecode(response.body);

  if (data['status'] == 1) {
    return null;
  } else {
    errorMessage(data['msg']);
    return null;
  }
}
