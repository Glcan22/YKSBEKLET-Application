import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
Widget profile(BuildContext context, User myUser){

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SizedBox(
        height: 125,
        width: 125,
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child:Image.asset("asset/aaaa.png", )

        ),
      ),
      Container(child: Column(children: [
        Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
        child:Text(myUser.username, style: TextStyle(fontSize: 25, color: Colors.brown),),),

        Container(
          child:Text(myUser.bio, style: TextStyle(fontSize: 22, color: Colors.brown),),),
      ])),

    ],
  );

}