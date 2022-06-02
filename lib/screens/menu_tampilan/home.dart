import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/screens/login_siswa_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_first/Services/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String name = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUserData();
  // }

  // _loadUserData() async {
  //   var user;

  //   final localStorage = await SharedPreferences.getInstance();
  //   user = localStorage.getString('user');
  //   var userMap = json.decode(user);
  //   if (userMap != null) {
  //     setState(() {
  //       name = userMap['name'];
  //     });
  //   }
  // }

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
                builder: (BuildContext context) => const LoginSiswaScreen(),
              )),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: Text(
          "My HomePage",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/picture/profil.png",
                        fit: BoxFit.contain,
                      ),
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Andra Ryanda",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Siswa",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
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
                        color: Color(0xffFF317B),
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
                    color: Colors.white,
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
                CardFolder(
                  image: Image.asset(
                    "assets/picture/Folder.png",
                  ),
                  title: "Materi",
                  date: "Desember",
                  color: Colors.white,
                ),
                CardFolder(
                  image: Image.asset("assets/picture/Folder(2).png"),
                  title: "Tugas",
                  date: "Desember",
                  color: Colors.white,
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
                CardFolder(
                  image: Image.asset("assets/picture/Folder(1).png"),
                  title: "Ujian",
                  date: "Desember",
                  color: Colors.white,
                ),
                CardFolder(
                  image: Image.asset("assets/picture/Folder(3).png"),
                  title: "Nilai",
                  date: "Desember",
                  color: Colors.white,
                ),
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
                  "Tugas Terbaru",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Image.asset("assets/picture/Sort.png")
              ],
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.book_online_rounded),
              color: Colors.white,
            ),
            title: Text(
              "Matematika",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text("Lorem ipsum dolor sit amet",
                style: TextStyle(color: Colors.white)),
            trailing:
                Text("2 jam 5 menit", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.book_online_rounded),
              color: Colors.white,
            ),
            title: Text(
              "IPA",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(color: Colors.white),
            ),
            trailing:
                Text("2 jam 5 menit", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.book_online_rounded),
              color: Colors.white,
            ),
            title: Text(
              "Bahasa Indonesia",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text("Lorem ipsum dolor sit amet",
                style: TextStyle(color: Colors.white)),
            trailing:
                Text("2 jam 5 menit", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// void logout() async {
//   var res = Uri.parse(baseURL + 'auth/logout');
//   var body = json.decode(res.toString());
//   if (body['success']) {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     localStorage.remove('user');
//     localStorage.remove('token');
//     print('true');
//   }
// }

// void logout() async {
//   var url = Uri.parse(baseURL + 'auth/logout');
//   var request = new http.Request('POST', url);
//   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   localStorage.remove('user');
//   localStorage.remove('token');

//   var response = await request.send();
//   if (response.statusCode == 200) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => LoginSiswaScreen()));
//   }
// }

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
