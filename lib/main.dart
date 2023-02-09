import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/loadingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_searchabledropdown/screens/notificationScreen/NotificationScreen.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'common/Notification_handler.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  LocalNotificationService.initialize();
  HttpOverrides.global = new MyHttpOverrides();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static int toNotification;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final LocalAuthentication auth = LocalAuthentication();
  bool showAuth = false;
  @override
  void initState() {
    MyApp.toNotification = 0;
    super.initState();
    handleForegroundMessage();
    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },
        title: 'Goal scaling',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: LoadingScreen());
  }

  getMessage() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      MyApp.toNotification = 1;
      setState(() {});
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (
      //   BuildContext context,
      // ) {
      //   return NotificationScreen();
      // }));
    });

    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     // errorMessage("message=="+MyApp.toNotification.toString());
    //   },
    //   onBackgroundMessage: myBackgroundMessageHandler,
    //   onLaunch: (Map<String, dynamic> message) async {
    //     MyApp.toNotification = 1;
    //     // errorMessage("message=="+MyApp.toNotification.toString());
    //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (
    //     //   BuildContext context,
    //     // ) {
    //     //   return NotificationScreen();
    //     // }));
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     MyApp.toNotification = 1;
    //     // errorMessage("message=="+MyApp.toNotification.toString());
    //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (
    //     //   BuildContext context,
    //     // ) {
    //     //   return NotificationScreen();
    //     // }));
    //   },
    // );
  }
}
