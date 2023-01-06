import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/view/client/detail.dart';
import 'package:e_ticket/view/client/titech.dart';
import 'package:e_ticket/view/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananPage extends StatelessWidget {
  final authC = Get.find<AuthController>();
  var userId;

  @override
  Widget build(BuildContext context) {
    final user = authC.auth.currentUser;
    final oke = user!.uid.toString();
    userId = oke;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => {Get.to(() => MainPage())}),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text('Pesanan'),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
        future: authC.ambilData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var listAllDocs = snapshot.data!.docs;
            // var hasilid = authC.ambilId(userId);
            // print(hasilid);
            // print(userId);
            // if (hasilid==userId) {
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Get.to(() => detailOrder(), arguments: listAllDocs[index].id);
                },
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["jenisTiket"]}"),
              ),
            );
            // }
          }
          return Center(
            // print(userId);
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
