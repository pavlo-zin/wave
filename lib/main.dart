import 'package:flutter/material.dart';
import 'package:wave/business_logic/service_locator.dart';

import 'ui//quote_screen.dart';

void main() {
  setupServiceLocator();
  runApp(WaveApp());
}

class WaveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuoteScreen(),
    );
  }
}
