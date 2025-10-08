import 'package:evently_app_6pm/common/theme/app_theme.dart';
import 'package:evently_app_6pm/firebase_options.dart';
import 'package:evently_app_6pm/screens/auth/login_screen.dart';
import 'package:evently_app_6pm/screens/auth/sign_up_screen.dart';
import 'package:evently_app_6pm/screens/home/main_layer_screen.dart';
import 'package:evently_app_6pm/screens/new_event/new_event_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: FirebaseAuth.instance.currentUser?.uid == null
          ? LoginScreen.routeName
          : MainLayerScreen.routeName,
    );
  }
}
