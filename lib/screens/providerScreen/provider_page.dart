import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/ParticipantsList.dart';
import 'package:flutter_searchabledropdown/constants/SharedPrefs.dart';

import 'package:flutter_searchabledropdown/model/ProviderList.dart';
import 'package:flutter_searchabledropdown/model/participentList.dart';
import 'package:flutter_searchabledropdown/screens/authQuestionDialog/authQuestionDialog.dart';

import 'package:flutter_searchabledropdown/screens/drawer/drawer.dart';
import 'package:flutter_searchabledropdown/screens/providerScreen/participant_page.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
//import 'package:local_auth_device_credentials/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends StatefulWidget {
  @override
  _MyProviderState createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  List<String> goalScales = ['0', '1', '2', '3', '4'];
  double width;
  double height;
  ProviderListModel list;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = true;
  String title = "";
  Widget wdgt;
  List<String> programNames = [];

  final LocalAuthentication auth = LocalAuthentication();

  void initState() {
    super.initState();
    getProvider();
    setAppbar();
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
    if (user == "supervisor") {
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
          color: Colors.black,
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
        brightness: Brightness.dark,
        titleSpacing: 0,
        centerTitle: false,
        title: Text(
          "My Providers",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        // leading: wdgt,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: list.providers.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    print("Provider ID 6");
                    print(list.providers[index].providerId.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyParticipants(
                                id: list.providers[index].providerId.toString(),
                                showBackButton: true,
                                myTitle:
                                    list.providers[index].provider.firstName,
                                // index: int.parse(list[index].id),
                                // title: list[index].name,
                              )),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0.25, 0.2))
                      ],
                    ),
                    height: 195.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 8.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  //width: MediaQuery.of(context).size.width - 40,
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 25.0,
                                        backgroundImage: NetworkImage(
                                          list.providers[index].provider.image,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list.providers[index].provider
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
                                                  "Last update",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                                Text(
                                                  " : " +
                                                      DateFormat('MMM-dd, yyyy')
                                                          .format(DateTime
                                                              .parse(list
                                                                  .providers[
                                                                      index]
                                                                  .provider
                                                                  .updatedAt)),
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              _linearProgress(index),
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                height: 1.0,
                                //width: MediaQuery.of(context).size.width - 40,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "# of providers",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                        Text(
                                          " : ${list.providers[index].provider.userDetail.numUsers}   ",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.grey.withOpacity(0.3),
                                      height: 40.0,
                                      width: 1.0,
                                    ),
                                    Text(
                                      "     # of Participant's Goals",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Text(
                                      " : ${list.providers[index].provider.userDetail.numUsersGoals}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                height: 1.0,
                                //width: MediaQuery.of(context).size.width - 40,
                              ),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Container(
                              //     height: 20.0,
                              //     //width: MediaQuery.of(context).size.width - 40,
                              //     child: Row(
                              //       // crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           "   Origination: ",
                              //           style: TextStyle(
                              //             fontWeight: FontWeight.w500,
                              //             fontSize: 13.0,
                              //           ),
                              //         ),
                              //         Text(
                              //           "WMU CHHS",
                              //           style: TextStyle(
                              //             color: Colors.grey,
                              //             fontSize: 13.0,
                              //             fontWeight: FontWeight.w600,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // Container(
                              //   color: Colors.grey.withOpacity(0.3),
                              //   height: 1.0,
                              //   //width: MediaQuery.of(context).size.width - 40,
                              // ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40.0,
                                  //width: MediaQuery.of(context).size.width - 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "   Program: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.7,
                                        child: Text(
                                          programNames[index],
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  getProvider() async {
    // log(list.toString());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    list = await getProviderList(id: sharedPreferences.getString("id"));
    if (list != null) {
      fetchProgramName();
    }
    log(list.providers.length.toString());
    setState(() {
      isLoading = false;
    });
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

  _linearProgress(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                width: width * 0.82,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: LinearProgressIndicator(
                  value: getPercentager(index),
                  //getPercentager(index),
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    getColorOfBar(double.parse(list
                        .providers[index].provider.userDetail.avgGoalChange)),
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
            width: width * 0.82,
            margin: EdgeInsets.only(left: 10),
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
        ],
      ),
    );
  }

  double getPercentager(int index) {
    double activityPercent = 0;
    try {
      if (list.providers[index].provider.userDetail.avgGoalChange == null) {
        activityPercent = 0;
      } else {
        activityPercent = (double.parse(
                    list.providers[index].provider.userDetail.avgGoalChange ??
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

  fetchProgramName() {
    for (int i = 0; i < list.providers.length; i++) {
      String name;
      for (int j = 0; j < list.providers[i].programs.length; j++) {
        if (name == null || list.providers[i].programs.length == 1) {
          name = list.providers[i].programs[j].program.name;
        } else {
          name = name + "," + list.providers[i].programs[j].program.name;
        }
      }
      programNames.add(name);
    }
    setState(() {});
  }
}
