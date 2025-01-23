import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/constants/SharedPrefs.dart';
import 'package:flutter_searchabledropdown/screens/homePage/GoalsList.dart';
import 'package:flutter_searchabledropdown/screens/loginScreen/loginscreen.dart';
import 'package:flutter_searchabledropdown/screens/providerScreen/participant_page.dart';
import 'package:flutter_searchabledropdown/screens/providerScreen/provider_page.dart';
import 'package:local_auth/local_auth.dart';

import 'main.dart';
import 'screens/notificationScreen/NotificationScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool isAuthenticated = false;
  bool isFirstTime = false;
  late String user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserType();
    print(MyApp.toNotification.toString());
  }

  fetchUserType() async {
    user = await getString(key: "user");
    print(user);
    setState(() {});
    // checkAuthEnable();
      if (user == "participant") {}
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      if ((MyApp.toNotification == 1)) {
        MyApp.toNotification = 0;
        return NotificationScreen();
      } else {
        if (user == "participant") {
          return GoalsList();
        } else if (user == "provider") {
          return MyParticipants();
        } else if (user == "supervisor") {
          return MyProvider();
        } else {
          return GoalsList();
        }
      }
    } else {
      return WillPopScope(
          onWillPop: () {
            exit(0);
          },
          child: LoginScreen());
    }
  }

  checkAuthEnable() async {
    _authenticate();
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var temp = sharedPreferences.getBool("showAuth");
    // if (temp == true) {
    //   _authenticate();
    // } else {
    //   setState(() {
    //     isAuthenticated = false;
    //   });
    // }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    // try {
    authenticated = await auth.authenticate(
      localizedReason: 'one time login',
      // authMessages: const <AuthMessages>[
      //   AndroidAuthMessages(
      //       signInTitle: 'Oops! Biometric authentication required!',
      //       cancelButton: 'No thanks',
      //       biometricHint: "",
      //       biometricRequiredTitle: "Oops! Biometric authentication required!",
      //       deviceCredentialsRequiredTitle:
      //           'Oops! Biometric authentication required!'),
      //   IOSAuthMessages(
      //     goToSettingsDescription: 'Oops! Biometric authentication required!',
      //     cancelButton: 'No thanks',
      //     goToSettingsButton: "Cancel",
      //   ),
      // ],
      options: AuthenticationOptions(stickyAuth: true),
    );
    if (authenticated) {
      setState(() {
        isAuthenticated = true;
      });
    } else {
      setState(() {
        isAuthenticated = false;
      });
    }
  }
  // on PlatformException catch (e) {
  //   setState(() {
  //     isAuthenticated = true;
  //   });
  // } finally {}
  // }
}
