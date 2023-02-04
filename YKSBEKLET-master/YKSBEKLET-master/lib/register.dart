import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'successLogin/sceen.dart';
import 'needed.dart';

class register {
  void dbContact() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    users = FirebaseFirestore.instance.collection('users');

  }
  register(TextEditingController controlUsername, TextEditingController controlEmail, TextEditingController controlEmail2, TextEditingController controlPassword, TextEditingController controlPassword2) {
    dbContact();
    String username = controlUsername.text;
    String email = controlEmail.text;
    String email2 = controlEmail2.text;
    String password = controlPassword.text;
    String password2 = controlPassword2.text;


    if(username=="" ||email == "" ||email2 == ""||password == ""||password2 == "") {
      Fluttertoast.showToast(
          msg: "Please fill all blanks.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0
      );
      //exit(1);

      print(EmailValidator.validate(email));
    }else if(username.contains(" ") || email.contains(" ") || password.contains(" ")){
      Fluttertoast.showToast(
          msg: "Your username, e-mail or password has space",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }else if(EmailValidator.validate(email)==false){
      Fluttertoast.showToast(
          msg: "Email are denied.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }else if(email != email2){
      Fluttertoast.showToast(
          msg: "Emails are not same.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }else if(password != password2){
      Fluttertoast.showToast(
          msg: "Passwords are not same.",
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
          .doc(username)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
       //   print(documentSnapshot.data());
         // print(documentSnapshot.get("email"));

          Fluttertoast.showToast(
              msg: "Username exists.",
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
              .where('email', isEqualTo: email)
              .get()
              .then((QuerySnapshot querySnapshot) {

            if(querySnapshot.size > 0){
              Fluttertoast.showToast(
                  msg: "E-mail exists.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.red,
                  fontSize: 16.0
              );

            }else{
              users.doc(username).set({"username":username,"email":email, "password": generateMd5(generateMd5(password).passw).passw, "role": 0, "bio":""});
              Fluttertoast.showToast(
                  msg: "Sussessed. You can login now.",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }

          });

        }
      });







    }
//users.doc("asdsadasdasfgh11").set({"username":"byfad51","email":"byfad51@gmail.com"});
    // users.add({"kullanici":"denemeonay"});
    //users.add({"username":"fatih"});
  }


}