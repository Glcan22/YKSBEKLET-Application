import 'package:flutter/material.dart';
import 'package:girisapp/deneme.dart';
import 'package:girisapp/user.dart';
import 'package:girisapp/data.dart';
/*const DENEME_DUMMY = const [
  Deneme(name: "Deneme1",id: 1,fen: 12,mat: 25,sos: 14,turk: 31),
  Deneme(name: "Deneme2",id: 2,fen: 15,mat: 27,sos: 16,turk: 35),
  Deneme(name: "Deneme3",id: 3,fen: 13,mat: 24,sos: 18,turk: 30),
  Deneme(name: "Deneme4",id: 4,fen: 14,mat: 25,sos: 19,turk: 25),
  Deneme(name: "Deneme5",id: 5,fen: 16,mat: 29,sos: 15,turk: 29),
  Deneme(name: "Deneme6",id: 6,fen: 11,mat: 31,sos: 9,turk: 29),
  Deneme(name: "Deneme7",id: 7,fen: 9,mat: 34,sos: 15,turk: 35),
  Deneme(name: "Deneme8",id: 8,fen: 13,mat: 33,sos: 16,turk: 32),
  Deneme(name: "Deneme1",id: 1,fen: 12,mat: 25,sos: 14,turk: 31),
  Deneme(name: "Deneme2",id: 2,fen: 15,mat: 27,sos: 16,turk: 35),
  Deneme(name: "Deneme3",id: 3,fen: 13,mat: 24,sos: 18,turk: 30),
  Deneme(name: "Deneme4",id: 4,fen: 14,mat: 25,sos: 19,turk: 25),
  Deneme(name: "Deneme5",id: 5,fen: 16,mat: 29,sos: 15,turk: 29),
  Deneme(name: "Deneme6",id: 6,fen: 11,mat: 31,sos: 9,turk: 29),
  Deneme(name: "Deneme7",id: 7,fen: 9,mat: 34,sos: 15,turk: 35),
  Deneme(name: "Deneme8",id: 8,fen: 13,mat: 33,sos: 16,turk: 32),
];*/


List<Deneme> DENEME_DUMMY = [];
Widget denemelerim(BuildContext context, User myUser) {
  List<Deneme> DENEME_DUMMY = tryings(myUser).getTryings();
  return Container(

    child: Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.all(15),
          padding: EdgeInsetsDirectional.all(10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromRGBO(231, 11, 81, 1),
          ),
          child: Container(
            /*
                There will be some line graph codes.
               */
          ),
        ),
        Container(
          height: 475,
          margin: EdgeInsetsDirectional.all(2),
          padding: EdgeInsetsDirectional.all(5),

          child: ListView.builder(
            itemCount: DENEME_DUMMY.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          child: Text(
                            DENEME_DUMMY[index].name,
                            style: TextStyle(
                              fontSize:20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: Text(
                          "Netler:",
                          style: TextStyle(
                            fontSize:15,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Text(
                              "Türkçe: ${DENEME_DUMMY[index].turkD}",
                              style: TextStyle(
                                fontSize:10,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Text(
                              "Sosyal: ${DENEME_DUMMY[index].sosD}",
                              style: TextStyle(
                                fontSize:10,
                              ),
                            ),
                          ),
                        ],

                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Text(
                              "Matematik: ${DENEME_DUMMY[index].matD}",
                              style: TextStyle(
                                fontSize:10,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Text(
                              "Fen: ${DENEME_DUMMY[index].fenD}",
                              style: TextStyle(
                                fontSize:10,
                              ),
                            ),
                          ),
                        ],

                      ),
                       Spacer(),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.arrow_right_alt_outlined)
                      )
                    ],
                  ),
                ),
              );
            },


          ),
        ),
      ], //Children of Column
    ),
  );
}
