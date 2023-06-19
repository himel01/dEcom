import 'package:flutter/material.dart';

class RouteService {
  static navigateScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
