import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/Services/auth_services.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/rounded_button.dart';
import 'package:flutter_first/screens/home_siswa_screen.dart';
import 'package:flutter_first/screens/login_admin_screen.dart';
import 'package:flutter_first/screens/login_guru_screen.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_siswa_screen.dart';

class LoginSiswaScreen extends StatefulWidget {
  static var routeName;

  const LoginSiswaScreen({Key? key}) : super(key: key);

  @override
  _LoginSiswaScreenState createState() => _LoginSiswaScreenState();
}

class _LoginSiswaScreenState extends State<LoginSiswaScreen> {
  TextEditingController _roleController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _role = 'siswa';
  String _username = '';
  String _password = '';

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? roleId = prefs.getString('siswa');
    final String? user = prefs.getString('username');
    final String? pass = prefs.getString('password');
    if (user != null && pass != null && roleId != null) {
      setState(() {
        _role = roleId;
        _username = user;
        _password = pass;
        isLoggedIn = true;
      });
      return;
    }
  }
  //    final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('role', _role);
  //   prefs.setString('username', _username);
  //   prefs.setString('password', _password);
  //   setState(() {
  //     _role = _roleController.text;
  //     _username = _usernameController.text;
  //     _password = _passwordController.text;
  //     isLoggedIn = true;
  //   });

  //   _roleController.clear();
  //   _usernameController.clear();
  //   _passwordController.clear();

  Future<Null> loginPressed() async {
    if (_role.isNotEmpty == _username.isNotEmpty && _password.isNotEmpty) {
      http.Response response =
          // Harus diubah dengan sama pada auth_services.dart
          await AuthServices.loginSiswa(_role, _username, _password);
      Map responseMap = jsonDecode(response.body);
      if (_role == "siswa" && response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', _username);
        prefs.setString('password', _password);
        setState(() {
          isLoggedIn = true;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
              // HomeSiswaScreen(),
              // HomeSiswaScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
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
        backgroundColor: Color.fromARGB(255, 111, 214, 255),
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
