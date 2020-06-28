import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './cart_page.dart';
import './category_page.dart';
import './home_page.dart';
import './member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(title: Text('首页'), icon: Icon(CupertinoIcons.home)),
    BottomNavigationBarItem(
        title: Text('分类'), icon: Icon(CupertinoIcons.search)),
    BottomNavigationBarItem(
        title: Text('购物车'), icon: Icon(CupertinoIcons.shopping_cart)),
    BottomNavigationBarItem(
        title: Text('会员中心'), icon: Icon(CupertinoIcons.profile_circled)),
  ];
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    // print('设备宽度:${ScreenUtil.screenWidth}');
    // print('设备高度:${ScreenUtil.screenHeight}');
    // print('设备像素密度:${ScreenUtil.pixelRatio}');
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
