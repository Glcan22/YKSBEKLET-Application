import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'successLogin/sceen.dart';
import 'register.dart';
import 'login.dart';
import 'user.dart';
late CollectionReference users;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  users = FirebaseFirestore.instance.collection('users');
  runApp(const MyApp());
}
 TextEditingController controlUsername = TextEditingController();
 TextEditingController controlEmail = TextEditingController();
 TextEditingController controlEmail2 = TextEditingController();
 TextEditingController controlPassword = TextEditingController();
 TextEditingController controlPassword2 = TextEditingController();

TextEditingController controlGirisUsername = TextEditingController();
TextEditingController controlGirisPassword = TextEditingController();

late User myUser;
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Page'),
        routes: {
          '\register': (ctx) => RegisterScreen(),
        }
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 180, 145, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 123, 127, 1),
        title: Text("REGISTER"),
      ),
      body: Container(

        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Please fill the all blanks to register."),
                  TextField(maxLines: 1,
                      keyboardAppearance: Brightness.light,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,controller: controlUsername,decoration:  InputDecoration( hintText: "Username",
                      labelText:"Username" )),
                  TextField( maxLines: 1,
                      keyboardAppearance: Brightness.light,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,

                      autofocus: true,controller: controlEmail,decoration: InputDecoration(  hintText: "E-mail",
                      labelText:"E-mail" )),
                  TextField(maxLines: 1,
                      keyboardAppearance: Brightness.light,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: controlEmail2,decoration: InputDecoration(  hintText: "E-mail-again",
                      labelText:"E-mail-again" ,)),
                  TextField(maxLines: 1,
                      keyboardAppearance: Brightness.light,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,

                      obscureText: true,controller: controlPassword,decoration: InputDecoration(  hintText: "Password",
                      labelText:"Password" )),
                  TextField(maxLines: 1,
                      keyboardAppearance: Brightness.light,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,controller: controlPassword2,decoration: InputDecoration(  hintText: "Password - again",
                      labelText:"Password - again" )),
                  TextButton(onPressed: () {
                    register(controlUsername,controlEmail,controlEmail2,controlPassword,controlPassword2);
                   },child: Text("REGISTER")),


                ], //column children
              ),),), //column
        ), //container
      ),
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

   _loginPressed() async {
     var log = await login(controlGirisUsername, controlGirisPassword);
    /* if(log.isLoged) {

     }*/
  }



  void _registerPressed(BuildContext ctx) {
      Navigator.of(context).pushNamed(
      '\register',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 180, 145, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 123, 127, 1),
        title: Text(widget.title),
      ),
      body:Center( child: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 175,
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child:Image.asset("asset/logo1.png", )

              ),
            ),
            Text(
              'You need to login to use app.',
            ),
            TextField(maxLines: 1,controller: controlGirisUsername,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: "Username", labelText: "Username"),),
            TextField(maxLines: 1,controller: controlGirisPassword,
                keyboardAppearance: Brightness.light,
                obscureText: true,decoration: InputDecoration(hintText: "Password",  labelText: "Password")),
            TextButton(onPressed: _loginPressed,
              
              child: Text("LOGIN", ), ),
           Container(
             padding: EdgeInsets.all(0),
             margin: EdgeInsets.all(5),
             child: TextButton( child: Text("REGISTER"),
               onPressed: () {
               _registerPressed(context);
             },),
           )
          ],
        ),),),
      ),
    );
  }
}
