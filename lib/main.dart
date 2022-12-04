import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/router/router.dart';
import 'package:vertical_landing_page/utils/app_scroll_behavior.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  title: en el provider
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(), // Habilita el scroll en page views para web
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
