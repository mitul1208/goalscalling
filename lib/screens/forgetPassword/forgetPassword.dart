import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';

class ForgetPassWord extends StatefulWidget {
  @override
  _ForgetPassWordState createState() => _ForgetPassWordState();
}

class _ForgetPassWordState extends State<ForgetPassWord> {
  InAppWebViewController _webViewController;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        titleSpacing: 0,
        title: Text("Forgot Password?"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          InAppWebView(
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            initialUrlRequest: URLRequest(url: Uri.parse("https://www.goalscaling.com/password/reset")),
            onLoadStop: (controller, url) async {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? CircularProgressIndicator() : Container()
        ],
      ),
    );
  }
}
