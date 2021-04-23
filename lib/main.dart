import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(AppWidget());
}
