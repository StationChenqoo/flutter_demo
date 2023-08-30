import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/community/index.dart';
import 'package:flutter_demo/screens/demo.dart';
import 'package:flutter_demo/screens/home/index.dart';
import 'package:flutter_demo/screens/my.dart';
import 'package:flutter_demo/screens/serieses/index.dart';
import 'package:flutter_demo/weights/my-drawer.dart';

class AppPage extends StatefulWidget {
  AppPage({super.key});
  @override
  State<StatefulWidget> createState() => AppState();
}

class MyTab extends StatelessWidget {
  final IconData icon;
  final String label;

  MyTab({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Tab(
      icon: Row(
        children: [
          Icon(
            this.icon,
            size: 20,
          ),
          SizedBox(width: 5),
          Text(this.label, style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}

class AppState extends State<AppPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: TabBarView(children: [
        //   HomePage(),
        //   SeriesesPage(),
        //   CommunityPage(),
        //   HomePage(),
        // ])
        drawer: MyDrawerWidget(),
        body: IndexedStack(
          index: index,
          children: [
            HomePage(),
            SeriesesPage(),
            CommunityPage(),
            DemoPage(),
            MyPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _items(),
          // selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: index,
          enableFeedback: false,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 16,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ));
  }

  List<BottomNavigationBarItem> _items() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.public),
        label: '首页',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.devices_fold),
        label: '发现',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.interests),
        label: '社区',
      ),
      // const BottomNavigationBarItem(
      //   icon: Icon(Icons.cloud_sync),
      //   label: '同步',
      // ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.fingerprint),
        label: '我的',
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}