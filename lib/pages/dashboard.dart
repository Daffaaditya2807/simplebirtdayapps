import 'dart:async';
import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:greetingbirthdayforyou/component/listukuran.dart';
import 'package:greetingbirthdayforyou/component/listwarna.dart';
import 'package:video_player/video_player.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String loremIpsumText =
      """Selamat Ulang Tahun, Della Ayuke Fika Siwi! Hari ini adalah hari spesial yang menandai awal dari babak baru dalam perjalanan hidupmu. Tepatnya usiamu yang ke-21! Semoga setiap tahun yang kamu lewati membawa lebih banyak kebahagiaan dan kesuksesan.

Dengan tambahnya usiamu, semoga juga bertambahlah kedewasaan, kebijaksanaan, dan keberanianmu. Jadilah pribadi yang baik, yang selalu menginspirasi orang lain dengan kebaikan hatimu. Teruslah mengejar impianmu, karena langit tidak lagi menjadi batas.

Kami mendoakan agar setiap langkahmu selalu dilindungi, setiap impianmu tercapai, dan setiap harimu penuh kebahagiaan. Semoga cinta dan kasih sayang selalu menyertai perjalanan hidupmu.
 """;
  final List<String> hadiah = ["1", "2", "3"];
  final List<String> namaHadiah = ["CHATIME", "KFC", "PIZZA HUT"];
  int? selected;
  bool isTapped = false;
  VideoPlayerController? _controllerVideo;

  Timer? _timer;
  bool onTouch = true;

  @override
  void initState() {
    // TODO: implement initState
    _controllerVideo = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    //_controllerVideo = VideoPlayerController.asset("videos/sample_video.mp4");

    _controllerVideo?.setLooping(true);
    _controllerVideo?.initialize().then((_) {
      setState(() {
        // _controllerVideo?.play();
      });
    });
    _controllerVideo?.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerVideo?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String hadiahTerpilih = '';
  void _pilihHadiahAcak() {
    final random = Random();
    final index = random.nextInt(namaHadiah.length);
    setState(() {
      hadiahTerpilih = namaHadiah[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ListMargin.marginkanankiriframe),
        child: ListView(
          children: [
            SizedBox(
              height: ListMargin.margibbawah,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Malam",
                      style: TextStyle(fontSize: UkuranText.textkecil),
                    ),
                    Text(
                      "Ryan James pangariban",
                      style: TextStyle(
                          fontSize: UkuranText.textsedang,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                CircleAvatar()
              ],
            ),
            SizedBox(
              height: ListMargin.margibbawah,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saya Yakin ini adalah hari Spesialmu",
                        style: TextStyle(fontSize: UkuranText.textbesar),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "28",
                            style: TextStyle(
                                fontSize: UkuranText.fullbesar,
                                color: ListWarna.pink,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: ListMargin.margibbawahsedikit,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Oktober",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ListWarna.biru,
                                      fontSize: UkuranText.sedangbesar),
                                ),
                                Text("2023",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ListWarna.biru,
                                        fontSize: UkuranText.sedangbesar))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Image.asset("assets/cake.png")
              ],
            ),
            SizedBox(
              height: ListMargin.margibbawahtext,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 190),
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                    color: ListWarna.pink,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Row(
              children: [
                Text(
                  "#VidioForYou",
                  style: TextStyle(
                      fontSize: UkuranText.sedangbesar,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                        color: ListWarna.biru,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ListMargin.margibbawah,
            ),
            VidioForYou(),
            SizedBox(
              height: ListMargin.margibbawah,
            ),
            FactAboutYou(),
            GreetingForYou(),
            GiveForYou(),
            SizedBox(
              height: ListMargin.margibbawah,
            )
          ],
        ),
      ),
    );
  }

  Widget GreetingForYou() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#GreetingsForYou",
            style: TextStyle(
                fontSize: UkuranText.sedangbesar, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ListMargin.margibbawah,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: DropCapText(
                loremIpsumText,
                dropCapPadding: EdgeInsets.all(5),
                style: TextStyle(fontSize: UkuranText.textkecil),
                dropCapPosition: DropCapPosition.start,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget FactAboutYou() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#FactAboutYou",
            style: TextStyle(
                fontSize: UkuranText.sedangbesar, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ListMargin.margibbawah,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2002 - 2023",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: UkuranText.textbesar),
                        ),
                        Text(
                          "Kamu telah berhasil melewati hidup dengan suka maupun duka , Bangga sekali bukan dengan pencapaianmu semua itu dengan waktu yang kau tempuh selama",
                          style: TextStyle(fontSize: UkuranText.textkecil),
                        ),
                        SizedBox(
                          height: ListMargin.margibbawahsedikit,
                        ),
                        Text(
                          "7.657 Hari",
                          style: TextStyle(
                              fontSize: UkuranText.textbesar,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ListWarna.biru,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "#kamuHebat",
                              style: TextStyle(fontSize: UkuranText.textkecil),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Image.asset("assets/kadoTerbang.png"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget GiveForYou() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#GiveForYou",
            style: TextStyle(
                fontSize: UkuranText.sedangbesar, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ListMargin.margibbawah,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilih salah satu kado dibawah",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: UkuranText.sedangbesar),
                  ),
                  Text(
                    "Diharimu yang spesial ini kamu akan mendapatkan sebuah hadiah kecil dariku semoga kamu suka :)",
                    style: TextStyle(fontSize: UkuranText.textkecil),
                  ),
                  SizedBox(
                    height: ListMargin.margibbawahsedikit,
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
                                    if (!isTapped) {
                                      setState(() {
                                        selected = index;
                                        print(selected);
                                      });
                                      _pilihHadiahAcak();
                                      isTapped = true;
                                    } else {
                                      CherryToast.info(
                                        title: Text("Sudah memilih hadiah",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    UkuranText.textkecil)),
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
                                          ? Image.asset("assets/pilihkado.png")
                                          : index == selected
                                              ? Container(
                                                  child: Image.asset(
                                                    "assets/opengift.png",
                                                    width: 46,
                                                    height: 42,
                                                  ),
                                                )
                                              : Image.asset(
                                                  "assets/pilihkado.png"),
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
                    width: double.infinity,
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
                          child: Container(
                            width: double.infinity,
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
                        SizedBox(
                          height: ListMargin.margibbawahsedikit,
                        ),
                        Text(
                          "klik tombol diatas agar kamu dapat kado yang telah kamu pilih",
                          style: TextStyle(fontSize: UkuranText.textkecil),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget VidioForYou() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Another People",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: UkuranText.textbesar),
                    ),
                    Text(
                      "Vidio ini spesial untukmu , selamat menikmati masa masa yang indah",
                      style: TextStyle(fontSize: UkuranText.textkecil),
                    ),
                    SizedBox(
                      height: ListMargin.margibbawahsedikit,
                    ),
                    Container(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.heart_broken,
                                size: 15,
                                color: Colors.red,
                              ),
                              Text(
                                "2810",
                                style:
                                    TextStyle(fontSize: UkuranText.textkecil),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.comment_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text("2002",
                                  style:
                                      TextStyle(fontSize: UkuranText.textkecil))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.share_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text("21",
                                  style:
                                      TextStyle(fontSize: UkuranText.textkecil))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ListMargin.margibbawah,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ListWarna.biru,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "#Birthday",
                              style: TextStyle(fontSize: UkuranText.textkecil),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ListWarna.pink,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "#LevelUp",
                              style: TextStyle(fontSize: UkuranText.textkecil),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ListWarna.kuning,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "#WYATB",
                              style: TextStyle(fontSize: UkuranText.textkecil),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _controllerVideo!.value.isInitialized
                      ? Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controllerVideo!.value.isPlaying
                                      ? _controllerVideo?.pause()
                                      : _controllerVideo?.play();
                                });
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: VideoPlayer(_controllerVideo!)),
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
