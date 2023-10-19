import 'package:flutter/material.dart';

import '../component/listmargin.dart';
import '../component/listukuran.dart';
import '../component/listwarna.dart';

class UcapanUltah extends StatefulWidget {
  @override
  State<UcapanUltah> createState() => _UcapanUltahState();
}

class _UcapanUltahState extends State<UcapanUltah> {
  final String ucapan =
      "Selamat Ulang Tahun, Della Ayuke Fika Siwi! Hari ini adalah hari spesial yang menandai awal dari babak baru dalam perjalanan hidupmu. Tepatnya usiamu yang ke-21! Semoga setiap tahun yang kamu lewati membawa lebih banyak kebahagiaan dan kesuksesan. Dengan tambahnya usiamu, semoga juga bertambahlah kedewasaan, kebijaksanaan, dan keberanianmu. Jadilah pribadi yang baik, yang selalu menginspirasi orang lain dengan kebaikan hatimu. Teruslah mengejar impianmu, karena langit tidak lagi menjadi batas.";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Ucapan dariku",
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
              ucapan,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: UkuranText.textsedang),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/orang.png",
            scale: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Untukmu",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: UkuranText.textbesar),
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
