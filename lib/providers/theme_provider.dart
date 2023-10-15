import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {

  late Size size;
  late double heightRatio = size.height / 932;
  late double widthRatio = size.width / 430;

}