import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IndexAdmin extends StatefulWidget {
  const IndexAdmin({Key? key}) : super(key: key);

  @override
  State<IndexAdmin> createState() => _IndexAdminState();
}

class _IndexAdminState extends State<IndexAdmin> {
  final String url = 'http://localhost:8000/api/categories-ujian';

  Future getCategoryUjian() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // getCategoryUjian();
    return Scaffold(
      body: FutureBuilder(
        future: getCategoryUjian(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Text('terbaca');
            return ListView.builder(
                itemCount: (snapshot.data as dynamic)['data'].length,
                itemBuilder: (context, index) {
                  return Text((snapshot.data as dynamic)['data'][index]
                      ['name_category_ujian']);
                });
          } else {
            return Text('data error');
          }
        },
      ),
    );
  }
}
