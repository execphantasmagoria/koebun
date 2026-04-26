import 'package:koebun/pages/folder.dart';
import 'package:koebun/pages/settings.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String settings = '/settings';
  static const String folder = '/folder';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case Routes.folder:
        return MaterialPageRoute(builder: (_) => FolderPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}