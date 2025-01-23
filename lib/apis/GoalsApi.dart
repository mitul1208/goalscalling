import 'dart:convert';
import 'dart:developer';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/goalModel.dart';
import 'package:http/http.dart';

Future<List<GoalModel>> goalApi({required String id}) async {
  print(GET_GOALS + id);
  // Response response =
  //     await get(GET_GOALS, headers: {'Authorization': 'Bearer ' + await getToken()});
  Response response =
      await get(Uri.parse(GET_GOALS + id), headers: {'Authorization': 'Bearer ' + await getToken()});

  log(response.statusCode.toString());

  dynamic data = jsonDecode(response.body);
  print(data['user']);
  List<GoalModel> abc = [];
  data['data'].forEach((v) {
    print(v);
    abc.add(new GoalModel.fromJson(v));
  });
  return abc;
}
