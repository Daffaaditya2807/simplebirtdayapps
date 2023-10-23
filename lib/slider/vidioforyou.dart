import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
import 'package:video_player/video_player.dart';

import '../component/listukuran.dart';
import '../component/listwarna.dart';

class VidioForYou extends StatefulWidget {
  @override
  State<VidioForYou> createState() => _VidioForYouState();
}

class _VidioForYouState extends State<VidioForYou> {
  VideoPlayerController? _controllerVideo;
  Duration? videoDuration = Duration(milliseconds: 0);
  int? videoDurationInSeconds;
  @override
  void initState() {
    // TODO: implement initState
    _controllerVideo = VideoPlayerController.asset("assets/testt.mp4");

    _controllerVideo?.initialize().then((_) async {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("getDurasi")) {
        setState(() {
          _controllerVideo?.setLooping(true);
          _controllerVideo?.play();
        });
      } else {
        int? waktu = await getDurasi();
        _controllerVideo?.seekTo(Duration(seconds: waktu!));
        _controllerVideo?.play();
        _controllerVideo?.setLooping(true);
      }
    });

    // setState(() {
    //   _controllerVideo?.setLooping(true);
    //   _controllerVideo?.play();
    // });
    _controllerVideo?.setVolume(1.0);
    super.initState();
  }

  setGetDurasi({int? durasi}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("getDurasi", durasi!);
    // setState(() {});
  }

  Future<int?> getDurasi() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('getDurasi')) {
      int? durasi = prefs.getInt('getDurasi');
      return durasi;
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Posisi play : ${_controllerVideo?.value.position.inSeconds}");
    setGetDurasi(durasi: _controllerVideo?.value.position.inSeconds.toInt());
    _controllerVideo?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Vidio Untukmu",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: UkuranText.textbesar),
          ),
          SizedBox(
            height: ListMargin.margibbawahsedikit,
          ),
          Text(
            "vidio ini spesial untukmu , selamat menikmati\n masa masa yang indah",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: UkuranText.textsedang),
          ),
          SizedBox(
            height: ListMargin.margibbawah,
          ),
          Container(
              height: 280,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controllerVideo!.value.isPlaying
                        ? _controllerVideo?.pause()
                        : _controllerVideo?.play();
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: VideoPlayer(_controllerVideo!),
                ),
              )),
          SizedBox(
            height: ListMargin.margibbawahsedikit,
          ),
          // ValueListenableBuilder(
          //   valueListenable: _controllerVideo!,
          //   builder: (context, value, child) {
          //     return Text(value.position.toString());
          //   },
          // ),
          Container(
            width: 200,
            height: 20,
            child: SmoothVideoProgress(
              controller: _controllerVideo!,
              builder: (context, progress, duration, child) => Slider(
                value: progress.inMilliseconds.toDouble(),
                activeColor: ListWarna.biruBackground,
                label: "asu",
                onChangeStart: (_) => _controllerVideo?.pause(),
                onChangeEnd: (_) => _controllerVideo?.play(),
                min: 0,
                max: duration.inMilliseconds.toDouble(),
                onChanged: (value) {
                  _controllerVideo
                      ?.seekTo(Duration(milliseconds: value.toInt()));
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 5,
            runSpacing: 5,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ListWarna.biruBackground,
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
                    color: ListWarna.biruBackground,
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
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
