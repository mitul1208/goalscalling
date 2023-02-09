import 'dart:convert';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';

import 'package:flutter_searchabledropdown/model/notificationModel.dart';
import 'package:http/http.dart';

Future<List<NotificationsModel>> getNotifications() async {
  Response response = await get(Uri.parse(GET_NOTIFICATIONS),
      headers: {'Authorization': 'Bearer ' + await getToken()});
  dynamic data = jsonDecode(response.body);
  List<NotificationsModel> abc = [];
  data['notifications'].forEach((v) {
    print(v);
    abc.add(new NotificationsModel.fromJson(v));
  });
  return abc;
}
