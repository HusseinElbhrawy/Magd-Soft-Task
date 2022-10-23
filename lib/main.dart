import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(MyApp());
}
