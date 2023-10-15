import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  late BuildContext _context;

  figureOutNavigation(BuildContext context) {
    _context = context;
  }


}