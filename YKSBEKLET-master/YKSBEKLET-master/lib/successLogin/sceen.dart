import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:girisapp/login.dart';
import 'package:girisapp/user.dart';
import 'package:girisapp/denemelerim/metehan.dart';
import 'package:girisapp/profile.dart';
late CollectionReference users;
String username = MyUser.username;
String password = MyUser.password;
int role = MyUser.role;
class logedScreen extends StatelessWidget {


  const logedScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BEKLET',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'BEKLET'),
        routes: {
          //'\register': (ctx) => RegisterScreen(),
        }
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
int seciliSayfa = 0;
void sayfaDegistir(int index){
  setState(() {
    seciliSayfa = index;
    sayfaGoster(seciliSayfa);
  });
}
Widget yapimda(){
  return Text("YAPILIYORRR");
}
Widget sayfaGoster(int seciliSayfa){
  if(seciliSayfa == 0){
    return yapimda();
  }else if(seciliSayfa == 1){
    return yapimda();
  }else if(seciliSayfa == 2){
    return yapimda();
  }else if(seciliSayfa == 3){
    return denemelerim(context, MyUser);
  }else {
    return profile(context,MyUser);
  }

}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 180, 145, 1),
      // bottomNavigationBar: BottomNavigationBar(),



      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 123, 127, 1),
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: seciliSayfa,
        onTap: sayfaDegistir,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark_outlined),
              label: "Sorularım",
              backgroundColor: Color.fromRGBO(65, 123, 127, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda_outlined),
              label: "Programım",
              backgroundColor: Color.fromRGBO(65, 123, 127, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Anasayfa",
              backgroundColor: Color.fromRGBO(65, 123, 127, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.try_sms_star_outlined),
              label: "Denemelerim",
              backgroundColor: Color.fromRGBO(65, 123, 127, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profil",
              backgroundColor: Color.fromRGBO(65, 123, 127, 1)),
        ],
        backgroundColor: Color.fromRGBO(65, 123, 127, 1),
      ),
body: sayfaGoster(seciliSayfa),

    );
  }
}
