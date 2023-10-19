import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:greetingbirthdayforyou/component/listukuran.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

import '../component/listwarna.dart';

class SertaMulia extends StatefulWidget {
  @override
  State<SertaMulia> createState() => _SertaMuliaState();
}

class _SertaMuliaState extends State<SertaMulia> {
  DateTime target = DateTime(2023, 10, 14);

  String? betweenDays() {
    DateTime target = DateTime(2023, 10, 20);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fd = formatter.format(DateTime.now());

    DateTime getformat = DateFormat('yyyy-MM-dd').parse(fd);
    print("Belum format ${DateTime.now()}");
    print("Setelah format ${getformat}");

    if (target.isAtSameMomentAs(getformat)) {
      return "Tepat pada hari ini";
    } else if (target.isAfter(getformat)) {
      var p = target.difference(getformat).inDays;
      return "${p.toString()} hari yang telah berlalu";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          "Serta Mulia",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: UkuranText.fullbesar),
        ),
        SizedBox(
          height: ListMargin.margibbawah,
        ),
        Text(
          "Aku yakin ini adalah hari spesialmu pada",
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
        Text(
          "28 Oktober 2023",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ListMargin.margibbawahsedikit,
        ),
        Container(
          decoration: BoxDecoration(
              color: ListWarna.biruBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "${betweenDays()}",
              style: TextStyle(fontSize: UkuranText.textdesc),
            ),
          ),
        ),
        Lottie.asset("assets/cakee.json", width: 180, height: 180),
        SizedBox(
          height: ListMargin.margibbawah + 20,
        ),
        Text("Yah udah nambah angka nihhh :)")
      ],
    );
  }
}
