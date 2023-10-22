import 'package:flutter/material.dart';

import '../component/listmargin.dart';
import '../component/listukuran.dart';
import '../component/listwarna.dart';

class FactAboutYou extends StatefulWidget {
  @override
  State<FactAboutYou> createState() => _FactAboutYouState();
}

class _FactAboutYouState extends State<FactAboutYou> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "Fact About You",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: UkuranText.textbesar),
          ),
          // SizedBox(
          //   height: ListMargin.margibbawah,
          // ),
          Container(
            // color: Colors.blue,
            width: 270,
            child: Text(
              "Kamu telah berhasil melewati hidup dengan suka maupun duka , Bangga sekali bukan dengan  pencapaianmu semua itu dengan waktu yang  kau tempuh selama",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: UkuranText.textsedang),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/kadoTerbang.png",
            scale: 1,
          ),
          SizedBox(
            height: ListMargin.margibbawah + 20,
          ),
          Text(
            "7.670 hari",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: UkuranText.textbesar),
          ),
          Container(
            // color: Colors.blue,
            width: 270,
            child: Text(
              "waktu yang sangat lama bukan , banyak sekali kisah yang kamu ukir begitu hebatnya kamu bisa melewati masa masa yang sulit yang kemudian terdapat sebuah kebahagian dan kesanangan atas hasil yang kamu peroleh. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: UkuranText.textsedang),
            ),
          ),
          SizedBox(
            height: ListMargin.margibbawahsedikit,
          ),
          Container(
            decoration: BoxDecoration(
                color: ListWarna.biruBackground,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "#KamuHebat",
                style: TextStyle(fontSize: UkuranText.textkecil),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
