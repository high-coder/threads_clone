import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/providers/theme_provider.dart';

import '../../models/post_model.dart';

class SinglePost extends StatefulWidget {
  final PostModel postData;
  const SinglePost({Key? key, required this.postData}) : super(key: key);

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  double textHeight = 20;
  Future<void> calculateSizes(String text) async {
    final textStyle = TextStyle(fontSize: 16);
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      //maxLines: 2, // Set the max lines depending on your use-case
    );

    textPainter.layout();

    textHeight = textPainter.height;
    textPainter.width;
    print('Text height: $textHeight');
    print('Text width: ${textPainter.size.width}');
    //
    // final image = AssetImage('assets/images/your_image.png');
    // final configuration = ImageConfiguration();
    // final imageHeight = await _getImageHeight(image, configuration);
    // print('Image height: $imageHeight');
  }

  Future<double> _getImageHeight(
    ImageProvider provider,
    ImageConfiguration configuration,
  ) async {
    final Completer<ui.Image> completer = Completer();
    final ImageStream stream = provider.resolve(configuration);
    final listener =
        ImageStreamListener((ImageInfo image, bool synchronousCall) {
      if (!completer.isCompleted) {
        completer.complete(image.image);
      }
    });

    stream.addListener(listener);
    final image = await completer.future;
    stream.removeListener(listener);

    return image.height.toDouble();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    calculateSizes(widget.postData.title);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    // return buidExperience(context: context);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Container(
            margin: EdgeInsets.only(left: 25, bottom: 5),
            padding: const EdgeInsets.only(left: 30, bottom: 0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1.5,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            // padding: EdgeInsets.only(bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.postData.user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          //Expanded(child: Container(height: 1,color: Colors.red,)),
                          Text(
                            widget.postData.timePosted.hour.toString(),
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.699999988079071),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5 * theme.widthRatio,
                          ),
                          Icon(
                            Icons.menu,
                            size: 20,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 9 * theme.heightRatio,
                      ),
                      SizedBox(
                        width: 290 * theme.widthRatio,
                        child: Text(
                          widget.postData.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            height: 1.2,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 32 * theme.heightRatio,
                      ),
                      widget.postData.imageLink != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                widget.postData.imageLink!,
                                fit: BoxFit.contain,
                              ))
                          : Container(),
                      SizedBox(
                        height: 32 * theme.heightRatio,
                      ),

                      /// here the image can also be shown if there is one
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 15, left: 15),
                              child: GestureDetector(
                                onTap: () {
                                  widget.postData.userLiked =
                                      !widget.postData.userLiked;
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                  "assets/logos/like.svg",
                                  color: widget.postData.userLiked
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: SvgPicture.asset(
                                "assets/logos/comment.svg",
                                color: Colors.white,
                              )),
                          Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: SvgPicture.asset(
                                "assets/logos/retweet.svg",
                                color: Colors.white,
                              )),
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: SvgPicture.asset(
                                "assets/logos/share.svg",
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20 * theme.heightRatio,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          '591 replies   ${widget.postData.likes} likes',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.699999988079071),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/portfoliowebsite-cf9c3.appspot.com/o/logo.png?alt=media&token=d0422b2e-060d-45ba-bb33-036aabedf860&_gl=1*yx1skf*_ga*MjE2MjgyNzM5LjE2NzIzODM0NzM.*_ga_CW55HF8NVT*MTY5NzI3MTI2OS4yOTUuMS4xNjk3MjcxODQwLjMwLjAuMA.."),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: 43,
            height: 38,
            child: Stack(
              children: [
                Positioned(
                  left: 23,
                  top: 0,
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/portfoliowebsite-cf9c3.appspot.com/o/logo.png?alt=media&token=d0422b2e-060d-45ba-bb33-036aabedf860&_gl=1*yx1skf*_ga*MjE2MjgyNzM5LjE2NzIzODM0NzM.*_ga_CW55HF8NVT*MTY5NzI3MTI2OS4yOTUuMS4xNjk3MjcxODQwLjMwLjAuMA.."),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 10,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/portfoliowebsite-cf9c3.appspot.com/o/logo.png?alt=media&token=d0422b2e-060d-45ba-bb33-036aabedf860&_gl=1*yx1skf*_ga*MjE2MjgyNzM5LjE2NzIzODM0NzM.*_ga_CW55HF8NVT*MTY5NzI3MTI2OS4yOTUuMS4xNjk3MjcxODQwLjMwLjAuMA..",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 25,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/portfoliowebsite-cf9c3.appspot.com/o/logo.png?alt=media&token=d0422b2e-060d-45ba-bb33-036aabedf860&_gl=1*yx1skf*_ga*MjE2MjgyNzM5LjE2NzIzODM0NzM.*_ga_CW55HF8NVT*MTY5NzI3MTI2OS4yOTUuMS4xNjk3MjcxODQwLjMwLjAuMA..",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
