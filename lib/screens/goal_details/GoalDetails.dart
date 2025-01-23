import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_searchabledropdown/apis/goalDetailsApi.dart';
import 'package:flutter_searchabledropdown/common/circleularIndicator.dart';
import 'package:flutter_searchabledropdown/common/formateDate.dart';
import 'package:flutter_searchabledropdown/common/getImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/constants/imageConstants.dart';
import 'package:flutter_searchabledropdown/model/goalDetailsModel.dart';
import 'package:flutter_searchabledropdown/screens/goal_details/ReplyDialog.dart';
import 'package:flutter_searchabledropdown/screens/goal_details/showAttachmentImage.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

import '../../common/toastMessage.dart';

class GoalDetails extends StatefulWidget {
  final int index;
  final String title;
  final GoalDetailsModel goalDetailsModel;
  GoalDetails({required this.goalDetailsModel,required this.index,required this.title});
  @override
  _GoalDetailsState createState() => _GoalDetailsState();
}

class _GoalDetailsState extends State<GoalDetails> {
  double width = 0;
  double height = 0;
  GoalDetailsModel? list;
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocus = FocusNode();
  ScrollController _scrollController = new ScrollController();
  bool isSendImageScreen = false;
  File? selectedImage;
  List<Color> gradientColors = [
    Colors.blue,
    Colors.blue,
  ];
  bool isLoading = false;
  int selectedGoal = -1;
  bool isLoadingActivity = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = widget.goalDetailsModel;
    // getGoalDetails();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          isSendImageScreen = false;
        });
      },
      child: Container(
        child: isLoading
            ? circularProgress()
            : Stack(
                alignment: Alignment.topCenter,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (isSendImageScreen) {
                            isSendImageScreen = false;
                            setState(() {});
                          }
                          return true;
                        },
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: width * 0.02,
                                // top: height * 0.02,
                                left: width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // buildHeightBox(0.01),
                                Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ScrollConfiguration(
                                      // behavior: MyBehavior(),
                                      behavior: ScrollBehavior(),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          width: list!.xaxis.length > 3
                                              ? (list!.xaxis.length * 70.0 + 100)
                                              : width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, right: 40, left: 20),
                                            child: LineChart(
                                              mainGraphData(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // buildHeightBox(0.01),

                                buildHeightBox(0.01),
                                buildHorizontalList(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textField(),
                                    InkWell(
                                      onTap: _sendMessage,
                                      child: Image.asset(
                                        SEND,
                                        width: 40,
                                        height: 40,
                                      ),
                                    )
                                  ],
                                ),
                                buildHeightBox(0.02),
                                // showSelectedImage(),
                                // buildHeightBox(0.02),

                                buildChatScreen(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: height * 0.1,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.bottomCenter,
                              child: child,
                            );
                          },
                          child: isSendImageScreen
                              ? buildSendImageScreen(context)
                              : SizedBox(),
                        ),
                      )
                    ],
                  ),
                  isLoadingActivity ? CircularProgressIndicator() : Container()
                ],
              ),
      ),
    );
  }

  showSelectedImage() {
    if (selectedImage == null) {
      return Container();
    }
    String? mimeStr = lookupMimeType(selectedImage!.path);
    if(mimeStr==null){
      return;
    }
    var fileType = mimeStr.split('/');
    print('file type ${fileType[0]}');
    String path = p.basename(selectedImage!.path);

    // if(selectedImage.)

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (fileType[0] != 'image')
            ? Container(
                width: 100,
                child:
                    Text(path.toString() ?? "", overflow: TextOverflow.clip),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
        buildWidthBox(0.01),
        IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                selectedImage = null;
              });
            })
      ],
    );
  }

  Container buildSendImageScreen(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            //color: primaryColor.withOpacity(0.9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [buildUpload(), buildWidthBox(0.07), buildCapture()],
              ),
            ),
          ),
        ));
  }

  Widget buildUpload() {
    return GestureDetector(
      onTap: () async {
        selectedImage = await selectMultipleImage();
        if (selectedImage != null) {
          // _sendMessage();

          successMessage(message: "Image Selected");
          setState(() {
            isSendImageScreen = false;
          });
        }
        //setState(() {});
      },
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            child: Icon(
              Icons.image,
              size: 25,
              color: Colors.white,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              "Upload",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: width * 0.037,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCapture() {
    return InkWell(
      onTap: () async {
        selectedImage = await captureSingleImage();
        if (selectedImage != null) {
          successMessage(message: "Image Selected");
          setState(() {
            isSendImageScreen = false;
          });
        }
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            child: Icon(
              Icons.add_a_photo,
              size: 25,
              color: Colors.white,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              "Capture",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: width * 0.037,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Container buildHorizontalList() {
    return Container(
      alignment: Alignment.centerRight,
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showSelectedImage(),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGoal = index;
                      });
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Center(
                          child: Text(
                        index.toString(),
                        style: TextStyle(
                            color: (selectedGoal == index)
                                ? primaryColor
                                : Colors.black,
                            fontSize: 18),
                      )),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: (selectedGoal == index)
                            ? Colors.white
                            : primaryColor,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget buildChatScreen() {
    if (list!.activities.length <= 0) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Activity",
        //   style: TextStyle(
        //       color: Colors.black,
        //       fontSize: width * 0.047,
        //       fontWeight: FontWeight.w400),
        // ),
        Container(
          //height: height * 0.38,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.005,
                        ),
                        mainActivityList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  userDetail({required bool isleft, String userType= "", String userName= ""}) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Container(
        alignment: isleft ? Alignment.bottomLeft : Alignment.bottomRight,
        height: height * 0.06,
        width: width * 0.9,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            reverse: !isleft,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              buildWidthBox(0.01),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$userType ($userName)",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400),
                    ),
                    // Text(
                    //   "WMU Admin",
                    //   style: TextStyle(
                    //       color: Colors.grey[700],
                    //       fontSize: width * 0.03,
                    //       fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  userImage({required String imageUrl}) {
    return ClipOval(
      child: Container(
        width: 45.0,
        height: 45.0,
        color: Colors.black,
        alignment: Alignment.center,
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? NO_IMAGE_FOUND,
          fit: BoxFit.fitHeight,
          placeholder: (BuildContext context, imageUrl) {
            return Image.asset(USER_ICON);
          },
          errorWidget: (BuildContext context, imageUrl, dynamic) {
            return Image.asset(USER_ICON);
          },
        ),
      ),
    );
  }

  mainActivityList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 5),
        shrinkWrap: true,
        itemCount: list!.activities.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  userDetail(
                      isleft: true,
                      userType: list!.activities[index].owner.userType.name,
                      userName: list!.activities[index].owner.fullName),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      userImage(imageUrl: list!.activities[index].owner.image),
                      SizedBox(
                        width: 5,
                      ),
                      Stack(
                        //alignment: Alignment.centerLeft,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              alignment: Alignment.centerLeft,
                              width: width * 0.65,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list!.activities[index].updateText,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    buildHeightBox(0.005),
                                    showAttachment(
                                        attachments:
                                            list!.activities[index].attachments),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          list!.activities[index].dateOfActivity,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: width * 0.03),
                                        )),
                                  ],
                                ),
                              )),
                          Positioned(
                            top: -10,
                            right: -6,
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Center(
                                  child: Text(
                                list!.activities[index].activityRanking,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: list!.activities[index]
                                              .activityRanking ==
                                          "0"
                                      ? Colors.red
                                      : list!.activities[index]
                                                  .activityRanking ==
                                              "1"
                                          ? primaryColor
                                          : list!.activities[index]
                                                      .activityRanking ==
                                                  "2"
                                              ? Colors.green
                                              : list!.activities[index]
                                                          .activityRanking ==
                                                      "3"
                                                  ? Colors.blue
                                                  : Colors.purple),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  replyText(list!.activities[index]),
                  childActivityList(list!.activities[index].childActivities),
                  Divider()
                ],
              ),
            ),
          );
        });
  }

  childActivityList(List<ChildActivities> childActivities) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 5),
        shrinkWrap: true,
        itemCount: childActivities.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              userDetail(
                  isleft: false,
                  userType: childActivities[index].owner.userType.name,
                  userName: childActivities[index].owner.fullName),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF3F6FB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          alignment: Alignment.centerRight,
                          width: width * 0.65,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  childActivities[index].updateText,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w400),
                                ),
                                buildHeightBox(0.005),
                                showAttachment(
                                    attachments:
                                        childActivities[index].attachments),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      getFullDateString(
                                          childActivities[index].createdAt),
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w400,
                                          fontSize: width * 0.03),
                                    )),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      userImage(imageUrl: childActivities[index].owner.image),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  showAttachment({List<Attachments>? attachments}) {
    if (attachments == null) {
      return Container();
    }
    if (attachments.length <= 0) {
      return Container();
    }
    String? mimeStr = lookupMimeType(attachments[0].name);
    if(mimeStr==null){
      return;
    }
    var fileType = mimeStr.split('/');
    print('file type 2 ${fileType}');

    if (fileType[0] != 'image') {
      return InkWell(
        onTap: () {
          print('launching');
          launchURL(attachments[0].name);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(attachments[0].name,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              overflow: TextOverflow.clip),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) =>
                  ShowAttachmentImage(showImage: attachments[0].name));
        },
        child: Container(
          width: 70.0,
          height: 70.0,
          color: Colors.black,
          alignment: Alignment.center,
          child: CachedNetworkImage(
            imageUrl: attachments[0].name,
            fit: BoxFit.fitHeight,
            placeholder: (BuildContext context, imageUrl) {
              return Image.asset(USER_ICON);
            },
            errorWidget: (BuildContext context, imageUrl, dynamic) {
              return Image.asset(USER_ICON);
            },
          ),
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
      height: height * h,
    );
  }

  launchURL(String url) async {
    await launch(url);
    if (await canLaunch(url)) {
      print('Could launch');
      await launch(url);
    } else {
      print('Could not launch');
    }
  }

  LineChartData mainGraphData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey[400],
            strokeWidth: 0.8,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        // bottomTitles: SideTitles(
        //   showTitles: true,
        //   getTextStyles: (value) {
        //     return TextStyle(
        //         color: Colors.grey[500],
        //         fontWeight: FontWeight.w400,
        //         fontSize: 9);
        //   },
        //   getTitles: (value) {
        //     return list.xaxis[value.toInt()].toString().substring(0, 8) +
        //         "\n" +
        //         list.xaxis[value.toInt()].toString().substring(10);
        //   },
        //   margin: 12,
        // ),
        // leftTitles: SideTitles(
        //   showTitles: true,
        //   getTextStyles: (value) => TextStyle(
        //     color: Colors.grey[500],
        //     fontWeight: FontWeight.w400,
        //     fontSize: 15,
        //   ),
        //   getTitles: (value) {
        //     if (value.toInt() < 5) {
        //       return list.yaxis[value.toInt()].toString();
        //     } else {
        //       return '';
        //     }
        //   },
        //   reservedSize: 15,
        //   margin: 12,
        // ),
      ),
      borderData: FlBorderData(
          show: true,
          border:
              Border(bottom: BorderSide(width: 0.8, color: Colors.grey[400]!))),
      minX: 0,
      maxX: double.parse((list!.xaxis.length - 1).toString()),
      minY: 0,
      maxY: double.parse((list!.yaxis.length).toString()),
      lineBarsData: [
        LineChartBarData(
          spots: getFLSpotList(),
          isCurved: true,
          color: Colors.amber,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
        ),
      ],
    );
  }

  List<FlSpot> getFLSpotList() {
    List<FlSpot> flspotLit = [];
    for (int i = 0; i < list!.graphData.length; i++) {
      flspotLit.add(FlSpot(
          double.parse(i.toString()), double.parse(list!.graphData[i].y)));
    }
    return flspotLit;
  }

  Widget textField() {
    return Container(
      width: width * 0.83,
      decoration: new BoxDecoration(
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      //height: 40,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            validator: (val) {
              return null;
            },
            controller: messageController,
            focusNode: messageFocus,
            decoration: new InputDecoration(
              contentPadding: EdgeInsets.only(top: -10, bottom: -10, left: 15),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.red),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              border: new OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: new TextStyle(
                  color: Color(0xff85825F), fontSize: width * 0.04),
              hintText: "Add an Update",
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSendImageScreen = !isSendImageScreen;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                CHAT_GALLERY,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  replyText(Activities selectedActivity) {
    return Padding(
      padding: EdgeInsets.only(left: 55, top: 5),
      child: InkWell(
        onTap: () {
          _openReplyText(selectedActivity);
        },
        child: Text(
          'Reply',
          style: TextStyle(
              color: Colors.yellow[600],
              fontSize: width * 0.033,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _openReplyText(Activities selectedActivity) {
    showDialog(
            context: context,
            builder: (_) => ReplyDialog(selectedActivity: selectedActivity))
        .then((value) {
      getGoalDetails();
    });
  }

  getGoalDetails({bool needToScroll= false}) async {
    list = await getGoalDetail(index: widget.index);
    setState(() {
      isLoading = false;
    });
    if (needToScroll) {
      // _scrollController.animateTo(
      //   _scrollController.position.maxScrollExtent,
      //   curve: Curves.easeOut,
      //   duration: const Duration(milliseconds: 300),
      // );
    }
  }

  _sendMessage() async {
    setState(() {
      isLoadingActivity = true;
    });
    messageFocus.unfocus();
    if (selectedGoal == -1) {
      successMessage(message: "Select Goal Stage");
      return;
    }
    if (messageController.text == '') {
      successMessage(message: "Please Enter message");
      return;
    }
    bool isSuccess = await setGoalMessage(
        activityRanking: selectedGoal.toString(),
        goalMessage: messageController.text,
        goalDetail: list!.goalDetail,
        image: selectedImage);

    if (isSuccess) {
      await getGoalDetails(needToScroll: true);
      messageController.text = '';
      selectedGoal = -1;
      selectedImage = null;
      isLoadingActivity = false;
      setState(() {});
    }
    setState(() {
      isLoadingActivity = false;
    });
  }
}
