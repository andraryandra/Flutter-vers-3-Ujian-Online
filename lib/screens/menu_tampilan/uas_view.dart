
import 'package:flutter/material.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:flutter_first/screens/menu_tampilan/test_view.dart';

class UasView extends StatefulWidget {
  const UasView({Key? key}) : super(key: key);

  @override
  State<UasView> createState() => _UasViewState();
}

class _UasViewState extends State<UasView> {
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
                builder: (context) => HomeScreen(),
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
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TestView()),
                    );
                  },
              child: CardFolder(
                  image: Image.asset("assets/pictures/calculating.png", width: 30, height: 30,),
                  title: "Matematika",
                  color: Color.fromARGB(255, 153, 150, 0),
                ),
                ),
                CardFolder(
                  image: Image.asset("assets/pictures/science.png", width: 30, height: 30),
                  title: "IPA",
                  color: Color(0xFFAC4040),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardFolder(
                  image: Image.asset("assets/pictures/parchment.png", height: 30, width: 30,),
                  title: "IPS",
                  color: Color.fromARGB(255, 100, 77, 0),
                ),
                CardFolder(
                  image: Image.asset("assets/pictures/religion.png", height: 30, width: 30,),
                  title: "Agama",
                  color: Color(0XFF23B0B0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardFolder(
                  image: Image.asset("assets/pictures/eng.png", height: 30, width: 30,),
                  title: "Bahasa Inggris",
                  color: Color.fromARGB(255, 109, 2, 91),
                ),
                CardFolder(
                  image: Image.asset("assets/pictures/sports.png", height: 30, width: 30,),
                  title: "Penjaskes",
                  color: Color.fromARGB(255, 204, 126, 9),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardFolder(
                  image: Image.asset("assets/pictures/book-stack.png", height: 30, width: 30,),
                  title: "PPKN",
                  color: Color.fromARGB(255, 37, 106, 255),
                ),
                CardFolder(
                  image: Image.asset("assets/pictures/paint-palette.png", height: 30, width: 30,),
                  title: "Seni Budaya",
                  color: Color.fromARGB(255, 30, 0, 78),
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
    required this.color,
    required this.image,
  }) : super(key: key);

  final String title;
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
        color: color.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          SizedBox(height: 15),
          Text(title, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: color,
          ),
          ),
        ],
      ),
    );
  }
}

  
  
