import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

import '../screens/notificationScreen/NotificationScreen.dart';


handleForegroundMessage() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message}');

      if (message.notification != null &&
          ((message.notification?.android != null &&
              message.notification?.android?.imageUrl != null) ||
              (message.notification?.apple != null &&
                  message.notification?.apple?.imageUrl != null))) {
        LocalNotificationService().displayNotificationWithImage(message);
        print('Message also contained a notification: ${message.notification}');
      } else if (message.notification != null) {
        LocalNotificationService().displayNotification(message);
        print('Message also contained a notification: ${message.notification}');
      }
  });
}

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() async {
    InitializationSettings initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings("app_icon"),
      iOS: IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentBadge: true,
        defaultPresentAlert: true,
        defaultPresentSound: true,
      ),
    );
    _notificationPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
          if (payload != null) {
            Navigator.pushReplacement(Get.context, MaterialPageRoute(builder: (
                  BuildContext context,
                ) {
                  return NotificationScreen();
                }));

          }});
    await _notificationPlugin.cancelAll();
  }

  void displayNotification(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails('goalScaling', 'general_notification',
            enableVibration: true,
            playSound: true,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker'),
        iOS: IOSNotificationDetails(
            presentSound: true,
            presentBadge: true, presentAlert: true));
    print(message.data);
    _notificationPlugin.show(id, message.notification?.title,
        message.notification?.body, notificationDetails,
        payload: "");
  }

  void displayNotificationWithImage(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final String bigPicturePath = await _downloadAndSaveFile(
        Platform.isIOS
            ? message.notification.apple.imageUrl??""
            : message.notification.android.imageUrl??"",
        'bigPicture');
    var bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      contentTitle: message.notification?.title,
      summaryText: message.notification?.body,
      hideExpandedLargeIcon: true,
    );
    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails('dairyBcs', 'general_notification',
            enableVibration: true,
            playSound: true,
            styleInformation: bigPictureStyleInformation,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker'),
        iOS: IOSNotificationDetails(
            presentSound: true,
            presentBadge: true,
            presentAlert: true,
            attachments: [IOSNotificationAttachment(bigPicturePath)]));
    print(message.data);
    _notificationPlugin.show(id, message.notification?.title,
        message.notification?.body, notificationDetails,
        payload: message.data.toString());
  }
}

handleOnTapMessageWhenClose(message) {
  if (message != null) {

  }
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final http.Response response = await http.get(Uri.parse(url));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

getDataFromMessage(payload){
  Map result = {};
  List<String> str =
  payload.replaceAll("{", "").replaceAll("}", "").split(",");
  for (int i = 0; i < str.length; i++) {
    List<String> s = str[i].split(": ");
    result.putIfAbsent(s[0].trim(), () => s[1].trim());
  }
  return result;
}