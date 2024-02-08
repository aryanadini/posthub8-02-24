import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboard.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Onboard()
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Align(
  alignment: Alignment.center,
  child:   Container(

      width: 161.42,

      height: 51.24,

     child: Image(image: AssetImage("assets/images/logo1.png"),),



  ),
),
    );
  }
}
