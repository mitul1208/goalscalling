import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/ProviderApi.dart';
import 'package:flutter_searchabledropdown/constants/SharedPrefs.dart';
import 'package:flutter_searchabledropdown/model/participentList.dart';
import 'package:flutter_searchabledropdown/screens/authQuestionDialog/authQuestionDialog.dart';
import 'package:flutter_searchabledropdown/screens/drawer/drawer.dart';

import 'package:flutter_searchabledropdown/screens/homePage/GoalsList.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
//import 'package:local_auth_device_credentials/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyParticipants extends StatefulWidget {
  final bool showBackButton;
  final String id;
  final String myTitle;
  MyParticipants({this.id, this.showBackButton = false, this.myTitle});
  @override
  _MyParticipantsState createState() => _MyParticipantsState();
}

class _MyParticipantsState extends State<MyParticipants> {
  ParticipantListModel list;
  bool isLoading = true;
  double width;
  double height;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final LocalAuthentication auth = LocalAuthentication();
  List<String> goalScales = ['0', '1', '2', '3', '4'];
  String title = "";
  Widget wdgt;

  @override
  void initState() {
    super.initState();
    getParticipant();
    setAppbar();
    // getMessage();
    fetchUserType();
  }

  fetchUserType() async {
    String user = await getString(key: "user");
    if (user == "supervisor") {
      firstTimeCheck();
    }
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

  setAppbar() async {
    String user = await getString(key: "user");
    print(user);
    if (!widget.showBackButton) {
      title = "Home";
      wdgt = IconButton(
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.black,
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
  // setAppbar() async {
  //   String user = await getString(key: "user");
  //   print(user);
  //   if (user == "provider") {
  //     title = "Home";
  //   } else {
  //     title = "My Participants";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      appBar: AppBar(
          brightness: Brightness.dark,
          titleSpacing: 0,
          centerTitle: false,
          title: Text(
            widget.myTitle == null
                ? "My Participants"
                : widget.myTitle + "'s Participants",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
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
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ))),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              itemCount: list.participants.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoalsList(
                                id: list.participants[index].participantId
                                    .toString(),
                                showBackButton: true,
                                myTitle: list
                                    .participants[index].participant.firstName,
                              )),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(
                            0.25,
                            0.2,
                          ),
                        )
                      ],
                    ),
                    height: 120.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10, top: 10, right: 0, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25.0,
                                    backgroundImage: NetworkImage(list
                                        .participants[index].participant.image),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list.participants[index].participant
                                            .fullName,
                                        style: TextStyle(
                                          fontSize: width * 0.043,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "# of Goals",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            " : ${list.participants[index].participant.userDetail.numUsersGoals} |",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            " Last update",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            width: width * 0.225,
                                            child: Text(
                                              " : " +
                                                  DateFormat('MMM-dd, yyyy')
                                                      .format(DateTime.parse(
                                                          list
                                                              .participants[
                                                                  index]
                                                              .participant
                                                              .updatedAt)),
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              _linearProgress(index),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 25.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: list.participants[index].isActive == "1"
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                10.0,
                              ),
                              bottomRight: Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    list.participants[index].isActive == "1"
                                        ? "ACTIVE"
                                        : "INACTIVE",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  getParticipant() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // print(sharedPreferences.getString("id"));
    list = await getParticipantApi(
        id: widget.id ?? sharedPreferences.getString("id"));
    setState(() {
      isLoading = false;
    });
  }

  _linearProgress(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
              width: width * 0.72,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: LinearProgressIndicator(
                // getPercentager(index),
                value: getPercentager(index),
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  getColorOfBar(double.parse(list.participants[index]
                      .participant.userDetail.avgGoalChange)),
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
          width: width * 0.7,
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

  double getPercentager(int index) {
    double activityPercent = 0;
    try {
      if (list.participants[index].participant.userDetail.avgGoalChange ==
          null) {
        activityPercent = 0;
      } else {
        activityPercent = (double.parse(list.participants[index].participant
                        .userDetail.avgGoalChange ??
                    "0") *
                25) /
            100;
      }
    } catch (e) {
      activityPercent = 0;
    }
    return activityPercent;
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
// double getPercentager(int index) {
//   double activityPercent = 0;
//   try {
//     if (list[index].latestActivity == null) {
//       activityPercent = 0;
//     } else {
//       activityPercent =
//           (double.parse(list[index].latestActivity?.activityRanking ?? "0") *
//               25) /
//               100;
//     }
//   } catch (e) {
//     activityPercent = 0;
//   }
//   return activityPercent;
// }
}
