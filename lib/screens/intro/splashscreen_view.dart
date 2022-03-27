import 'package:flutter/material.dart';
import 'package:flutter_first/screens/intro/tampilan_awal.dart';
import 'dart:async';
import 'package:flutter_first/screens/intro/tampilan_awal.dart';
import 'package:flutter_first/screens/login_guru_screen.dart';
import 'package:flutter_first/screens/register_screen.dart';
import 'dart:ui';

import 'package:drop_shadow_image/drop_shadow_image.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return TampilanScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 99, 173),
      body: Center(
        child: DropShadowImage(
          offset: Offset(10, 10),
          scale: 3,
          blurRadius: 10,
          borderRadius: 50,
          image: Image.asset(
            'assets/logo/logo-smp.png',
            width: 300,
          ),
        ),
      ),
    );
  }
}
