import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:http/http.dart' as http;

class PostPilihanGandaView extends StatefulWidget {
  const PostPilihanGandaView({Key? key}) : super(key: key);

  @override
  State<PostPilihanGandaView> createState() => _PostPilihanGandaViewState();
}

class _PostPilihanGandaViewState extends State<PostPilihanGandaView> {
  int no = 1;

  Future getData() async {
    var response = await http.get(Uri.parse(baseURL + 'posts/index'));
    if (response.statusCode == 200) {
      print(response.body);
      var data =
          List<Map<String, dynamic>>.from(json.decode(response.body)['posts']);
      return data;
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Post Essay',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          },
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 180,
                    child: Card(
                      elevation: 5,
                      child: DataTable(
                        dataRowHeight: 100,
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text('Ujian'),
                          ),
                          DataColumn(
                            label: Text(
                              'Soal ABC',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text('Edit'),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text(
                                  '${no++}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataCell(
                                Text(
                                  '${snapshot.data[index]['id_category']}',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                      '${snapshot.data[index]['soal_ujian']}'),
                                ),
                              ),
                              DataCell(IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.blue,
                                iconSize: 20,
                                onPressed: () {},
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
