import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/getProfileApi.dart';
import 'package:flutter_searchabledropdown/common/circleularIndicator.dart';
import 'package:flutter_searchabledropdown/common/getImages.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/constants/imageConstants.dart';
import 'package:flutter_searchabledropdown/model/userModel.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double height = 0;
  double width = 0;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  String? displayName, displayEmail;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  User? data;
  File? selectedImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildHeight(0.04),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          new Container(
                            alignment: Alignment.center,
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              image: DecorationImage(
                                image: data == null
                                    ? AssetImage(USER_ICON) as ImageProvider<Object>
                                    : NetworkImage(data!.image) as ImageProvider<Object>,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: primaryColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: _selectImage,
                              child: Image.asset(
                                ADD_ICON,
                                height: 20,
                                width: 20,
                              ))
                        ],
                      ),
                      buildHeight(0.005),
                      Text(
                        displayName ?? "",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.045),
                      ),
                      buildHeight(0.001),
                      Text(
                        displayEmail ?? "",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.037),
                      ),
                      buildHeight(0.03),
                      fullNameTextField(),
                      buildHeight(0.03),
                      lastNameTextField(),
                      buildHeight(0.02),
                      emailTextField(),
                      buildHeight(0.02),
                      phoneTextField(),
                      buildHeight(0.06),
                      buildSignInButton()
                    ],
                  ),
                ),
              ),
            ),
            isLoading ? circularProgress() : Container()
          ],
        ),
      ),
    );
  }

  SizedBox buildHeight(h) {
    return SizedBox(
      height: height * h,
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
              "SUBMIT",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              if (_formKey.currentState!.validate()) {
                bool isSuccess = await updateUserData(
                    first_name: fullNameController.text,
                    last_name: lastNameController.text,
                    email: emailController.text,
                    phone: telephoneController.text);
                if (isSuccess) {
                  data = await profileApi();
                  getProfileData();
                }
                setState(() {
                  isLoading = false;
                });
              }
            }),
      ),
    );
  }

  Widget fullNameTextField() {
    return Container(
      // height: 50,
      child: TextFormField(
        controller: fullNameController,
        validator: (val) {
          if (val==null || val.isEmpty) {
            return "required";
          } else {
            return null;
          }
        },
        decoration: new InputDecoration(
          labelText: "First Name",
          labelStyle: TextStyle(
              color: Colors.amber,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.only(top: -10, bottom: -10, left: 15),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.red),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
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
          hintStyle:
              new TextStyle(color: Colors.grey[600], fontSize: width * 0.038),
          hintText: "Enter First Name",
        ),
      ),
    );
  }

  Widget lastNameTextField() {
    return Container(
      // height: 50,
      child: TextFormField(
        controller: lastNameController,
        validator: (val) {
          if (val==null || val.isEmpty) {
            return "required";
          } else {
            return null;
          }
        },
        decoration: new InputDecoration(
          labelText: "Last Name",
          labelStyle: TextStyle(
              color: Colors.amber,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.only(top: -10, bottom: -10, left: 15),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.red),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
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
          hintStyle:
              new TextStyle(color: Colors.grey[600], fontSize: width * 0.038),
          hintText: "Enter Last Name",
        ),
      ),
    );
  }

  Widget emailTextField() {
    return Container(
      //height: 40,
      child: TextFormField(
        controller: emailController,
        validator: (val) {
          if (val==null || val.isEmpty) {
            return "required";
          } else {
            return null;
          }
        },
        decoration: new InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(
              color: Colors.amber,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.only(top: -10, bottom: -10, left: 15),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.red),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
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
          hintStyle:
              new TextStyle(color: Colors.grey[600], fontSize: width * 0.038),
          hintText: "Enter Email",
        ),
      ),
    );
  }

  Widget phoneTextField() {
    return Container(
      //height: 40,
      child: TextFormField(
        controller: telephoneController,
        validator: (val) {
          if (val==null || val.isEmpty) {
            return "required";
          } else {
            return null;
          }
        },
        decoration: new InputDecoration(
          labelText: "Telephone",
          labelStyle: TextStyle(
              color: Colors.amber,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.only(top: -10, bottom: -10, left: 15),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.red),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
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
          hintStyle:
              new TextStyle(color: Colors.grey[600], fontSize: width * 0.038),
          hintText: "Enter Number",
        ),
      ),
    );
  }

  getProfileData() async {
    data = await profileApi();
    if (data != null) {
      fullNameController.text = data!.firstName;
      emailController.text = data!.email;
      telephoneController.text = data!.phone;
      displayEmail = emailController.text;
      lastNameController.text = data!.lastName;
      displayName = fullNameController.text + " " + lastNameController.text;
      print(data!.image);
    }
    setState(() {
      isLoading = false;
    });
  }

  _selectImage() async {
    File? profileImage = await selectSingleImage();
    if(profileImage==null){
      return;
    }
    selectedImage = profileImage;
    setState(() {
      isLoading = true;
    });
    bool isSucess = await uploadProfileImage(
        image: profileImage,
        first_name: data!.firstName,
        last_name: data!.lastName,
        email: data!.email,
        phone: data!.phone);

    if (isSucess) {
      //data = await profileApi();
      await getProfileData();
    }

    setState(() {
      isLoading = false;
    });
  }
}
