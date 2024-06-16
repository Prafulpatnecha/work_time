import 'package:flutter/material.dart';

import '../home/homescreen/homepage.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
  };
}