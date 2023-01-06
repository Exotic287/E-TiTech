import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticket/view/client/titech.dart';
import 'package:e_ticket/view/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import 'package:intl/intl.dart';

class AuthController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime tgl = DateTime.now();
  // String formatTgl = DateFormat('dd-MM-yyyy - HH:mm').format(tgl);
  var harga;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // Cloud Database
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference order = firestore.collection("pesanan");
    return order.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRefOrder = firestore.collection("pesanan").doc(docID);
    return docRefOrder.get();
  }

  Future<QuerySnapshot<Object?>> ambilData() async {
    CollectionReference order = firestore.collection("pesanan");
    return order.get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> ambilId(String idu) async {
    var id =
        await firestore.collection("pesanan").where("userId", isEqualTo: idu);
    return id.get();
  }

  void tambahPesanan(
      String nama, String noTelp, String jenisTiket, String uId) async {
    CollectionReference order = firestore.collection("pesanan");

    if (jenisTiket == 'VIP') {
      harga = "100.000";
    } else {
      harga = "50.000";
    }

    try {
      await order.add({
        "userId": uId,
        "nama": nama,
        "noTelp": noTelp,
        "jenisTiket": jenisTiket,
        "tanggal": DateFormat('dd-MM-yyyy - HH:mm').format(tgl).toString(),
        "harga": harga
      });

      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Berhasil Menambahkan Pesanan',
          onConfirm: () => Get.to(() => MainPage()),
          textConfirm: 'Oke');
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak Berhasil Menambah Pesanan!");
    }
  }

  // Autentikasi

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Map<String, dynamic> infoUserMap = {'email': email, 'password': password};
      if (myUser.user!.emailVerified) {
        Get.to(() => MainPage());
      } else {
        Get.defaultDialog(
          title: 'Verification Email',
          middleText:
              'Kamu Perlu Veritifikasi Email Terlebih Dahulu, Apakah Ingin Dikirim Veritifikasi Ulang ?',
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: 'Kirim Ulang',
          textCancel: 'Kembali',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DInfo.dialogError('Email Tidak Ditemukan');
      } else if (e.code == 'wrong-password') {
        DInfo.dialogError('Password Salah');
      } else {
        DInfo.dialogError('Gagal Login');
      }
      DMethod.printTitle('Autentikasi Firebase', e.code);
      DInfo.closeDialog();
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: 'Verification Email',
          middleText: 'Veritifikasi Email Sudah Dikirim ke $email',
          onConfirm: () {
            Get.back();
            Get.to(() => LoginPage());
          },
          textConfirm: 'Ya, Saya Cek Email.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DInfo.dialogError('Password Minimal-6');
      } else if (e.code == 'email-already-in-use') {
        DInfo.dialogError('Email Sudah Digunakan');
      } else {
        DInfo.dialogError('Gagal Register');
      }
      DMethod.printTitle('Kesalahan Register', e.code);
      // DInfo.dialogError('Gagal Register');
      DInfo.closeDialog();
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.to(() => LoginPage());
  }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Telah Dikirim Email Reset Password ke $email',
            onConfirm: () {
              Get.back();
              Get.to(() => LoginPage());
            },
            textConfirm: 'Ya');
      } catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Tidak Dapat Mengirim Email Reset Password',
        );
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: 'Email Tidak Valid');
    }
  }
}
