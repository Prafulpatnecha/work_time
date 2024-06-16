import 'package:flutter/material.dart';
import 'package:work_time/controller/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:AppRoutes.routes,
    );
  }
}
