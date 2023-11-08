import 'package:bombaysign/Consent_Forms/Skin_Care/piercing_con.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static var redColor = Color(0xFFAA0315);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bombay SignIn',
      theme: ThemeData(
        primaryColor: redColor,
      ),
      home: PiercingConsent(),
    );
  }
}
