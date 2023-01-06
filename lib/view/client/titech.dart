import 'package:e_ticket/view/client/order.dart';
import 'package:e_ticket/view/client/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class MainPage extends StatelessWidget {
  // const MainPage({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 215, 223),
        leading: IconButton(
          onPressed: () => {
            Get.to(()=>PesananPage())
          },
          icon: const Icon(Icons.shopping_cart),
        ),
        title: Text("E-TiTech"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Stack(
              children:<Widget> [
                //Sebagai Bacground
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tulus.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                  //Kata Tulus
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0,),
                        Text(
                          'TULUS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        //Gambar Tulus
                        Container(
                          width: 250,
                          height: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/Tulus.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.85), BlendMode.dstATop)
                            )
                          ),
                        ),
                        SizedBox(height: 20,),
                        // Button Order Now
                         Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(217, 255, 255, 255)
                            ),
                            child: MaterialButton(
                              minWidth: 180.0,
                              height: 42.0,
                              onPressed: ()=> {
                                Get.to(() => OrderPage())
                              },
                              child: Text(
                                'Order Now',
                                style: TextStyle(
                                  fontSize: 23
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:30),
                          //Tulisan Live Konser
                          Text(
                            'LIVE IN CONCERT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                          ),
                          // Tulisan Kampus 
                          Text(
                            'KAMPUS STMIK WIDYA PRATAMA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:3),
                          Text(
                            '1 JANUARI 2030',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:30),
                          Text(
                            'OTHER BAND',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:10),
                          Text(
                            'TOFU CIRCLE - BARLEND - SANDVIAS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:3),
                          Text(
                            'UKM MUSIC EL FATA - UKM GEMA NADA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:3),
                          Text(
                            'UKM MUSIK UNIVERSITAS PEKALONGAN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          //Tanggal                          
                          SizedBox(height:20),
                          // Tulisan More Info
                          Text(
                            'More Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          // No HP
                          Text(
                            '087723226332 | 08233238672',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:40),
                          //Tulisan Support
                          Text(
                            'SUPPORT BY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Color.fromARGB(142, 0, 0, 0)
                            ),
                          ),
                          SizedBox(height:10),
                          //Logo - Logo Suport
                          Column(
                            children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[ 
                                  // Live Music
                                  Container(
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/bm.jpg'),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                  // Koperasi Simpan Pinjam
                                  Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/kop.png'),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                  

                                ],
                              )
                            ],
                          ),
                          SizedBox(height:30),                                  
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
