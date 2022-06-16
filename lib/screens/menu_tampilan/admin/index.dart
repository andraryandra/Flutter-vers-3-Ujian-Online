import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IndexAdmin extends StatefulWidget {
  const IndexAdmin({Key? key}) : super(key: key);

  @override
  State<IndexAdmin> createState() => _IndexAdminState();
}

class _IndexAdminState extends State<IndexAdmin> {
  final String apiURL = 'http://192.168.43.124:8000/api/categoriesPelajaran';

  Future getData() async {
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      print(response.body);
      return List<Map<String, dynamic>>.from(
          json.decode(response.body)['categories']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      snapshot.data![index]['name_category'],
                    ),
                  );
                });
            // return Text('data terbaca');
          } else {
            return Text('loading');
          }
        },
      ),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'dart:async';

// // class IndexAdmin extends StatefulWidget {
// //   const IndexAdmin({Key? key}) : super(key: key);

// //   @override
// //   State<IndexAdmin> createState() => _IndexAdminState();
// // }

// // class _IndexAdminState extends State<IndexAdmin> {
// //   static const url = "10.0.2.2:8000/api/membres";

// //   late Future<List<Map<String, dynamic>>> _future;

// //   Future<List<Map<String, dynamic>>> fetch() async {
// //     final response = await http
// //         .get(Uri.parse('http://192.168.43.124:8000/api/categoriesPelajaran'));
// //     if (response.statusCode != 200) throw Exception();
// //     return List<Map<String, dynamic>>.from(
// //         json.decode(response.body)['categories']);
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _future = fetch();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: FutureBuilder<dynamic>(
// //         future: _future,
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             return ListView.builder(
// //                 itemCount: snapshot.data.length,
// //                 itemBuilder: (context, index) {
// //                   return Container(
// //                     child: ListTile(
// //                       title: Text(snapshot.data[index]['name_category']),
// //                     ),
// //                   );
// //                 });
// //           } else {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
