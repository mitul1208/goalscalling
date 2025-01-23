import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/GoalsApi.dart';
import 'package:flutter_searchabledropdown/apis/updateFcmTokenApi.dart';
import 'package:flutter_searchabledropdown/common/circleularIndicator.dart';
import 'package:flutter_searchabledropdown/common/global_key.dart';
import 'package:flutter_searchabledropdown/constants/SharedPrefs.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/constants/imageConstants.dart';
import 'package:flutter_searchabledropdown/model/goalModel.dart';
import 'package:flutter_searchabledropdown/screens/authQuestionDialog/authQuestionDialog.dart';
import 'package:flutter_searchabledropdown/screens/drawer/drawer.dart';
import 'package:flutter_searchabledropdown/screens/goal_details/GoalDetailMain.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notificationScreen/NotificationScreen.dart';

class GoalsList extends StatefulWidget {
  final String? id;
  final bool showBackButton;
  final String? myTitle;
  GoalsList({this.id,this.showBackButton = false,this.myTitle});

  @override
  _GoalsListState createState() => _GoalsListState();
}

class _GoalsListState extends State<GoalsList> {
  double width = 0;
  double height = 0;
  final LocalAuthentication auth = LocalAuthentication();
  List<GoalModel> list = [];
  bool isLoading = true;
  bool isPoolToRefresh = false;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<String> goalScales = ['0', '1', '2', '3', '4'];
  String title = "";

  late Widget wdgt;
  @override
  void initState() {
    super.initState();

    fetchUserType();
    getGoals();
    getFcmToken();
    setAppbar();
    // getMessage();
  }

  fetchUserType() async {
    String user = await getString(key: "user");
    if (user == "participant") {
      firstTimeCheck();
    }
  }

  setAppbar() async {
    String user = await getString(key: "user");
    print(user);
    if (user == "participant") {
      title = "Home";
      wdgt = IconButton(
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      );
    } else {
      title = "My Provider";
      IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        leading: widget.showBackButton
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ))
            : InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
        titleSpacing: 0,
        title: Text(
          widget.myTitle == null ? "My Goals" : widget.myTitle.toString() + "'s Goals",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            isPoolToRefresh = true;
          });
          getGoals();
        },
        child: Padding(
          padding: EdgeInsets.only(
              right: width * 0.02, top: height * 0.02, left: width * 0.02),
          child: isLoading
              ? circularProgress()
              : Container(
                  child: list == null
                      ? Center(child: Text("No data found"))
                      : Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            buildGoalsListView(),
                            isPoolToRefresh
                                ? Center(child: CircularProgressIndicator())
                                : Container()
                          ],
                        ),
                ),
        ),
      ),
    );
  }

  Widget buildGoalsListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GoalDetailMain(
                        index: int.parse(list[index].id),
                        title: list[index].name,
                      )),
            );
          },
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: height * 0.14,
                      child: VerticalDivider(
                        width: 3,
                        thickness: 5,
                        color: getColorOfBar(double.parse(
                            list[index].latestActivity.activityRanking ??
                                "0")),
                      ),
                    ),
                    buildWidthBox(0.04),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        //height: height * 0.14,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width / 1.3,
                              child: Text(
                                list[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.048,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: buildStartAndEndDate(index),
                            ),
                            list[index].latestActivity != null
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: buildLastUpdateBy(index),
                                  )
                                : Container(),
                            // Row(
                            //   children: [
                            //     Text(
                            //       '•',
                            //       style: TextStyle(
                            //           fontSize: width * 0.06,
                            //           fontWeight: FontWeight.w700,
                            //           color: Colors.green),
                            //     ),
                            //     Text(
                            //       ' Open',
                            //       style: TextStyle(
                            //           color: Colors.green,
                            //           fontSize: width * 0.035,
                            //           fontWeight: FontWeight.w600),
                            //     ),
                            //     //buildWidthBox(0.04),
                            //   ],
                            // ),
                            _linearProgress(index),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    ENTER_ICON,
                    width: 20,
                    height: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Row buildLastUpdateBy(int index) {
    return Row(
      children: [
        Text(
          "Last Updated",
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500),
        ),
        Text(
          ' - ',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500),
        ),
        Container(
          width: width * 0.5,
          child: Text(
            list[index].latestActivity.owner.firstName +
                ' ' +
                list[index].latestActivity.owner.lastName,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Row buildStartAndEndDate(int index) {
    return Row(
      children: [
        Text(
          list[index].createdTimestamp,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500),
        ),
        Text(
          ' - ',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500),
        ),
        Text(
          list[index].latestActivity.dateOfActivity ?? "",
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  double getPercentager(int index) {
    double activityPercent = 0;
    try {
      activityPercent =
          (double.parse(list[index].latestActivity.activityRanking ?? "0") *
                  25) /
              100;
        } catch (e) {
      activityPercent = 0;
    }
    return activityPercent;
  }

  _linearProgress(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text(
            //   "0",
            //   style: TextStyle(
            //       color: Colors.grey[600],
            //       fontSize: width * 0.030,
            //       fontWeight: FontWeight.w500),
            // ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 5,
              width: width * 0.65,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: LinearProgressIndicator(
                value: getPercentager(index),
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  getColorOfBar(double.parse(
                      list[index].latestActivity.activityRanking ?? "0")),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            // Text(
            //   "4",
            //   style: TextStyle(
            //       color: Colors.grey[600],
            //       fontSize: width * 0.030,
            //       fontWeight: FontWeight.w500),
            // )
          ],
        ),
        Container(
          width: width * 0.65,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: goalScales
                  .map(
                    (element) => Text(
                      element,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: width * 0.030,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                  .toList()),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  SizedBox buildWidthBox(h) {
    return SizedBox(
      width: width * h,
    );
  }

  firstTimeCheck() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isFirstTime = sharedPreferences.getBool('first_time');
    print(isFirstTime);
    if (isFirstTime == null) {
      sharedPreferences.setBool("first_time", false);
      authQuestionDialog(context, auth);
    }
  }

  getGoals() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    list = await goalApi(id: widget.id ?? sharedPreferences.getString("id") ?? "");
    setState(() {
      isLoading = false;
      isPoolToRefresh = false;
    });
  }

  getFcmToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    messaging.getToken().then((token) {
      updateDeviceFcmToken(
          userId: sharedPreferences.getString("id"), deviceToken: token);
    });
  }

  Color getColorOfBar(double avg) {
    if (avg >= 0 && avg < 1.0) {
      return Colors.red;
    } else if (avg >= 1.0 && avg < 2.0) {
      return Colors.yellow;
    } else if (avg >= 2.0 && avg < 3.0) {
      return Colors.green;
    } else if (avg >= 3.0 && avg < 4.0) {
      return Colors.blue;
    } else if (avg >= 4.0 && avg < 5.0) {
      return Colors.purple;
    } else {
      return Colors.transparent;
    }

    switch (double.parse((avg).toStringAsFixed(1)).round()) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.green;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.purple;
      default:
        return Colors.transparent;
    }
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
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("on onLaunch");
      Navigator.pushReplacement(myGlobals.scaffoldKey.currentContext!,
          MaterialPageRoute(builder: (
              BuildContext context,
              ) {
            return NotificationScreen();
          }));
    });
      // onLaunch: (Map<String, dynamic> message) async {
      //   print("on onLaunch");
      //   Navigator.pushReplacement(myGlobals.scaffoldKey.currentContext,
      //       MaterialPageRoute(builder: (
      //     BuildContext context,
      //   ) {
      //     return NotificationScreen();
      //   }));
      // },
      // onResume: (Map<String, dynamic> message) async {
      //   print("on Resume");
      //   Navigator.pushReplacement(myGlobals.scaffoldKey.currentContext,
      //       MaterialPageRoute(builder: (
      //     BuildContext context,
      //   ) {
      //     return NotificationScreen();
      //   }));
      //},
    //);
  }
}
