import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:girisapp/denemelerim/metehan.dart';
import 'package:girisapp/login.dart';
import 'successLogin/sceen.dart';
import 'user.dart';
import 'deneme.dart';
List<Deneme> DENEME_DUMMY = [];
class tryings {
  void dbContact() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
   // users = FirebaseFirestore.instance.collection('users');
  }
  tryings(User myUser){
    //DENEME_DUMMY = [];
    dbContact();
  //  if(DENEME_DUMMY.isEmpty){
      takeTrying(myUser);
   // }
  }



  takeTrying(User myUser) {
    print("//////////////////////////////////////////");
    FirebaseFirestore.instance
        .collection('tryings').where("username", isEqualTo: myUser.username)
        .get()
        .then((QuerySnapshot querySnapshot) {
          try{

            var mapList = querySnapshot.docs.asMap();
            mapList.forEach((key, value) {
              try {
                String denemeAdi = value["denemeAdi"];
                int matD = value["matD"];
                int matY = value["matY"];
                int turkD = value["turkD"];
                int turkY = value["turkY"];
                int fenD = value["fenD"];
                int fenY = value["fenY"];
                int sosD = value["sosD"];
                int sosY = value["sosY"];
                DENEME_DUMMY.add(Deneme(
                    name: denemeAdi,
                    fenD: fenD,
                    matD: matD,
                    sosD: sosD,
                    turkD: turkD,
                    fenY: fenY,
                    matY: matY,
                    sosY: sosY,
                    turkY: turkY),);
              } catch (e) {
                //print(e);
              }
            });


          }catch(e){

            print(e);
          }

    });

  }
  List<Deneme> getTryings(){
    return DENEME_DUMMY;
  }

}
