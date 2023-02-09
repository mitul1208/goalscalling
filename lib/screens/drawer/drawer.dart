import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/common/circleularIndicator.dart';
import 'package:flutter_searchabledropdown/common/getDataFromShared.dart';
import 'package:flutter_searchabledropdown/constants/SharedPrefs.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/constants/imageConstants.dart';
import 'package:flutter_searchabledropdown/screens/loginScreen/loginscreen.dart';
import 'package:flutter_searchabledropdown/screens/notificationScreen/NotificationScreen.dart';
import 'package:flutter_searchabledropdown/screens/profileScreen/profileScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  double height;
  double width;
  bool isLoading = false;
  String name, email, image;
  bool isValidUser = false;
  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchUserType();
  }

  fetchUserType() async {
    String user = await getString(key: "user");
    if (user == "participant") {
      setState(() {
        isValidUser = true;
      });
    } else {
      setState(() {
        isValidUser = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Drawer(
          child: Column(
            // Important: Remove any padding from the ListView.
            // padding: EdgeInsets.zero,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  ).then((value){
                    fetchUserData();
                  });
                },
                child: Container(
                  height: height * 0.23,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Container(
                          alignment: Alignment.center,
                          width: 70.0,
                          height: 70.0,
                          decoration: new BoxDecoration(
                            color: primaryColor,
                            image: new DecorationImage(
                              image: new NetworkImage(image ?? NO_IMAGE_FOUND),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(50.0)),
                            border: new Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.025,
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.53,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width / 2,
                                  child: Text(
                                    name ?? "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.055,
                                    ),
                                    // softWrap: true,
                                    // maxLines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                buildHeight(0.001),
                                Container(
                                  width: width / 2,
                                  child: Text(
                                    email ?? "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.037),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Home,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.045),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
              isValidUser
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 12, bottom: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              GOAL,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Goals",
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.045),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              isValidUser
                  ? Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                    )
                  : Container(),
              isValidUser
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 12, bottom: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              NOTIFICATION,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Notifications",
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.045),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              isValidUser
                  ? Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                    )
                  : Container(),
              InkWell(
                onTap: () async {
                  // setState(() {
                  //   isLoading = true;
                  // });
                  // bool temp = await logoutApi();
                  // setState(() {
                  //   isLoading = false;
                  // });
                  // if(temp){

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()),
                      ModalRoute.withName('/'));
                  //  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        LOGOUT,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.045),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text(
                'App Version : 2.0.6',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        isLoading ? circularProgress() : Container()
      ],
    );
  }

  SizedBox buildHeight(h) {
    return SizedBox(
      height: height * h,
    );
  }

  fetchUserData() async {
    name = await getName();
    email = await getEmail();
    image = await getImage();
    setState(() {});
  }
}
