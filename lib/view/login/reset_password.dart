import '../controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _passwordVisible = true;
  TextEditingController emailController = TextEditingController();
  final authC = Get.find<AuthController>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //Widget untuk logo Login
  final logo = Hero(
    tag: 'Login',
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/resetpass.png',
          width: 250.0,
          // height: 200.0,
          // fit: BoxFit.cover,
        ),
      ],
    ),
  );

  //Widget untuk TextFormField Username
  Widget email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: const TextStyle(color: Colors.black),
        labelText: 'Masukan Email',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.black,
        ),
        fillColor: Colors.cyan,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: const BorderSide(color: Colors.cyan)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: const BorderSide(color: Colors.cyanAccent, width: 2.0)),
        // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
        contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  //Widget untuk Tombol LoginButton
  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 300.0,
          height: 42.0,
          onPressed: () =>
              authC.resetPassword(emailController.text),
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(22.0)),
          child: Text(
            'Reset'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }



  // Widget untuk menusun widget" yang sudah dibuat diatas
  Widget isi() {
    return Form(
        // key: _formKey,
        child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          logo,
          SizedBox(
            height: 5.0,
          ),
          email(),
          SizedBox(
            height: 20.0,
          ),
          loginButton(),
          
        ],
      ),
    ));
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
