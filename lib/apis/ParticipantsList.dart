import 'dart:convert';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/ProviderList.dart';
import 'package:http/http.dart';

Future<ProviderListModel> getProviderList({required String id}) async {
  String token = await getToken();
  Response response = await get(Uri.parse(GET_PROVIDER_LIST + id), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + token
  });
  dynamic data = jsonDecode(response.body);
  print(data);
  ProviderListModel abc = ProviderListModel.fromJson(data);

  return abc;
}
