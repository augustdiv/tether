import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tether/global/global.dart';
import 'package:tether/welcome_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("23fcaf2a-e130-4bdf-adba-b68a69ab8b8c");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    //print("Accepted permission: $accepted");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: WelcomeScreen(),
    );
  }
}
