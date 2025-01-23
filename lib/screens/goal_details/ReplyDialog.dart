import 'dart:io';

import 'package:flutter/material.dart';

import '../../apis/goalDetailsApi.dart';
import '../../common/getImages.dart';
import '../../common/toastMessage.dart';
import '../../constants/colorConstants.dart';
import '../../model/goalDetailsModel.dart';

class ReplyDialog extends StatefulWidget {
  final Activities selectedActivity;
  ReplyDialog({required this.selectedActivity});
  @override
  _ReplyDialogState createState() => _ReplyDialogState();
}

class _ReplyDialogState extends State<ReplyDialog> {
  double height = 0;
  double width = 0;
  File? selectedImage;

  GlobalKey<FormState> _addActivityFormKey = GlobalKey<FormState>();
  bool isTextEditEnable = true;
  TextEditingController messageController = TextEditingController();
  FocusNode activityNameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: StatefulBuilder(// You need this, notice the parameters below:
            builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  spaceBetween(height: 15),
                  Text(
                    'Enter Reply Message',
                  ),
                  spaceBetween(),
                  Stack(
                    children: [
                      activityNameTextField(),
                      (!isTextEditEnable)
                          ? Center(child: CircularProgressIndicator())
                          : Container()
                    ],
                  ),
                  spaceBetween(),
                  imageSelectionRow(),
                  spaceBetween(),
                  spaceBetween(),
                  addActivityButton(),
                  spaceBetween(),
                ],
              ),
            ),
          );
        }));
  }

  showSelectedImage() {
    if (selectedImage == null) {
      return Container();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 70.0,
            height: 70.0,
            color: Colors.black,
            alignment: Alignment.center,
            child: Image.file(
              selectedImage ?? File(""),
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

  Widget activityNameTextField() {
    return Form(
      key: _addActivityFormKey,
      child: TextFormField(
        controller: messageController,
        focusNode: activityNameFocus,
        enabled: isTextEditEnable,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.name,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: "Reply Message",
          labelStyle: TextStyle(
              color: Colors.amber,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(8.0),
            ),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(8.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(8.0),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle:
              new TextStyle(color: Colors.grey[600], fontSize: width * 0.038),
          hintText: "Reply Message",
        ),
        onFieldSubmitted: (val) {
          activityNameFocus.unfocus();
        },
        validator: (value) {
          if (value == '') {
            return 'Enter Reply Message';
          }
          return null;
        },
      ),
    );
  }

  imageSelectionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        showSelectedImage(),
        buildUpload(),
        buildCapture(),
        Container()
      ],
    );
  }

  SizedBox buildWidthBox(h) {
    return SizedBox(
      width: width * h,
    );
  }

  Widget buildUpload() {
    return imageWithText(
      onTap: () async {
        selectedImage = await selectSingleImage();
        if (selectedImage != null) {
          // _sendMessage();
          successMessage(message: "Image Selected");
        }
        //setState(() {});
      },
      imagePath: Icons.image,
      text: "Upload",
    );
  }

  Widget buildCapture() {
    return imageWithText(
      onTap: () async {
        selectedImage = await captureSingleImage();
        if (selectedImage != null) {
          successMessage(message: "Image Selected");
        }
        setState(() {});
      },
      imagePath: Icons.add_a_photo,
      text: "Capture",
    );
  }

  imageWithText({required onTap, String text= "", required IconData imagePath}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            child: Icon(
              imagePath,
              size: 25,
              color: Colors.white,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              text,
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

  Widget addActivityButton() {
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
              "Save",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            onPressed: !isTextEditEnable
                ? () {}
                : () async {
                    _sendMessage();
                  }),
      ),
    );
  }

  _sendMessage() async {
    setState(() {
      isTextEditEnable = false;
    });

    if (_addActivityFormKey.currentState!.validate()) {
      bool isSuccess = await setGoalMessageReply(
          activityRanking: '',
          goalMessage: messageController.text,
          image: selectedImage,
          firstActivity: widget.selectedActivity);
      if (isSuccess) {
        setState(() {});
        Navigator.pop(context);
      }
    }

    setState(() {
      isTextEditEnable = true;
    });
  }

  Widget spaceBetween({double height = 10}) {
    return SizedBox(
      height: 10,
    );
  }
}
