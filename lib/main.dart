import 'package:ahmad/chat/chatBinding.dart';
import 'package:ahmad/chat/chatView.dart';
import 'package:ahmad/dialog/dialogView.dart';
import 'package:ahmad/utils/translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'dialog/dialogBinding.dart';

void main() {
  runApp(
      GetMaterialApp(
        title: 'Ahmad Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,primaryColor: Colors.grey,accentColor: Colors.grey
        ),
        initialRoute: "/",
        initialBinding: DialogBinding(),
        debugShowCheckedModeBanner: false,
        translations: MyTranslations(),
        locale: const Locale('en_US'),
        fallbackLocale: const Locale('en_US'),
        getPages: [
          GetPage(name: "/", page: ()=>Main()),
          GetPage(name: "/dialogs", page: ()=>DialogView() , binding: DialogBinding()),
          GetPage(name: "/chat", page: ()=>ChatView() , binding: ChatBinding())
        ],
      )
  );
}


class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  late final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top.toDouble();
    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.fromLTRB(0, height, 0, 0),
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle:
          NavBarStyle.style6,
        ),
      )
    );
  }
}

List<Widget> _buildScreens() {
  return [
    DialogView(),
    DialogView(),
    DialogView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.chat),
      title: ('dialogs'.tr),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.group_work),
      title: ('channels'.tr),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_pin_rounded),
      title: ('profile'.tr),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}