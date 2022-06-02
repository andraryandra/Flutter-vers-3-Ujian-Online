import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/screens/login_admin_screen.dart';
import 'package:flutter_first/screens/home_admin_screen.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_first/Services/globals.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  _HomeAdminScreenState createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo.shade700,
        leading: IconButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginAdminScreen(),
              )),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: Text(
          "Admin HomePage",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu Utama",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>MateriView()),
                    // );
                  },
                  child: CardFolder(
                    image: Image.asset(
                      "assets/picture/Folder.png",
                      height: 30,
                      width: 30,
                    ),
                    title: "UTS",
                    date: "2 jam yang lalu",
                    color: Color.fromARGB(255, 255, 138, 138),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndexAdmin()),
                    );
                  },
                  child: CardFolder(
                    image: Image.asset(
                      "assets/picture/Folder.png",
                      height: 30,
                      width: 30,
                    ),
                    title: "Nilai",
                    date: "2 jam yang lalu",
                    color: Color.fromARGB(255, 0, 171, 162),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardFolder extends StatelessWidget {
  CardFolder({
    Key? key,
    required this.title,
    required this.date,
    required this.color,
    required this.image,
  }) : super(key: key);

  final String title;
  final String date;
  final Color color;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
