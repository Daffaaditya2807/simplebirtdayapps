import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:greetingbirthdayforyou/component/listukuran.dart';

import '../component/listwarna.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nama = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController bulan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ListWarna.biruBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ListWarna.kuningBackground,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Masuk",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: UkuranText.textbesar),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Gunakan nama depan dan tanggal lahir hari , bulan untuk masuk. Kamu tidak perlu mendaftar ya..",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: ListMargin.margibbawah,
                    ),
                    Text("Nama Kamu"),
                    SizedBox(
                      height: ListMargin.margibbawahsedikit,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: ListWarna.biruBackground, width: 2.0)),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "5 huruf",
                        fillColor: Colors.white70,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z]')), // Hanya menerima angka
                        LengthLimitingTextInputFormatter(
                            5), // Batasan panjang maksimal 2 karakter
                      ],
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: nama,
                      style: TextStyle(fontSize: UkuranText.textsedang),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tanggal lahir kamu"),
                            SizedBox(
                              height: ListMargin.margibbawahsedikit,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: ListWarna.biruBackground,
                                        width: 2.0)),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "2 angka",
                                fillColor: Colors.white70,
                              ),
                              style: TextStyle(fontSize: UkuranText.textsedang),
                              controller: tanggal,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Hanya menerima angka
                                LengthLimitingTextInputFormatter(
                                    2), // Batasan panjang maksimal 2 karakter
                              ],
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            )
                          ],
                        )),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" Bulan lahir kamu"),
                            SizedBox(
                              height: ListMargin.margibbawahsedikit,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: ListWarna.biruBackground,
                                        width: 2.0)),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "2 Angka",
                                fillColor: Colors.white70,
                              ),
                              style: TextStyle(fontSize: UkuranText.textsedang),
                              controller: bulan,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Hanya menerima angka
                                LengthLimitingTextInputFormatter(
                                    2), // Batasan panjang maksimal 2 karakter
                              ],
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (value) {
                                String namaLog = nama.text;
                                String tanggalLog = tanggal.text;
                                String bulanLog = bulan.text;

                                print(
                                    "nama : ${namaLog}\n tanggal : ${tanggalLog}\n bulan : ${bulanLog}");

                                if (namaLog.isEmpty ||
                                    tanggalLog.isEmpty ||
                                    bulanLog.isEmpty) {
                                  CherryToast.info(
                                    title: Text(
                                      "Harap isi kolomnya ya",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    animationType: AnimationType.fromTop,
                                    toastDuration: Duration(milliseconds: 2000),
                                    animationDuration:
                                        Duration(milliseconds: 1000),
                                    description: Text(
                                      "juga pastikan sesuai dengan clue...",
                                      style: TextStyle(
                                          fontSize: UkuranText.textsedang),
                                    ),
                                  ).show(context);
                                } else {
                                  if (namaLog == "Della" &&
                                      bulanLog == "10" &&
                                      tanggalLog == "28") {
                                    print("benar");
                                    Navigator.pushReplacementNamed(
                                        context, "/barbawah");
                                  } else {
                                    CherryToast.info(
                                      title: Text(
                                        "Salah",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      animationType: AnimationType.fromTop,
                                      toastDuration:
                                          Duration(milliseconds: 2000),
                                      animationDuration:
                                          Duration(milliseconds: 1000),
                                      description: Text(
                                        "Pastikan mengisi sesuai dengan clue...",
                                        style: TextStyle(
                                            fontSize: UkuranText.textsedang),
                                      ),
                                    ).show(context);
                                  }
                                }
                              },
                            )
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String namaLog = nama.text;
                        String tanggalLog = tanggal.text;
                        String bulanLog = bulan.text;

                        print(
                            "nama : ${namaLog}\n tanggal : ${tanggalLog}\n bulan : ${bulanLog}");

                        if (namaLog.isEmpty ||
                            tanggalLog.isEmpty ||
                            bulanLog.isEmpty) {
                          CherryToast.info(
                            title: Text(
                              "Harap isi kolomnya ya",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            animationType: AnimationType.fromTop,
                            toastDuration: Duration(milliseconds: 2000),
                            animationDuration: Duration(milliseconds: 1000),
                            description: Text(
                              "juga pastikan sesuai dengan clue...",
                              style: TextStyle(fontSize: UkuranText.textsedang),
                            ),
                          ).show(context);
                        } else {
                          if (namaLog == "Della" &&
                              bulanLog == "10" &&
                              tanggalLog == "28") {
                            print("benar");
                            Navigator.pushReplacementNamed(
                                context, "/barbawah");
                          } else {
                            CherryToast.info(
                              title: Text(
                                "Salah",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              animationType: AnimationType.fromTop,
                              toastDuration: Duration(milliseconds: 2000),
                              animationDuration: Duration(milliseconds: 1000),
                              description: Text(
                                "Pastikan mengisi sesuai dengan clue...",
                                style:
                                    TextStyle(fontSize: UkuranText.textsedang),
                              ),
                            ).show(context);
                          }
                        }
                      },
                      child: Text(
                        "Lanjut",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: ListWarna.biruBackground),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
