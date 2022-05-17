import 'package:flutter/material.dart';
import 'package:flutter_first/screens/intro/tampilan_awal.dart';

import 'package:flutter_first/screens/intro/splashscreen_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    home: SplashScreenPage(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: RegisterScreen(),
//       // home: TampilanScreen(),
//       home: SplashScreenPage(),
//     );
//   }
// }
