import 'package:flutter/material.dart';
import 'package:vertical_landing_page/router/router.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
