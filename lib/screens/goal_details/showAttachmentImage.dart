import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../constants/imageConstants.dart';

class ShowAttachmentImage extends StatefulWidget {
  final String showImage;
  ShowAttachmentImage({required this.showImage});
  @override
  _ShowAttachmentImageState createState() => _ShowAttachmentImageState();
}

class _ShowAttachmentImageState extends State<ShowAttachmentImage> {
  bool isLoading = false;
  String? imageURl;
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    // TODOs: implement initState
    super.initState();
    imageURl = widget.showImage;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: 
          ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
                minHeight: MediaQuery.of(context).size.height * 0.2,
                minWidth: MediaQuery.of(context).size.width * 0.2,
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: CachedNetworkImage(
                imageUrl: imageURl ?? "",
                fit: BoxFit.contain,
                // width: double.infinity,
                placeholder: (BuildContext context, imageUrl) {
                  return Image.asset(USER_ICON);
                },
                errorWidget: (BuildContext context, imageUrl, dynamic) {
                  return Image.asset(USER_ICON);
                },
              )),
      

    );
  }
}
