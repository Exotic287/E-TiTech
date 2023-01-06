
import '../controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

class OrderPage extends StatefulWidget {
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController JeTiController = TextEditingController();
  var userId;

  List<String> _jenisTiket = ['VIP', 'Reguler'];

  final authC = Get.find<AuthController>();
  // final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = authC.auth.currentUser;
    final oke = user!.uid.toString();
    userId = oke;
  }

  // Widget untuk logo Login
  final logo = Hero(
    tag: 'Login',
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/order.png',
          width: 500.0,
          height: 200.0,
          // fit: BoxFit.cover,
        ),
      ],
    ),
  );

  //Widget untuk TextFormField Username
  Widget nama() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: namaController,
      decoration: InputDecoration(
        hintText: 'Nama',
        hintStyle: const TextStyle(color: Colors.black),
        labelText: 'Masukan Nama',
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

  //Widget untuk TextFormField Username
  Widget noTelp() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: noTelpController,
      decoration: InputDecoration(
        hintText: 'No Telepon',
        hintStyle: const TextStyle(color: Colors.black),
        labelText: 'Masukan No Telepon',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(
          Icons.call,
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

  Widget jenisTiket() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return Padding(
            padding: const EdgeInsets.all(4),
            child: DropdownSearch<String>(
              // showClearButton: true,
              mode: Mode.MENU,
              showSelectedItems: true,
              items: _jenisTiket,
              dropdownSearchDecoration: InputDecoration(
                hintText: 'Jenis Tiket',
                hintStyle: const TextStyle(color: Colors.black),
                labelText: 'Pilih Tiket',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(
                  Icons.apps,
                  color: Colors.black,
                ),
                fillColor: Colors.cyan,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: const BorderSide(color: Colors.cyan)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Colors.cyanAccent, width: 2.0)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
              onChanged: (value) {
                print(value);
                JeTiController.text = value!;
              },
            ));
      },
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
          onPressed: () => authC.tambahPesanan(namaController.text,
              noTelpController.text, JeTiController.text, userId),
          // authC.login(emailController.text, passwordController.text),
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(22.0)),
          child: Text(
            'pesan'.toUpperCase(),
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
          nama(),
          SizedBox(
            height: 20.0,
          ),
          noTelp(),
          SizedBox(
            height: 20.0,
          ),
          jenisTiket(),
          SizedBox(
            height: 20.0,
          ),
          loginButton(),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: <Widget>[isi()],
        ),
      ),
    );
  }
}
