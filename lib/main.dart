import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/login_page.dart';
import 'providers/login_provider.dart';
import 'providers/temperature_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => TemperatureProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyLoginPage(),
      ),
    );
  }
}
