import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user1/Assistants/assistant_methods.dart';
import 'package:user1/global/global.dart';
import 'package:user1/screens/login_screen.dart';
import 'package:user1/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer(){
    Timer(Duration(seconds: 3), () async {
      if(await firebaseAuth.currentUser != null){
        firebaseAuth.currentUser !=null ? AssistantMethods.readCurrentOnlineUserInfo() : null;
        Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Uber',
          style: TextStyle(
            fontSize:40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
