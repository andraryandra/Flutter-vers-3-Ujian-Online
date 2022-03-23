import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/Services/auth_services.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/rounded_button.dart';
import 'package:flutter_first/screens/home_screen.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           elevation: 0,
//           title: const Text(
//             'Login',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your email',
//                 ),
//                 onChanged: (value) {
//                   _email = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your password',
//                 ),
//                 onChanged: (value) {
//                   _password = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               RoundedButton(
//                 btnText: 'LOG IN',
//                 onBtnPreseed: () => loginPressed(),
//               )
//             ],
//           ),
//         ));
//   }
// }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: [
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            child: Image.asset(
              "assets/logo/login.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Silahkan login dengan NIM dan Password ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "NIM:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.phone,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your Nim",
            ),
            onChanged: (value) {
              _email = value;
            },
          ),
          SizedBox(height: 25),
          Text(
            "Password:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your Password Nim",
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          SizedBox(height: 30),
          RoundedButton(
            btnText: 'LOG IN',
            onBtnPreseed: () => loginPressed(),
          ),
          Center(
            child: Text(
              "@Elearning-Kelompok 5",
              style: TextStyle(
                color: Color.fromARGB(200, 197, 197, 197),
                fontSize: 18,
                fontStyle: FontStyle.italic,
                height: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
