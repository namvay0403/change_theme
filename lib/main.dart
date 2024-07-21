import 'package:change_theme/src/night_widget.dart';
import 'package:change_theme/src/sun_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Wrap(
          children: [
            SizedBox(
              height: 200,
              child: SunWidget(),
            ),
            SizedBox(
              height: 200,
              child: NightWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
