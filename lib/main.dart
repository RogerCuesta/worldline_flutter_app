import 'package:flutter/material.dart';
import 'package:worldline_flutter_app/injection_container.dart';
import 'src/app.dart';

Future<void> main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(
    const MyApp(),
  );
}
