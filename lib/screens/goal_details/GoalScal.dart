import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/model/goalDetailsModel.dart';

class GoalScaling extends StatefulWidget {
  final List<Scales> scalList;
  GoalScaling({required this.scalList});
  @override
  _GoalScalingState createState() => _GoalScalingState();
}

class _GoalScalingState extends State<GoalScaling> {
  List<Scales> scalLists = [];
  List<String> itemList = [
    "4th scale",
    "3rd scale",
    "2nd scale",
    "1st scale",
    "0th scale"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scalLists = widget.scalList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: scalLists.length,
          itemBuilder: (BuildContext context, int index) {
            return _goalCard(
                index: scalLists[index].value,
                text: scalLists[index].description);
          }),
    );
  }

  _goalCard({required String index,required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            children: [
              buildWidthBox(0.05),
              Container(
                width: 35,
                height: 35,
                child: Center(
                    child: Text(
                  index.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.5), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  color: primaryColor,
                ),
              ),
              buildWidthBox(0.05),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  text,
                  textScaleFactor: 1.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildWidthBox(h) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * h,
    );
  }
}
