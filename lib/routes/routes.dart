import 'package:flutter/material.dart';
import 'package:student_data_app/screens/homepage.dart';

import '../screens/detailpage.dart';
import '../screens/splash.dart';

class Routes {
  static String splash = '/';
  static String homepage = 'homepage';
  static String detailpage = 'detailpage';

  static Map<String, WidgetBuilder> myroutes = {
    splash: (context) => const Splash(),
    homepage: (context) => const Homepage(),
    detailpage: (context) => const Detailpage(),
  };
}
