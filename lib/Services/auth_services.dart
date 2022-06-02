import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static Future<http.Response> loginSiswa(
      String role, String username, String password) async {
    Map data = {
      "role": role,
      "username": username,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: _setHeaders(),
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> loginAdmin(
      String role, String username, String password) async {
    Map data = {
      "role": role,
      "username": username,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: _setHeaders(),
      body: body,
    );
    print(response.body);
    return response;
  }
}

var tokenBarier;
var token;

_getToken() async {
  final localStorage = await SharedPreferences.getInstance();
  tokenBarier = localStorage.getString('token');
  token = jsonDecode(tokenBarier);
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
