import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:greetingbirthdayforyou/component/listukuran.dart';
import 'package:greetingbirthdayforyou/component/listwarna.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../model/ultah.dart';

class IntroAwal extends StatefulWidget {
  @override
  State<IntroAwal> createState() => _IntroAwalState();
}

class _IntroAwalState extends State<IntroAwal> {
  CountdownTimerController? controllerwaktu;

  @override
  void initState() {
    // TODO: implement initState
    final birthdayModel = Provider.of<BirthdayModel>(context, listen: false);
    controllerwaktu = CountdownTimerController(
        endTime: birthdayModel.birthday.millisecondsSinceEpoch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final birthdayModel = Provider.of<BirthdayModel>(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 207, 234),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ListMargin.marginkanankiriframe),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ListWarna.kuningBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Lottie.asset("assets/jam.json", width: 125, height: 125),
                    Text(
                      "Menunggu waktu mencapai hari spesialmu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: ListMargin.margibbawahsedikit,
                    ),
                    Text(
                      "Harap sabar ya , jika waktu sudah selesai maka kamu dapat melanjutkan ke menu berikutnya",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: UkuranText.textsedang),
                    ),
                    SizedBox(
                      height: ListMargin.margibbawah,
                    ),
                    CountdownTimer(
                      // endTime: birthdayModel.endTime.millisecondsSinceEpoch,
                      textStyle: TextStyle(fontSize: 48, color: Colors.red),
                      widgetBuilder: (context, time) {
                        if (time == null) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Yeyy, Silakan sekarang kamu dapat tekan tombol lanjut dibawah :)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: UkuranText.textsedang),
                              ),
                            ),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("${time.days} Hari"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("${time.hours} Jam"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("${time.min} Menit"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("${time.sec} detik"),
                                ),
                              )
                            ],
                          );
                        }
                      },
                      controller: controllerwaktu,
                      onEnd: () {
                        CherryToast.info(title: Text("waktu Habis"))
                            .show(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                if (controllerwaktu?.isRunning == true) {
                  print("asu");
                  CherryToast.info(
                    title: Text(
                      "Sabar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    animationType: AnimationType.fromTop,
                    toastDuration: Duration(milliseconds: 2000),
                    animationDuration: Duration(milliseconds: 1000),
                    description: Text(
                      "Tunggu waktunya selesai kamu dapat mengakses tombol lanjut",
                      style: TextStyle(fontSize: UkuranText.textsedang),
                    ),
                  ).show(context);
                } else {
                  Navigator.pushReplacementNamed(context, "/login");
                }
              },
              child: Text(
                "Lanjut",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: ListWarna.kuningBackground),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
