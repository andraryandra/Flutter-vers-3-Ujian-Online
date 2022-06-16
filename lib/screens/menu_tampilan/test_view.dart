import 'package:flutter/material.dart';
import 'package:flutter_first/screens/menu_tampilan/materi_view.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF1F1F1),
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MateriView(),
              ),
            ),
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: Text(
          "My Ujian",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 50),
          Image.asset(
            "assets/picture/paint-palette.png",
            width: 370,
            height: 400,
          ),
          SizedBox(height: 20),
          Container(
            child: Text(
              "Maaf soal belum tersedia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
