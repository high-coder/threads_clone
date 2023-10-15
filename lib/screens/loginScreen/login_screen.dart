import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/providers/theme_provider.dart';
import 'package:threads_clone/screens/home/home_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // 535 733
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of(context, listen: false);
    theme.size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
          width: double.infinity,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
              ),
              SvgPicture.asset(
                "assets/images/login_pattern.svg",
                height: 733 * theme.heightRatio,
                fit: BoxFit.cover,
                width: 535 * theme.widthRatio,
              ),
              // Expanded(child: Container()),
              SizedBox(
                height: 42 * theme.heightRatio,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeMain()),
                      (route) => false);
                },
                child: Container(
                  width: 380 * theme.widthRatio,
                  height: 88.75 * theme.heightRatio,
                  //padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8.75),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF191919),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.62, color: Color(0xFF393939)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 48,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Log in with Instagram',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                    color: Color(0xFFB2B3B2),
                                    fontSize: 15,
                                    // fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3.75),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'highcoder_',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.dmSans(
                                        color: Colors.white,
                                        fontSize: 15,
                                        // fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      width: 13.3 * theme.widthRatio,
                                      height: 13.3 * theme.widthRatio,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: SvgPicture.asset(
                                          "assets/logos/Verified.svg"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: 39,
                              height: 39,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: SvgPicture.asset(
                                  "assets/logos/instagram.svg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Spacer(),
              SizedBox(
                height: 25 * theme.heightRatio,
              ),
              Text(
                'Switch accounts',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: Color(0xFF999999),
                  fontSize: 15,
                  // fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  // height: 20,
                ),
              ),
            ],
          )),
    );
  }
}
