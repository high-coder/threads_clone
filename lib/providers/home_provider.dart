import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/feed/feed_page.dart';
import '../screens/profile/any_user_profile.dart';
import '../screens/search/search.dart';

class HomeProvider extends ChangeNotifier {


  int currentIndex = 0;

  String logo = "assets/logos/";
  List<Map<String, dynamic>> get bottomNavBarData {
    List<Map<String, dynamic>> list = [
      {
        'iconInactive': "${logo}home.svg",
        'iconActive': "${logo}homeSelected.svg",
        'label': "Home",
        'widget':  FeedPage(),
      },
      {
        'iconInactive': "${logo}search.svg",
        'iconActive': "${logo}search.svg",
        'label': "Search",
        'widget': SearchPage(),
      },
      {
        'iconInactive': "${logo}newThread.svg",
        'iconActive': "${logo}newThread.svg",
        'label': "Roadmap",
        'widget': Container(),
      },
      {
        'iconInactive': "${logo}like.svg",
        'iconActive': "${logo}like.svg",
        'label': "Record",
        'widget': Container(),
      },
      {
        'iconInactive': "${logo}profile.svg",
        'iconActive': "${logo}profile.svg",
        'label': "Profile",
        'widget': AnyUserProfile(),
      },

    ];

    return list;
  }
  final PageController pageController = PageController();


  void pageChange(int index, {bool jump = false}) {
    if (jump) pageController.jumpToPage(index);
    currentIndex = index;
    notifyListeners();
  }

}