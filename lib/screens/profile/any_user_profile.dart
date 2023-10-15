import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/current_state.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/post/single_post.dart';

class AnyUserProfile extends StatelessWidget {
  const AnyUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of(context, listen: false);
    theme.size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// this is the top appbar of any user profile page thingyyy
          SliverAppBar(
            backgroundColor: Color(0xff0f0f0f),
            pinned: true,
            leading: Row(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    onPressed: () {},
                  ),
                ),
                // Text("Back",style: GoogleFonts.dmSans(color:Colors.white
                //),)
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/logos/morecircle.svg",
                  color: Colors.white,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 18 * theme.widthRatio, right: 18 * theme.widthRatio),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deepak Mittal',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              // fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'highcoder',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: theme.widthRatio * 12,
                              ),
                              Container(
                                width: 77,
                                height: 27.22,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'theads.net',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 84 * theme.heightRatio,
                        height: 84 * theme.heightRatio,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/portfoliowebsite-cf9c3.appspot.com/o/logo.png?alt=media&token=d0422b2e-060d-45ba-bb33-036aabedf860&_gl=1*yx1skf*_ga*MjE2MjgyNzM5LjE2NzIzODM0NzM.*_ga_CW55HF8NVT*MTY5NzI3MTI2OS4yOTUuMS4xNjk3MjcxODQwLjMwLjAuMA.."),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(300),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Bio of the user can be displayed here
                  SizedBox(
                    height: 20 * theme.heightRatio,
                  ),
                  Container(
                    width: double.infinity,
                    height: 35 * theme.heightRatio,
                    //padding: const EdgeInsets.only(top: 10, bottom: 11),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Follow',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          // fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * theme.heightRatio,
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 40 * theme.heightRatio,
              maxHeight: 40 * theme.heightRatio,
              child: Container(
                  color: Colors.black,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              'Threads',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 15,
                                // fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: double.infinity,
                              color: Colors.white,
                              height: 1,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              'Replies',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 15,
                                // fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: double.infinity,
                              color: Colors.grey.withOpacity(0.6),
                              height: 1,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),

          /// Threads or the replies section

          /// Threads Widget first
          SliverToBoxAdapter(
            child: SinglePost(postData: currentState.posts[0]),
          )
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  Widget? newChild;
  bool? listen = false;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    this.newChild,
    this.listen,
  });

  final double minHeight;
  double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //if(shrinkOffset)/
    // print("===============");
    // print(shrinkOffset);
    // print("===============");

    //print(shrinkOffset.);
    //if()

    if (listen == false) {
      return LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxWidth);
        print("===============");
        print(constraints.maxHeight);

        if (constraints.maxHeight > 150) {
          return SizedBox.expand(child: child);
        } else {
          //maxHeight = 60;
          return SizedBox.expand(child: newChild);
        }
      });
    } else {
      return SizedBox.expand(child: child);
    }

    // return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
