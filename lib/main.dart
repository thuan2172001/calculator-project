import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(LightCalculator());
}

class LightCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF22252D),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
