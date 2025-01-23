import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

authQuestionDialog(BuildContext context, LocalAuthentication auth) {
  // set up the buttons
  Widget cancelButton = MaterialButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: Colors.green),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = MaterialButton(
    child: Text(
      "Continue",
      style: TextStyle(color: Colors.green),
    ),
    onPressed: () async {
      Navigator.pop(context);
      _authenticate(auth, context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Do you want to enable login with fingerprint or face ID?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> _authenticate(auth, context) async {
  bool authenticated = false;
  try {
    authenticated = await auth.authenticate(
      localizedReason: 'Authenticating',
      useErrorDialogs: true,
      stickyAuth: true,
    );
    if (authenticated) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool("showAuth", true);
      Fluttertoast.showToast(
        msg: "one Step login is enabled",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    } else {
      Navigator.pop(context);
    }
  } on PlatformException {} finally {}
}
