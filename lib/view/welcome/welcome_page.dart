import 'dart:ffi';

import 'package:e_ticket/view/splash_screen.dart';

import '../sigin/sign_page.dart';
import '../login/login_page.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // Splash();
    super.initState();
  }

  //Widget untuk Logo
  final logo = Hero(
    tag: 'Logo Welcome',
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/welcome.png',
          width: 250.0,
          height: 250.0,
          fit: BoxFit.cover,
        )
      ],
    ),
  );

  //Widget untuk Tombol LoginButton
  Widget LoginButton() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 1.0,
        child: MaterialButton(
          minWidth: 300.0,
          height: 50.0,
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }))
          },
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(22.0)),
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  //Widget untuk Tombol SigIn
  Widget SigInButton() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 1.0,
        child: MaterialButton(
          minWidth: 300.0,
          height: 50.0,
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignInPage();
            }))
          },
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(22.0)),
          child: Text(
            'SIGNUP',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  // Widget untuk menusun widget" yang sudah dibuat diatas
  Widget isi() {
    return Form(
      // key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          logo,
          SizedBox(
            height: 5.0,
          ),
          LoginButton(),
          SizedBox(
            height: 1.0,
          ),
          SigInButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: <Widget>[isi()],
        ),
      ),
    );
  }
}
