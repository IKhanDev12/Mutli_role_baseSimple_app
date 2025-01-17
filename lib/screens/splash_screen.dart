import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_role_baseapp/screens/home_screen.dart';
import 'package:multi_role_baseapp/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   isLogin();
  }

  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin =  sp.getBool('isLogin') ?? false;

    if(isLogin){
      Timer(const Duration(seconds: 6), () {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }
    else {
      Timer(const Duration(seconds: 6), () {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset( 'images/splash.jpg', fit: BoxFit.fill,height: double.infinity,),
    );
  }
}
