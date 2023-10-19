import 'dart:convert';
import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/listmargin.dart';
import '../component/listukuran.dart';
import '../component/listwarna.dart';

class PilihKado extends StatefulWidget {
  @override
  State<PilihKado> createState() => _PilihKadoState();
}

class _PilihKadoState extends State<PilihKado> {
  final List<String> hadiah = ["1", "2", "3"];
  final List<String> namaHadiah = ["CHATIME", "KFC", "PIZZA HUT"];
  int? selected;
  bool isTapped = false;
  String hadiahTerpilih = '';

  Future<void> setPreference({String? index, String? hadiah}) async {
    final jembatan = await SharedPreferences.getInstance();
    // if (jembatan.containsKey('myData')) {
    //   jembatan.clear();
    // }
    final myData = json.encode({
      'indx': index.toString(),
      'hdiah': hadiah.toString(),
      'isTapped': "true"
    });

    jembatan.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreference() async {
    final jembatan = await SharedPreferences.getInstance();
    if (jembatan.containsKey('myData')) {
      final myData = json.decode(jembatan.getString('myData').toString())
          as Map<String, dynamic>;

      hadiahTerpilih = myData['hdiah'].toString();
      selected = int.parse(myData['indx']);
      isTapped = myData['isTapped'] == "true" ? true : false;
    }
  }

  void _pilihHadiahAcak({String? indexx}) async {
    final random = Random();
    final index = random.nextInt(namaHadiah.length);
    final jembatan = await SharedPreferences.getInstance();
    setState(() {
      print("ini dalam method ${index}");
      if (!jembatan.containsKey("myData")) {
        hadiahTerpilih = namaHadiah[index];
        setPreference(
            index: indexx.toString(), hadiah: hadiahTerpilih.toString());
      } else {
        print("Data Sudah ada");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: getPreference(),
      builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Hadiah Untukmu",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: UkuranText.textbesar),
            ),
            SizedBox(
              height: ListMargin.margibbawahsedikit,
            ),
            Container(
              // color: Colors.blue,
              width: 270,
              child: Text(
                "Diharimu yang spesial ini kamu akan mendapatkan sebuah hadiah kecil dariku semoga kamu suka :)\n Pilih salah satu dibawah ya...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: UkuranText.textsedang),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                child: ListView.builder(
                    itemCount: hadiah.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              print("Tes is Tapped == ${isTapped}");
                              if (!isTapped) {
                                setState(() {
                                  selected = index;
                                });
                                print("tes sama ${selected}");
                                _pilihHadiahAcak(indexx: selected.toString());
                                // isTapped = true;
                              } else {
                                CherryToast.info(
                                  title: Text("Sudah memilih hadiah",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: UkuranText.textkecil)),
                                  animationType: AnimationType.fromTop,
                                  description: Text(
                                      "Hayy , kamu sudah memilih hadiah ayo tagih ke pengirim hadiah!!",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: UkuranText.textdesc)),
                                ).show(context);
                              }
                            },
                            child: Column(
                              children: [
                                selected == null
                                    ? Image.asset(
                                        "assets/pilihkado.png",
                                        width: 50,
                                        height: 50,
                                      )
                                    : index == selected
                                        ? Container(
                                            child: Image.asset(
                                              "assets/opengift.png",
                                              width: 50,
                                              height: 50,
                                            ),
                                          )
                                        : Image.asset("assets/pilihkado.png",
                                            width: 50, height: 50),
                                Text("${hadiah[index]}")
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Selamat Kamu Mendapatkan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: UkuranText.sedangbesar),
                  ),
                  SizedBox(
                    height: ListMargin.margibbawahsedikit,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () async {
                        // final jembatan = await SharedPreferences.getInstance();
                        // jembatan.clear();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ListWarna.biru,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                              child: Text(
                            "${hadiahTerpilih}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ListMargin.margibbawahsedikit,
                  ),
                  Container(
                    width: 270,
                    child: Text(
                      "klik tombol diatas agar kamu dapat kado yang telah kamu pilih",
                      style: TextStyle(fontSize: UkuranText.textsedang),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
