import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/Services/auth_services.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/rounded_button.dart';
import 'package:flutter_first/screens/home_siswa_screen.dart';
import 'package:flutter_first/screens/login_admin_screen.dart';
import 'package:flutter_first/screens/login_siswa_screen.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_siswa_screen.dart';

class LoginGuruScreen extends StatefulWidget {
  static var routeName;

  const LoginGuruScreen({Key? key}) : super(key: key);

  @override
  _LoginGuruScreenState createState() => _LoginGuruScreenState();
}

class _LoginGuruScreenState extends State<LoginGuruScreen> {
  String _role = 'guru';
  String _username = '';
  String _password = '';

  loginPressed() async {
    if (_role.isNotEmpty == _username.isNotEmpty && _password.isNotEmpty) {
      http.Response response =
          // Harus diubah dengan sama pada auth_services.dart
          await AuthServices.loginAdmin(_role, _username, _password);
      Map responseMap = jsonDecode(response.body);
      if (_role == "guru") {
        if (response.statusCode == 200) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('token', json.encode(['token']));
          localStorage.setString('user', json.encode(['user']));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const HomeSiswaScreen(),
                // HomeSiswaScreen(),
              ));
        } else {
          errorSnackBar(context, responseMap.values.first);
        }
      }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 85, 248, 180),
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          SizedBox(height: 25),
          Text(
            "E-Test",
            style: TextStyle(
              color: Colors.blue.shade400,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "SMPN 1 Lohbener ",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            child: Image.asset(
              "assets/picture/pana.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Username:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.blue.shade100,
              hintText: "Username",
            ),
            onChanged: (value) {
              _username = value;
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
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter your Password",
              filled: true,
              fillColor: Colors.blue.shade100,
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglePasswordVisibility();
                },
                child: Icon(
                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: _isHidePassword
                      ? Color.fromARGB(255, 63, 63, 63)
                      : Colors.blue,
                ),
              ),
              isDense: true,
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => loginPressed(),
            child: Text(
              "MASUK",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              fixedSize: Size(150, 50),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 95, 243, 186),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Admin'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginAdminScreen();
                }));
              },
            ),
            ListTile(
              title: const Text('Guru'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginGuruScreen();
                }));
              },
            ),
            ListTile(
              title: const Text('Siswa'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginSiswaScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
