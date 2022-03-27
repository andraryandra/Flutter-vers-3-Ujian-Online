// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/Services/auth_services.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/screens/home_siswa_screen.dart';
import 'package:flutter_first/screens/login_guru_screen.dart';
import 'package:flutter_first/screens/login_siswa_screen.dart';

import '../../rounded_button.dart';
import 'package:flutter_first/screens/intro/rounded_button.dart';

import 'package:http/http.dart' as http;

class TampilanScreen extends StatefulWidget {
  const TampilanScreen({Key? key}) : super(key: key);

  @override
  _TampilanScreenState createState() => _TampilanScreenState();
}

class _TampilanScreenState extends State<TampilanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 226, 226, 226),
      //   centerTitle: true,
      //   elevation: 0,
      //   title: const Text(
      //     'Registration',
      //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      // ),
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
            "Selamat Datang Di Aplikasi Elearning SPMN 1 Lohbener",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          SizedBox(height: 30),
          RoundedButtonGuru(
            btnText: "Login Guru",
            onBtnPreseed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginGuruScreen(),
                  ));
            },
          ),
          SizedBox(height: 30),
          RoundedButtonSiswa(
            btnText: "Login Siswa",
            onBtnPreseed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginSiswaScreen(),
                  ));
            },
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


//  RoundedButton(
//               btnText: "Create Account",
//               onBtnPreseed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (BuildContext context) =>
//                           const LoginGuruScreen(),
//                     ));
//               },
//             ),