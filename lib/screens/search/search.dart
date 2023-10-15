import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/providers/theme_provider.dart';

import '../../providers/current_state.dart';
import '../../widgets/search/user_follow.dart';
import '../profile/any_user_profile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 12, bottom: 5),
              child: Text(
                "Search",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          // place holder for the search bar

          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 50 * theme.heightRatio,
              maxHeight: 50 * theme.heightRatio,
              child: Container(
                //padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff262626),
                ),
                width: 100,
                //margin: EdgeInsets.all(10),

                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        //prefix: Icon(Icons.search,color: Colors.white,),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search",
                        contentPadding: EdgeInsets.only(top: 9)),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          // the follow widget of each follower
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: EdgeInsets.only(
          //         left: 16 * theme.widthRatio, right: 16 * theme.widthRatio),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Container(
          //               width: 50,
          //               height: 50,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(100),
          //                   color: Colors.red),
          //             ),
          //             SizedBox(
          //               width: 9 * theme.widthRatio,
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("highcoder_"),
          //                 SizedBox(
          //                   height: 3 * theme.heightRatio,
          //                 ),
          //                 Text(
          //                   "Deepak Mittal",
          //                   style: GoogleFonts.openSans(color: Colors.grey),
          //                 ),
          //                 SizedBox(
          //                   height: 10 * theme.heightRatio,
          //                 ),
          //                 Text("17 followers"),
          //               ],
          //             ),
          //             Spacer(),
          //             Column(
          //               children: [
          //                 Container(
          //                   margin: EdgeInsets.only(top: 5 * theme.heightRatio),
          //                   width: theme.widthRatio * 106,
          //                   height: theme.heightRatio * 32,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(8),
          //                       border: Border.all(
          //                           width: 1,
          //                           color: Colors.grey.withOpacity(0.5))),
          //                   child: Center(child: Text("Follow")),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         Container(
          //           alignment: Alignment.topRight,
          //           margin: EdgeInsets.only(top: 10),
          //           height: 1,
          //           width: theme.size.width - 50,
          //           color: Colors.grey.withOpacity(0.5),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(
                      left: 16 * theme.widthRatio,
                      right: 16 * theme.widthRatio),
                  child: Consumer<CurrentState>(
                    builder: (context, _, __) {
                      return SingleUser(
                        friendsModel: currentState.sampleFriends[index],
                        localIndex: index,
                      );
                    },
                  ),
                );
              },
              childCount: currentState.sampleFriends
                  .length, // Replace with the actual number of items.
            ),
          ),

          // SliverList(delegate: delegate)
        ],
      ),
    ));
  }
}
