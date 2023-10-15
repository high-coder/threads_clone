import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/widgets/post/single_post.dart';

import '../../providers/current_state.dart';
import '../../providers/theme_provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
      // backgroundColor: Colors.white,,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SvgPicture.asset(
                "assets/logo/home_page.svg",
              ),
            ),
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
                        return SinglePost(
                          postData: currentState.posts[index],
                        );
                      },
                    ),
                  );
                },
                childCount: currentState
                    .posts.length, // Replace with the actual number of items.
              ),
            ),

            //SliverToBoxAdapter(child: Container(height: 100,width: 100,color: Colors.red,),),
          ],
        ),
      ),
    );
  }
}
