import 'dart:convert';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:http/http.dart';

Future<bool> logoutApi() async
{

  Response response = await post(Uri.parse(LOGOUT_URL),headers: {
    'Authorization': 'Bearer '+await getToken()
  });
  dynamic data = jsonDecode(response.body);
  print(data['user']);
  if(data['status']==1){
    return true;
  }
  else{
    errorMessage(data['msg']);
    return false;
  }
}