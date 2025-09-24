import 'package:evently_app_6pm/common/theme/app_theme.dart';
import 'package:evently_app_6pm/screens/auth/login_screen.dart';
import 'package:evently_app_6pm/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
      },
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,

      initialRoute: LoginScreen.routeName,
    );
  }
}
