import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/providers/home_provider.dart';
import 'package:threads_clone/providers/theme_provider.dart';
import 'package:threads_clone/screens/loginScreen/login_screen.dart';

import 'providers/auth_provider.dart';
import 'providers/current_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => CurrentState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Color(0xff0f0f0f),
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
