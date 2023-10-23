import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:greetingbirthdayforyou/component/listwarna.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final marginKananKiri = ListMargin.marginkanankiriframe;
    String kata_kata =
        "Aplikasi ini memang aku buat khusus buat kamu untuk ikut memeriahkan dan merayakan hari bahagiamu yang terjadi setiap satu tahun sekali. aku membuat aplikasi ini teringat dahulu saat aku belajar membuat aplikasi berbasis android aku pernah berkata padamu suatu saat kamu akan buatkan aplikasi untuk perayaan ulang tahunmu sebagai kado dan inilah waktunya juga kamu semoga suka ya.. maaf kalau terlihat biasa saja , karena aku membuat dibalik selah waktu luang dibalik kesibukan kuliah , Terima Kasih!!. jika kamu sudah membaca pada menu utama disitu sudah terdapat ucapan dan doa untuk kamu , semoga kamu jadi bertambah lebik lagi kedepannya dan meraih kesuksesan. Sekelai lagi aku ucapakan Selamat Ulang tahun untukmu untuk yang ke 21 :)";

    final widthsamping = mediaqueryWidth - marginKananKiri;
    return Scaffold(
      backgroundColor: ListWarna.biruBackground,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 220,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 50,
                    child: Container(
                      width: widthsamping,
                      height: 150,
                      decoration: BoxDecoration(
                          color: ListWarna.kuningBackground,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Della Ayuke Fika Siwi",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "28 Oktober 2023",
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                    maxRadius: 60,
                    backgroundImage: AssetImage("assets/della_2.jpg"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ListMargin.margibbawahsedikit,
            ),
            Container(
                width: widthsamping,
                decoration: BoxDecoration(
                    color: ListWarna.kuningBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    SizedBox(
                      height: ListMargin.margibbawahsedikit,
                    ),
                    Text(
                      "Tentang & Tujuan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: ListMargin.margibbawahsedikit,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: Colors.amberAccent.shade100),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Text(
                                "${kata_kata}",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: ListMargin.margibbawah,
                              ),
                              Text(
                                "WISH YOU ALL THE BEST",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: ListMargin.margibbawahsedikit,
                              ),
                              Text("#DARR28",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
