import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/getNotificationApi.dart';

import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/constants/imageConstants.dart';
import 'package:flutter_searchabledropdown/model/notificationModel.dart';
import 'package:flutter_searchabledropdown/screens/goal_details/GoalDetailMain.dart';

import 'package:flutter_searchabledropdown/screens/homePage/GoalsList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  double width;
  double height;
  List<NotificationsModel> list = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    callApiMethod();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (
          BuildContext context,
        ) {
          return GoalsList();
        }));
        return null;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          titleSpacing: 0,
          centerTitle: false,
          title: Text("Notifications"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                  BuildContext context,
                ) {
                  return GoalsList();
                }));
              }),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : list == null || list.length == 0
                ? Center(
                    child: Text(
                      "No data found",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: list.length,
                        padding: EdgeInsets.only(top: 5),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GoalDetailMain(
                                          index: int.parse(list[index].goalId),
                                          title: "",
                                        )),
                              );
                            },
                            child: Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.15,
                              closeOnScroll: true,
                              secondaryActions: [
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(vertical: 5),
                                //   child: Container(
                                //     color: Colors.red.withOpacity(0.8),
                                //     width: width * 0.1,
                                //     child: Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         Image.asset(
                                //           REJECT,
                                //           width: 25,
                                //           height: 25,
                                //         ),
                                //         Text(
                                //           "Reject",
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: width * 0.037,
                                //               fontWeight: FontWeight.bold),
                                //           textAlign: TextAlign.right,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(vertical: 5),
                                //   child: Container(
                                //     color: Colors.green.withOpacity(0.8),
                                //     width: width * 0.1,
                                //     child: Column(
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         Image.asset(
                                //           ACCEPT,
                                //           width: 25,
                                //           height: 25,
                                //         ),
                                //         Text(
                                //           "Accept",
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontSize: width * 0.037,
                                //               fontWeight: FontWeight.bold),
                                //           textAlign: TextAlign.right,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            list[index].sentAt,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: width * 0.027,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            height: height * 0.1,
                                            child: VerticalDivider(
                                              width: 3,
                                              thickness: 3,
                                              color: Colors.green,
                                            ),
                                          ),
                                          buildWidthBox(0.02),
                                          new Container(
                                            alignment: Alignment.centerLeft,
                                            width: 55.0,
                                            height: 55.0,
                                            decoration: new BoxDecoration(
                                              color: primaryColor,
                                              image: new DecorationImage(
                                                image: NetworkImage(
                                                    list[index]?.from?.image ??
                                                        NO_IMAGE_FOUND),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: new BorderRadius
                                                      .all(
                                                  new Radius.circular(50.0)),
                                              border: new Border.all(
                                                color: primaryColor,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          buildWidthBox(0.02),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Text(
                                                  list[index].notificationBody,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              buildHeightBox(0.05),
                                              Text(
                                                "Sent by " +
                                                    list[index].from.fullName,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.right,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
      ),
    );
  }

  SizedBox buildWidthBox(h) {
    return SizedBox(
      width: width * h,
    );
  }

  SizedBox buildHeightBox(h) {
    return SizedBox(
      width: height * h,
    );
  }

  callApiMethod() async {
    list = await getNotifications();
    setState(() {
      isLoading = false;
    });
  }
}
