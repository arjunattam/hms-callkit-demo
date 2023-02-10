import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hms_callkit/Utilities.dart';
import 'package:hms_callkit/app_navigation/app_router.dart';
import 'package:hms_callkit/home_page.dart';
import 'package:hms_callkit/app_navigation/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override 
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  @override
  void initState() {
    super.initState();
    initFirebase();
    //Checks call when open app from terminated
    checkAndNavigationCallingPage("main.dart");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HMS-Callkit Demo",
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.homePage,
      navigatorKey: NavigationService.instance.navigationKey,
      navigatorObservers: <NavigatorObserver>[
        NavigationService.instance.routeObserver
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
