import 'dart:convert';
import 'package:flutter_first/Services/globals.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CategoryUjianView extends StatefulWidget {
  const CategoryUjianView({Key? key}) : super(key: key);

  @override
  State<CategoryUjianView> createState() => _CategoryUjianViewState();
}

class _CategoryUjianViewState extends State<CategoryUjianView> {
  Future getData() async {
    var response = await http.get(Uri.parse(baseURL + 'categoriesUjian'));
    if (response.statusCode == 200) {
      print(response.body);
      return List<Map<String, dynamic>>.from(
          json.decode(response.body)['categoryUjians']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  int no = 1;

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
          'Category Ujian',
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
                    height: 120,
                    child: Card(
                      elevation: 5,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text(
                              'Category Ujian',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text('Edit'),
                          ),
                          DataColumn(
                            label: Text('Delete'),
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
                                    '${snapshot.data[index]['name_category_ujian']}'),
                              ),
                              DataCell(IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.blue,
                                iconSize: 20,
                                onPressed: () {},
                              )),
                              DataCell(IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
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
