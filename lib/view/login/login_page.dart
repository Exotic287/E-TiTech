import 'package:e_ticket/view/login/reset_password.dart';

import '../controller/auth_controller.dart';
import '../sigin/sign_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          'assets/login.png',
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

  //Widget Untuk TextFormField Password
  Widget password() {
    return TextFormField(      
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: !_passwordVisible,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.black),
        labelText: 'Masukan Password',
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.black,
        ),
        fillColor: Colors.cyan,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: const BorderSide(color: Colors.cyan)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: const BorderSide(color: Colors.cyanAccent, width: 2.0)),
        contentPadding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
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
              authC.login(emailController.text, passwordController.text),
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(22.0)),
          child: Text(
            'LogIn'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk FlatButton Lupa Password
  Widget lupaPass() {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          'Lupa Password?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () => Get.to(()=> ResetPasswordPage()),
      ),
    );
  }

  // Widget to SignIn
  Widget SignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an Account ?",
          style: TextStyle(color: Colors.black54),
        ),
        FlatButton(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.black54),
          ),
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignInPage();
            }))
          },
        )
      ],
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
          password(),
          lupaPass(),
          SizedBox(
            height: 10.0,
          ),
          loginButton(),
          SizedBox(
            height: 25.0,
          ),
          SignIn()
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: <Widget>[isi()],
          ),
        ),
      ),
    );
  }
}
