import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kib/features/screens/convert_currency_screen.dart';
import '../../features/screens/history_screen.dart';
import 'constants/route_name.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  log("Route Name:" + settings.name.toString());
  log("Route arg:" + settings.arguments.toString());

  switch (settings.name) {
    case RoutesNames.CONVERT_CURRENCY_ROUTE:
      return MaterialPageRoute(builder: (context) => ConvertCurrencyScreen());

    case RoutesNames.HISTORY_ROUTE:
      return MaterialPageRoute(builder: (context) => HistoryScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("no path for ${settings.name}"),
            ),
          ));
  }
}
