import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';




class Onboard extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      print("dataaaaaaaaaaaaaaaaaaaaaaaa:::::::::::${user!.email}");
      return user;
    } catch (error) {
      print("Arya ggl-----------------ign-in: ${error.toString()}");
      return null;
    }
  }

   Onboard({super.key});


  // void initState() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
children: [
  Positioned(
      width: 161.42,
      height: 51.24,
      top: 70,
      left: 99,


      child: Image(image: AssetImage("assets/images/logo1.png"))),

  Positioned(
      width: 322,
      height: 264,
      top: 128,
      left: -2,



      child:Image(image: AssetImage("assets/images/onboard1.png")) ),
  Positioned(
      width: 321,
      height: 66,
      top: 423,
      left: 15,


      child: Text("Hassle free Cross Platform Digital Advertisement ",style: TextStyle
        (fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
        fontSize:22,
        color:Color(0xff161616),
      ),


      )),


 Positioned(
     width: 321,
     height: 84,
     top: 502,
     left: 15,


     child: Text("Hassle free Cross Platform Digital Advertisement to boost your sale avoid mistakes while running campaign we take care for you ",
     style: TextStyle(
       fontWeight: FontWeight.w400,fontFamily: 'Poppins',
       fontSize: 14,
       color: Color(0xff161616),
     ),

     )),
  Positioned(
         width:328,
      height: 40,
        top: 628,

    left: 16,

    child:ElevatedButton(onPressed: ()async {
    User? user = await _handleSignIn();

    if (user != null) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Home(user) ,
    ));
    }
    // if (user != null) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Home(),
    //       ));
    // }

    
    
    }, child: Text("Sign In with Google")
    
    ),


    ),

],

      ),
    );
  }
}



class Home extends StatelessWidget {
  final User user;

  Home(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        leading: Image(image: AssetImage("assets/images/logo1.png"),width: 104.58,height:
        33.19,),
        actions: [
          Column(
            children: [
              SizedBox(
                height: 18,
                width: 30,
              child: Text("Hello",style: TextStyle(fontFamily: "Poppins",fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff161616),)),

              ),
              SizedBox(
                  width: 112,
                  height: 18,
                 child: Text('${user.email}'),

              )
            ],
          ),


          SizedBox(
            width: 40,
            height: 40,
            child:  CircleAvatar(backgroundImage: NetworkImage('${user.photoURL}'),),
          ),


       ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}