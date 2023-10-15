import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import '../../providers/theme_provider.dart';
import '../profile/any_user_profile.dart';

/// in this page I can also allow the user to choose a username if needed think about this first,or should you ask the user to connect using instagram thingyyyyy
/// think about it in the meantime just create the login page

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  void _showScrollableBottomSheet(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.97,
          minChildSize: 0.5,
          maxChildSize: 0.97,
          builder: (BuildContext context, ScrollController scrollController) {
            // return DraggableScrollableSheet(
            //   initialChildSize: 0.2,
            //   minChildSize: 0.1,
            //   maxChildSize: 0.8,
            //   builder: (BuildContext context, ScrollController scrollController) {
            //     return SingleChildScrollView(
            //       controller: scrollController,
            //       child: Container(
            //         color: Colors.white,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.stretch,
            //           children: <Widget>[
            //             ListTile(title: Text('Item 1')),
            //             ListTile(title: Text('Item 2')),
            //             // Add more content here
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 50 * theme.heightRatio,
                    maxHeight: 50 * theme.heightRatio,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff262626),
                      ),
                      width: 100,
                      //margin: EdgeInsets.all(10),

                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            "New thread",
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    theme.size = MediaQuery.of(context).size;

    Widget? bottomNavigationBar;
    Widget? body;

    bottomNavigationBar = Consumer<HomeProvider>(
      builder: (context, _, __) {
        return Stack(
          children: [
            BottomNavigationBar(
              backgroundColor: Color(0xff0f0f0f),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: homeProvider.bottomNavBarData
                  .asMap()
                  .map(
                    (i, e) => MapEntry(
                      i,
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          e['iconInactive'],
                          color: Colors.grey,
                        ),
                        activeIcon: SvgPicture.asset(
                          e['iconActive'],
                          color: Colors.white,
                        ),
                        label: e['label'],
                      ),
                    ),
                  )
                  .values
                  .toList(),
              currentIndex: homeProvider.currentIndex,
              onTap: (index) {
                //dprint("this is the index of the user == $index");
                if (homeProvider.currentIndex != index) {
                  switch (index) {
                    case 0:
                      break;
                    case 1:
                      break;
                    case 2:
                      _showScrollableBottomSheet(context);
                      // print("Over here man");
                      // _isBottomSheetVisible = true;
                      // _buildScrollablePage();
                      break;
                    case 3:
                      break;
                    case 4:
                      break;
                  }
                }
                homeProvider.pageChange(index, jump: true);
              },
            ),
          ],
        );
      },
    );
    body = PageView(
      controller: homeProvider.pageController,
      onPageChanged: homeProvider.pageChange,
      // physics: const CustomPageViewScrollPhysics(),
      children: homeProvider.bottomNavBarData
          .map<Widget>((e) => e['widget'])
          .toList(),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
