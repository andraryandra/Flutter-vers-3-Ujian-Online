import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/screens/login_siswa_screen.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/categoryPelajaran/index.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/categoryUjian/index.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/postEssay/index.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/postPilihanGanda/index.dart';
import 'package:flutter_first/screens/menu_tampilan/materi_view.dart';
import 'package:flutter_first/screens/menu_tampilan/profile.dart';
import 'package:flutter_first/screens/menu_tampilan/table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_first/Services/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get child => null;

  String _role = 'siswa';
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_on,
            color: Colors.blue,
          ),
        ),
        title: Text(
          "Portal Ujian",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
              offset: Offset(0, 45), // SET THE (X,Y) POSITION
              iconSize: 30,
              icon: Icon(
                Icons.more_horiz, // CHOOSE YOUR CUSTOM ICON
                color: Colors.blue,
              ),
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'Home',
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          Container(
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.black45,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                              );
                            },
                            child: Text(
                              "Profil",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Home',
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          Container(
                            child: Icon(
                              Icons.table_rows,
                              color: Colors.black45,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TableScreen()),
                              );
                            },
                            child: Text(
                              "Table",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Home',
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          Container(
                            child: Icon(
                              Icons.logout,
                              color: Colors.black45,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginSiswaScreen()),
                              );
                            },
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ];
              })
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              "Selamat Datang!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            child: Text(
              "Good Luck :)",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.text,
              // obscureText: true,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                hintText: "Pencarian",
                filled: true,
                fillColor: Color.fromARGB(255, 236, 229, 229),
              ),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(95, 86, 86, 86),
                blurRadius: 25,
                offset: const Offset(0, 10),
              )
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/picture/profil.png",
                        fit: BoxFit.cover,
                      ),
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Muhamad Rafli",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Siswa",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          "7 F",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                )
              ],
            ),
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MateriView()),
                    );
                  },
                  child: CardFolder(
                      // image: Image.asset(
                      //   "assets/pictures/Folder.png",
                      // ),
                      icon: Icon(
                        Icons.tablet_mac_sharp,
                        color: Colors.blue,
                      ),
                      title: "Materi",
                      date: "2 jam yang lalu",
                      color: Colors.white10),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryPelajaraView()),
                    );
                  },
                  child: CardFolder(
                    icon: Icon(
                      Icons.book_sharp,
                      color: Colors.orange,
                    ),
                    title: "Jenis Pelajaran",
                    date: "Category",
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryUjianView()),
                    );
                  },
                  child: CardFolder(
                    icon: Icon(
                      Icons.book_rounded,
                      color: Color.fromARGB(255, 76, 144, 175),
                    ),
                    title: "Jenis Ujian",
                    date: "Category",
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostEssayView()),
                    );
                  },
                  child: CardFolder(
                    icon: Icon(
                      Icons.score_sharp,
                      color: Colors.green,
                    ),
                    title: "Post Essay",
                    date: "2 jam yang lalu",
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),

                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => PostPilihanGandaView()),
                //     );
                //   },
                //   child: CardFolder(
                //     icon: Icon(
                //       Icons.score_sharp,
                //       color: Colors.green,
                //     ),
                //     title: "Post Pilihan Ganda",
                //     date: "2 jam yang lalu",
                //     color: Color.fromARGB(255, 255, 255, 255),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

UasView() {}

class CardFolder extends StatelessWidget {
  CardFolder({
    Key? key,
    required this.title,
    required this.date,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String date;
  final Color color;

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 180,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.3),
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Color.fromARGB(255, 239, 239, 239),
            //   soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 10  horizontally
              1.0,
              // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            date,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
