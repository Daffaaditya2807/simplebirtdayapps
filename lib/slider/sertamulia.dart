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
  String? betweenDays() {
    DateTime target = DateTime(2023, 10, 28);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fd = formatter.format(DateTime.now());

    DateTime getformat = DateFormat('yyyy-MM-dd').parse(fd);
    print("Belum format ${DateTime.now()}");
    print("Setelah format ${getformat}");

    if (target.isAtSameMomentAs(getformat)) {
      return "Tepat pada hari ini";
    } else if (getformat.isAfter(target)) {
      var p = getformat.difference(target).inDays;
      return "${p.toString()} hari yang telah berlalu";
    } else {
      return "kosong";
    }
  }

  @override
  Widget build(BuildContext context) {
    String check = betweenDays().toString();
    print("halo dek ${check}");
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
        check != "kosong"
            ? Container(
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
              )
            : Container(),
        Lottie.asset("assets/cakee.json", width: 180, height: 180),
        SizedBox(
          height: ListMargin.margibbawah + 20,
        ),
        Text("Yah udah nambah angka nihhh :)")
      ],
    );
  }
}
