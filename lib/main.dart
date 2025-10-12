import 'package:evently_app_6pm/common/theme/app_theme.dart';
import 'package:evently_app_6pm/firebase_options.dart';
import 'package:evently_app_6pm/l10n/app_localizations.dart';
import 'package:evently_app_6pm/providers/settings_provider.dart';
import 'package:evently_app_6pm/providers/user_provider.dart';
import 'package:evently_app_6pm/screens/auth/login_screen.dart';
import 'package:evently_app_6pm/screens/auth/sign_up_screen.dart';
import 'package:evently_app_6pm/screens/home/main_layer_screen.dart';
import 'package:evently_app_6pm/screens/new_event/new_event_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        MainLayerScreen.routeName: (_) => MainLayerScreen(),
        NewEventScreen.routeName: (_) => NewEventScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<SettingsProvider>(context).local),
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<SettingsProvider>(context).appTheme,
      initialRoute: FirebaseAuth.instance.currentUser?.uid == null
          ? LoginScreen.routeName
          : MainLayerScreen.routeName,
    );
  }
}
