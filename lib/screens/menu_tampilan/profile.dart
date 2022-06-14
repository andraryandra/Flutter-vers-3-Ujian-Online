import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/screens/login_siswa_screen.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_first/Services/globals.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Informasi Akun',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
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
        body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1)
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://akcdn.detik.net.id/community/media/visual/2022/01/08/gavi.jpeg?w=700&q=90'),
                    fit: BoxFit.cover,
                  ),
                ),
                    )
                  ]
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(25),
                width: 130,
            height: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                 BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
              ],
            ),
            child: Container(
              child: Column(
                children: [

                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                    hintText: "rafli",
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                    hintText: "rafli@gmail.com",
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                    hintText: "****",
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  
            ElevatedButton(
                  child: Text("ganti foto"),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                          isScrollControlled: true,
    // set this when inner content overflows, making RoundedRectangleBorder not working as expected
    clipBehavior: Clip.antiAlias,
    // set shape to make top corners rounded
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), 
            topRight: Radius.circular(18),
        ),
    ),
                        builder: (BuildContext context) {
                          return  Container(
                            height: 300,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text("pilih foto dari galeri"),
                                  style: ElevatedButton.styleFrom(
                                     fixedSize: const Size(220, 50),
                                     shape: 
                                     RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10)
                                     )
                                  ),
                                  ),
                                  SizedBox(height: 10,),
                                   ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text("pilih foto dari galeri"),
                                  style: ElevatedButton.styleFrom(
                                     fixedSize: const Size(220, 50),
                                     shape: 
                                     RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10)
                                     )
                                  ),
                                  ),
                                ],
                                  ),
                            ),
                          );
                        });
                  },
                )
                ],
              )
            ),
              )
            ],
          ),
          ),
        ),
        );
  }
}