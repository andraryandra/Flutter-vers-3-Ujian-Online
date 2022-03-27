import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const String baseURL = "http://192.168.43.124/api/";
const String baseURL = "http://localhost:8000/api/";
//Emulator Localhost
const Map<String, String> headers = {"content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
