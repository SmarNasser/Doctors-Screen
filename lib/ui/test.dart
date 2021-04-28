import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:doctors_list_screen/constants/tabs_style.dart';
import 'package:doctors_list_screen/widgets/doctor_item.dart';
import 'package:flutter/material.dart';

class TabBarControllerWidget extends StatefulWidget {
  const TabBarControllerWidget({Key key}) : super(key: key);
  @override
  _TabBarControllerWidgetState createState() => _TabBarControllerWidgetState();
}

class _TabBarControllerWidgetState extends State<TabBarControllerWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Hi, Gloria',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[400]),
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontFamily: 'Co',
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Doctors ',
                        style: new TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      new TextSpan(
                        text: 'for you',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: AppBar(
              backgroundColor: Colors.white10,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size(100, 70),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: myTabs.length,
                      child: ButtonsTabBar(
                        height: 85,
                        buttonMargin: EdgeInsets.symmetric(horizontal: 10),
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        backgroundColor: Colors.blue[600],
                        unselectedBackgroundColor: Colors.grey[100],
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(
                            color: Colors.blue[600],
                            fontWeight: FontWeight.bold),
                        borderWidth: 1,
                        borderColor: Colors.blue[600],
                        unselectedBorderColor: Colors.grey[100],
                        radius: 10,
                        tabs: myTabs,
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                return ListView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (BuildContext context, int i) {
                    if (i.isOdd) return Divider();
                    final index = i ~/ 2 + 1;
                    return buildRow(index);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
