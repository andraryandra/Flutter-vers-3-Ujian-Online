import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/Services/auth_services.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/rounded_button.dart';
import 'package:flutter_first/screens/home_guru_screen.dart';
import 'package:flutter_first/screens/home_siswa_screen.dart';
import 'package:http/http.dart' as http;

import 'home_siswa_screen.dart';

class LoginGuruScreen extends StatefulWidget {
  static var routeName;

  const LoginGuruScreen({Key? key}) : super(key: key);

  @override
  _LoginGuruScreenState createState() => _LoginGuruScreenState();
}

class _LoginGuruScreenState extends State<LoginGuruScreen> {
  String _role = 'guru';
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_role.isNotEmpty == _email.isNotEmpty && _password.isNotEmpty) {
      http.Response response =
          // Harus diubah dengan sama pada auth_services.dart
          await AuthServices.loginGuru(_role, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (_role == "guru") {
        if (response.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const HomeGuruScreen(),
              ));
        } else {
          errorSnackBar(context, responseMap.values.first);
        }
      }
    }
    if (_role.isNotEmpty == _email.isNotEmpty && _password.isNotEmpty) {
      http.Response response =
          // Harus diubah dengan sama pada auth_services.dart
          await AuthServices.loginGuru(_role, _email, _password);
      Map responseMap = jsonDecode(response.body);
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 25, 96),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Login Guru',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: [
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topCenter,
            height: 200,
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
          // SizedBox(height: 25),
          // Text(
          //   "Role:",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(height: 8),
          // TextFormField(
          //   obscureText: _isHidePassword,
          //   autofocus: false,
          //   initialValue: '',
          //   keyboardType: TextInputType.text,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //     ),
          //     hintText: "Enter your Role",
          //     suffixIcon: GestureDetector(
          //       onTap: () {
          //         _togglePasswordVisibility();
          //       },
          //       child: Icon(
          //         _isHidePassword ? Icons.visibility_off : Icons.visibility,
          //         color: _isHidePassword ? Colors.grey : Colors.blue,
          //       ),
          //     ),
          //     isDense: true,
          //   ),
          //   onChanged: (value) {
          //     _role = value;
          //   },
          // ),
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
            keyboardType: TextInputType.text,
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
          TextFormField(
            obscureText: _isHidePassword,
            autofocus: false,
            initialValue: '',
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              hintText: "Enter your Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglePasswordVisibility();
                },
                child: Icon(
                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: _isHidePassword ? Colors.grey : Colors.blue,
                ),
              ),
              isDense: true,
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          SizedBox(height: 30),
          RoundedButtonGuru(
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
                height: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
