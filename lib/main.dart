import 'package:flutter/material.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/features/main_page.dart';



void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.theme,
      routes: {MainPage.routeName: (context) => const MainPage()},
      initialRoute: MainPage.routeName,

    );
  }
}