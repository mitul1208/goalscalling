import 'dart:convert';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/participentList.dart';
import 'package:http/http.dart';

Future<ParticipantListModel> getParticipantApi({required String id}) async {
  String token = await getToken();
  print(GET_PARTICIPANT_LIST + id);
  Response response = await get(Uri.parse(GET_PARTICIPANT_LIST + id), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + token
  });
  dynamic data = jsonDecode(response.body);

  ParticipantListModel abc = ParticipantListModel.fromJson(data);
  return abc;
}
