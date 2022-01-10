import 'package:flutter/material.dart';
import 'package:udemy/presentation/splash/splash_screen.dart';
import 'package:udemy/res/themes.dart';

import '../routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        initialRoute: Routes.splash,
        onGenerateRoute: RoutesGenerator.getRoute,
        home: const SplashScreen(),
      );
}
