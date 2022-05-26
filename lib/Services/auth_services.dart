import 'dart:convert';

import 'package:flutter_first/Services/globals.dart';
import 'package:http/http.dart' as http;

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
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> getUserData(
      String name, String username, String role, String id) async {
    Map data = {
      "name": name,
      "username": username,
      "role": role,
      "id": id,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/index');
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
}
