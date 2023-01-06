import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/view/client/order.dart';
import 'package:e_ticket/view/client/riwayat.dart';
import 'package:e_ticket/view/client/titech.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class detailOrder extends StatelessWidget {

  var userId;

  
  @override
  Widget build(BuildContext context) {
    var authC = Get.find<AuthController>();
    final user = authC.auth.currentUser;
    final oke = user!.uid.toString();
    userId = oke;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => {Get.to(() => PesananPage())}),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text('Pesanan'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: authC.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var listAllDocs = snapshot.data!.data() as Map<String, dynamic>;
            // nama = '${listAllDocs["noTelp"]}';
            return SafeArea(
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(25),
                      width: 300,
                      height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/background.png'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 15),
                          Text(
                            "TIKET KONSER TULUS",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 40),
                          // Nama
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("NAMA"),
                              SizedBox(
                                width: 60,
                              ),
                              Text(":"),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${listAllDocs["nama"]}'),
                            ],
                          ),
                          SizedBox(height: 20),
                          //NoTelp
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("No Telepon"),
                              SizedBox(
                                width: 30,
                              ),
                              Text(":"),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${listAllDocs["noTelp"]}')
                            ],
                          ),
                          SizedBox(height: 20),
                          //Jenis Tiket
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Jenis Tiket"),
                              SizedBox(
                                width: 33,
                              ),
                              Text(":"),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${listAllDocs["jenisTiket"]}')
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Harga"),
                              SizedBox(
                                width: 64,
                              ),
                              Text(":"),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${listAllDocs["harga"]}')
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Tanggal Pesan"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(":"),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${listAllDocs["tanggal"]}')
                            ],
                          ),
                          SizedBox(height:40),
                          Text(
                            "STMIK WIDYA PRATAMA",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
