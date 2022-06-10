import 'package:flutter/material.dart';

import 'package:product_app/screens/screens.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        '': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
      },
    );
  }
}