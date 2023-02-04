import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'successLogin/sceen.dart';
import 'needed.dart';
import 'user.dart';
late User MyUser;

class login{
  late bool isLoged;
  String username = "";
  String password = "";
  login(TextEditingController controlUsername, TextEditingController controlPassword){
     username = controlUsername.text;
     password = generateMd5(controlPassword.text).passw;

    if(username.isEmpty || password.isEmpty){
      Fluttertoast.showToast(
          msg: "Login denied. Fill the blanks.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }else{

      FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: username).where("password", isEqualTo: generateMd5(password).passw)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if(querySnapshot.size > 0){
          isLoged = true;
          int role=0;
          String bio = "";
          FirebaseFirestore.instance
              .collection('users')
              .doc(username)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              bio = documentSnapshot.get("bio");

              role = documentSnapshot.get("role");


              print(role);

              print(bio);

            }else{
              role = 0;
            }});
           MyUser = User(username,password, role, bio);
            print("///////////////////////");
            print(MyUser.username);
            print(MyUser.password);
            print(MyUser.role);
            print(MyUser.bio);
            print("///////////////////////");


          Fluttertoast.showToast(
              msg: "Login success.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.red,
              fontSize: 16.0
          );
          runApp(logedScreen());
        }else{
          Fluttertoast.showToast(
              msg: "Login denied.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.red,
              fontSize: 16.0
          );
        }


        }
      );
    }
    }

  }

