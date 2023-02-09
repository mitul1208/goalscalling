import 'package:flutter/material.dart';
import 'package:flutter_searchabledropdown/apis/goalDetailsApi.dart';
import 'package:flutter_searchabledropdown/common/circleularIndicator.dart';
import 'package:flutter_searchabledropdown/constants/colorConstants.dart';
import 'package:flutter_searchabledropdown/model/goalDetailsModel.dart';
import 'package:flutter_searchabledropdown/screens/goal_details/GoalDetails.dart';
import 'package:flutter_searchabledropdown/screens/goal_details/GoalScal.dart';

class GoalDetailMain extends StatefulWidget {
  final int index;
  final String title;
  GoalDetailMain({this.index, this.title});
  @override
  _GoalDetailMainState createState() => _GoalDetailMainState();
}

class _GoalDetailMainState extends State<GoalDetailMain>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;
  GoalDetailsModel goalDetailsModel;
  bool isLoading = true;
  List<Widget> tabList = [Tab(text: "Goal Activity"), Tab(text: "Goal Scale")];

  @override
  void initState() {
    super.initState();
    getGoalDetails();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: tabList.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: primaryColor,
          titleSpacing: 0,
          centerTitle: false,
          title: widget.title == "" && goalDetailsModel != null
              ? goalDetailsModel.goalDetail.name.length > 30
                  ? Text(
                      goalDetailsModel.goalDetail.name.substring(0, 25) + "....")
                  : Text(goalDetailsModel.goalDetail.name)
              : widget.title.length > 30
                  ? Text(widget.title.substring(0, 25) + "....")
                  : Text(widget.title),

          // title: RichText(
          //   text: TextSpan(children: [
          //     TextSpan(text: widget.title
          //         //style: textTheme.headline,
          //         ),
          //     TextSpan(text: "\n"),
          //     TextSpan(
          //       text: widget.title,
          //       //style: textTheme.subtitle,
          //     )
          //   ]),
          // ),

          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            labelColor: Colors.black,
            labelStyle: TextStyle(color: Colors.white, fontSize: 14),
            tabs: tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          isLoading
              ? circularProgress()
              : GoalDetails(
                  goalDetailsModel: goalDetailsModel,
                  index: widget.index,
            title: widget.title,
                ),
          isLoading
              ? circularProgress()
              : GoalScaling(
                  scalList: goalDetailsModel.goalDetail.scales,
                ),
        ],
      ),
    );
  }

  getGoalDetails() async {
    goalDetailsModel = await getGoalDetail(index: widget.index);
    setState(() {
      isLoading = false;
    });
  }
}
