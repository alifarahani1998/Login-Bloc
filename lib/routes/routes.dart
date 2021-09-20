import 'package:flutter/material.dart';
import 'package:login_bloc/views/screens/secon_screen.dart';
import 'package:login_bloc/views/screens/third_screen.dart';

import '../views/screens/home_screen.dart';
import '../views/screens/home_screen.dart';


class AppRouter {

  Route onGenerateRote(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;

      case '/second_screen':
        return MaterialPageRoute(builder: (_) => SecondScreen());
        break;

      case '/third_screen':
        return MaterialPageRoute(builder: (_) => ThirdScreen());
        break;

      default:
        debugPrint('this is null page');
        return null;
    }
  }
}
