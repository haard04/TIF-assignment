import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tif/Home.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(
    ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer (builder: (context, orientation, deviceType) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Colors.white
        
      ),
      home: const Home(),
    );
  });
  }
}
