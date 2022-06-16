import 'package:flutter/material.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';

class UjianView extends StatefulWidget {
  const UjianView({Key? key}) : super(key: key);

  @override
  State<UjianView> createState() => _UjianViewState();
}

class _UjianViewState extends State<UjianView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade200,
          ),
          child: Stack(children: [
            Column(
              children: [
                Container(
                  child: Text(
                    "assets/picture/profil.png",
                  ),
                ),
              ],
            ),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade200,
          ),
          child: Stack(children: [
            Column(
              children: [
                Container(
                  child: Text(
                    "assets/picture/profil.png",
                  ),
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
