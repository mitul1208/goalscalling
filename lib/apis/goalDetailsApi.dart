import 'dart:convert';
import 'dart:io';
import 'package:flutter_searchabledropdown/common/formateDate.dart';
import 'package:flutter_searchabledropdown/common/getToken.dart';
import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/constants/ApiLinks.dart';
import 'package:flutter_searchabledropdown/model/goalDetailsModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

import '../model/goalDetailsModel.dart';

Future<GoalDetailsModel> getGoalDetail({int index}) async {
  Response response = await get(Uri.parse(GET_GOAL_DETAIL + '/' + (index).toString()),
      headers: {'Authorization': 'Bearer ' + await getToken()});
  print(response.statusCode);
  dynamic data = jsonDecode(response.body);
  if (data['status'] == 1) {
    GoalDetailsModel abc = GoalDetailsModel.fromJson(data);
    print('status');
    return abc;
  } else {
    errorMessage(data['msg']);
    return null;
  }
}

Future<bool> setGoalMessageReply(
    {String goalMessage,
    String activityRanking,
    Activities firstActivity,
    File image}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String userId = sharedPreferences.getString("id");
  var uri = Uri.parse(SET_GOAL_MESSAGE + (firstActivity.goalId).toString());
  var request = http.MultipartRequest('POST', uri);
  request.headers['Authorization'] = 'Bearer ' + await getToken();
  if (image != null) {
    var stream = new ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    var multipartFile = new MultipartFile('activity_files[0]', stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
  }
  request.fields['goal_id'] = (firstActivity.goalId.toString());
  request.fields['update_text'] = goalMessage;
  request.fields['activity_ranking'] = firstActivity.activityRanking;
  request.fields['participant_id'] = userId;
  request.fields['date_of_activity'] = firstActivity.dateOfActivity;
  request.fields['parent_activity_id'] = firstActivity.id;
  request.fields['is_active'] = '1';
  request.fields['created_by'] = userId;
  request.fields['last_modified_by'] = firstActivity.lastModifiedBy;
  // send
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var res = jsonDecode(respStr);
  if (res['status'] == 1) {
    return true;
  } else {
    errorMessage(res['msg']);
    return false;
  }
}

Future<bool> setGoalMessage(
    {String goalMessage,
    String activityRanking,
    GoalDetail goalDetail,
    File image}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String userId = sharedPreferences.getString("id");
  var uri = Uri.parse(SET_GOAL_MESSAGE + (goalDetail.id).toString());
  var request = http.MultipartRequest('POST', uri);
  request.headers['Authorization'] = 'Bearer ' + await getToken();
  if (image != null) {
    var stream = new ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    var multipartFile = new MultipartFile('activity_files[0]', stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
  }
  request.fields['goal_id'] = (goalDetail.id.toString());
  request.fields['update_text'] = goalMessage;
  request.fields['activity_ranking'] = activityRanking;
  request.fields['participant_id'] = userId;
  request.fields['date_of_activity'] =
      getFullDateString(DateTime.now().toString());
  request.fields['parent_activity_id'] = '0';
  request.fields['is_active'] = '1';
  request.fields['created_by'] = userId;
  request.fields['last_modified_by'] = userId;
  // send
  print('sending');
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  var res = jsonDecode(respStr);
  if (res['status'] == 1) {
    print('status');
    return true;
  } else {
    print(res['msg']);
    errorMessage(res['msg']);
    return false;
  }
}

// Future<bool> setGoalMessage(
//     {String goalMessage,
//     String activityRanking,
//     Activities firstActivity}) async {
//   print("activity Rank=" + activityRanking);
//   print("participant id=" + firstActivity.participantId);
//   print("date_of_activity" + firstActivity.dateOfActivity);
//   print("parent_activity_id" + firstActivity.id);
//   print("is_active" + "1");
//   print("createdBy=" + firstActivity.createdBy);
//   print("last_modified_by" + firstActivity.participantId);
//         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String userId =   sharedPreferences.getString("id");

//   Response response = await post(
//       SET_GOAL_MESSAGE + (firstActivity.goalId).toString(),
//       headers: {
//         'Authorization': 'Bearer ' + await getToken()
//       },
//       body: {
//         'goal_id': (firstActivity.goalId.toString()),
//         'update_text': goalMessage,
//         'activity_ranking': firstActivity.activityRanking,
//         'participant_id':userId,
//         'date_of_activity': firstActivity.dateOfActivity,
//         'parent_activity_id': firstActivity.id, //goalDetails.lastModifiedBy ,
//         'is_active': '1',
//         'created_by': userId,
//         'last_modified_by': firstActivity.lastModifiedBy ?? ""
//       });
//   dynamic data = jsonDecode(response.body);
//   if (data['status'] == 1) {
//     return true;
//   } else {
//     errorMessage(data['msg']);
//     return false;
//   }
// }

// activityRanking:"0"
// createdAt:"2021-02-16T16:48:32.000000Z"
// createdBy:"1"
// dateOfActivity:"02/16/21, 11:48 AM"
// deletedAt:"null"
// goalId:"1"
// id:"13"
// isActive:"1"
// lastModifiedBy:"null"
// parentActivityId:"7"
// participantId:"1"
// updateText:"this is reply testing"
// updatedAt:"2021-02-16T16:48:32.000000Z"
// hashCode:599670908
