import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/providers/current_state.dart';
import 'package:threads_clone/providers/theme_provider.dart';

import '../../models/friends_model.dart';


class SingleUser extends StatelessWidget {

  final FriendsModel friendsModel;
  final int localIndex;

  const SingleUser({Key? key,required this.friendsModel,required this.localIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context,listen:false);
    CurrentState currentState = Provider.of<CurrentState>(context,listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blueAccent),
            ),
            SizedBox(
              width: 9 * theme.widthRatio,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(friendsModel.userName),
                SizedBox(
                  height: 3 * theme.heightRatio,
                ),
                Text(
                  friendsModel.name,
                  style: GoogleFonts.openSans(color: Colors.grey),
                ),
                SizedBox(
                  height: 10 * theme.heightRatio,
                ),
                Text("${friendsModel.followers} followers",style: GoogleFonts.inter(fontWeight: FontWeight.w400),),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                currentState.followUserOrUnFollow(localIndex, friendsModel.following);
              },
              child: Column(
                children: [
                  friendsModel.following == false? Container(
                    margin: EdgeInsets.only(top: 5 * theme.heightRatio),
                    width: theme.widthRatio * 106,
                    height: theme.heightRatio * 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: Colors.grey.withOpacity(0.5))),
                    child: Center(child: Text("Follow")),
                  ):Container(
                    margin: EdgeInsets.only(top: 5 * theme.heightRatio),
                    width: theme.widthRatio * 106,
                    height: theme.heightRatio * 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: Colors.grey.withOpacity(0.3))),
                    child: Center(child: Text("Following",style: GoogleFonts.inter(color: Colors.grey.withOpacity(0.3)),)),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 10),
          height: 1,
          width: theme.size.width,
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    );
  }
}
