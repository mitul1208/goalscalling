import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/loginApi.dart';
import 'package:flutter_searchabledropdown/common/circleularIndicator.dart';
import 'package:flutter_searchabledropdown/common/toastMessage.dart';
import 'package:flutter_searchabledropdown/constants/SharedPrefs.dart';
import 'package:flutter_searchabledropdown/constants/imageConstants.dart';
import 'package:flutter_searchabledropdown/screens/forgetPassword/forgetPassword.dart';

import 'package:flutter_searchabledropdown/screens/homePage/GoalsList.dart';
import 'package:flutter_searchabledropdown/screens/providerScreen/participant_page.dart';
import 'package:flutter_searchabledropdown/screens/providerScreen/provider_page.dart';

import '../../main.dart';
import '../notificationScreen/NotificationScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double height = 0;
  double width = 0;
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(BACKGROUNDIMAGE), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: Column(
                    children: [
                      buildSizedBoxWithHeight1(0.065),
                      buildLogo(),
                      buildSizedBoxWithHeight1(0.02),
                      Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.amber, fontSize: width * 0.045),
                      ),
                      buildSizedBoxWithHeight1(0.01),
                      Text(
                        "Please enter your details to login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w400),
                      ),
                      buildSizedBoxWithHeight1(0.03),
                      emailTextField(),
                      buildSizedBoxWithHeight1(0.02),
                      passwordTextField(),
                      buildSizedBoxWithHeight1(0.02),
                      // Text("FORGET PASSWORD?",style: TextStyle(color: Colors.amber,fontSize: width*0.03),),
                      buildSizedBoxWithHeight1(0.01),
                      buildSignInButton(),
                      buildSizedBoxWithHeight1(0.02),
                      // Text("Don't have an account?",style: TextStyle(color: Colors.black,fontSize: width*0.035),),
                      // buildSizedBoxWithHeight1(0.003),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgetPassWord()),
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            style:
                                TextStyle(color: Colors.amber, fontSize: width * 0.035),
                          )),
                      Container(
                        //color: Colors.black,
                        child: Image.asset(
                          LOGIN_LOGO,
                          height: height * 0.29,
                          width: width * 0.55,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isLoading ? circularProgress() : Container()
            ],
          ),
        ),
      ),
    );
  }

  Container buildSignInButton() {
    return Container(
      height: height * 0.055,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber
          ),
            child: Text(
              "SIGN IN",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            onPressed: isLoading
                ? () {}
                : () async {
                    loginMethod();
                  }),
      ),
    );
  }

  Widget emailTextField() {
    return Container(
      height: 45,
      child: TextFormField(
        controller: emailController,
        focusNode: emailFocus,
        decoration: new InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(
              color: Colors.amber, fontSize: width * 0.035, fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.only(top: -10, bottom: -10, left: 15),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: new TextStyle(color: Colors.grey[600], fontSize: width * 0.038),
          hintText: "Enter Email",
        ),
        onFieldSubmitted: (val) {
          emailFocus.unfocus();
          FocusScope.of(context).requestFocus(passwordFocus);
        },
      ),
    );
  }

  Widget passwordTextField() {
    return Container(
      height: 45,
      child: TextFormField(
        controller: passwordController,
        focusNode: passwordFocus,
        onFieldSubmitted: (val) {
          passwordFocus.unfocus();
          emailFocus.unfocus();
        },
        obscureText: true,
        decoration: new InputDecoration(
            labelText: "password",
            hintText: "Enter Password",
            labelStyle: TextStyle(
                color: Colors.amber,
                fontSize: width * 0.035,
                fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.only(top: 20, bottom: -10, left: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            border: new OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }

  SizedBox buildSizedBoxWithHeight1(h) {
    return SizedBox(
      height: height * h,
    );
  }

  Center buildLogo() {
    return Center(
      child: Image.asset(
        TEMP_LOGO,
        height: height * 0.21,
        width: width * .45,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  loginMethod() async {
    if (emailController.text.isEmpty) {
      errorMessage("please enter email address");
    } else if (passwordController.text.isEmpty) {
      errorMessage(
        "please enter email password",
      );
    } else {
      setState(() {
        isLoading = true;
      });
      var temp =
          await loginApi(email: emailController.text, password: passwordController.text);
      setState(() {
        isLoading = false;
      });
      if (temp != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            if ((MyApp.toNotification == 1)) {
              MyApp.toNotification = 0;
              return NotificationScreen();
            } else {
              // log(temp.id);
              // log(temp.userTypeId);
              if (temp.userTypeId == "4") {
                saveString(key: "user", value: "participant");
                log(" ->>>>>>>>>>>>>>>>>>>>>>>>>>> participant");
                return GoalsList();
              } else if (temp.userTypeId == "3") {
                saveString(key: "user", value: "provider");
                log(" ->>>>>>>>>>>>>>>>>>>>>>>>>>> provider");

                return MyParticipants();
              } else if (temp.userTypeId == "2") {
                saveString(key: "user", value: "supervisor");
                log(" ->>>>>>>>>>>>>>>>>>>>>>>>>>> supervisor");

                return MyProvider();
              } else {
                saveString(key: "user", value: "participant");

                log(" ->>>>>>>>>>>>>>>>>>>>>>>>>>> participant");

                return GoalsList();
              }
            }
          }),
        );
      }
    }
  }
}
