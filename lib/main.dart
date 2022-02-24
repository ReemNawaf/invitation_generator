import 'package:flutter/material.dart';
import 'package:invitation_generator/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Invitation Generator',
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
