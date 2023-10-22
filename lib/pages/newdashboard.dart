import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/component/listmargin.dart';
import 'package:greetingbirthdayforyou/component/listwarna.dart';
import 'package:greetingbirthdayforyou/slider/factaboutyou.dart';
import 'package:greetingbirthdayforyou/slider/pilihkado.dart';
import 'package:greetingbirthdayforyou/slider/sertamulia.dart';
import 'package:greetingbirthdayforyou/slider/ucapanultah.dart';
import 'package:greetingbirthdayforyou/slider/vidioforyou.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardNew extends StatefulWidget {
  @override
  State<DashboardNew> createState() => _DashboardNewState();
}

class _DashboardNewState extends State<DashboardNew> {
  final CarouselController _controller = CarouselController();
  int current = 0;
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      return 'Pagi';
    } else if (hour < 14) {
      return 'Siang';
    } else if (hour < 18) {
      return 'Sore';
    } else {
      return 'Malam';
    }
  }

  List<Widget> SliderPage = [
    SertaMulia(),
    VidioForYou(),
    FactAboutYou(),
    UcapanUltah(),
    PilihKado()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ListWarna.biruBackground,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ListMargin.marginkanankiriframe),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat ${greeting().toString()}👋",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Della Ayuke Fika Siwi",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/della_2.jpg"),
                    maxRadius: 25,
                  )
                ],
              ),
              // SizedBox(
              //   height: ListMargin.margibbawah,
              // ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                // height: 600,
                decoration: BoxDecoration(
                    color: ListWarna.kuningBackground,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        items: SliderPage.map((item) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [item],
                            )).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1.5,
                          enableInfiniteScroll: false,
                          height: 440,
                          aspectRatio: 16 / 9,
                          // enlargeFactor: 0.3,
                          // enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                          },
                        ),
                        carouselController: _controller,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: current,
                        count: SliderPage.length.toInt(),
                        effect: CustomizableEffect(
                            dotDecoration: DotDecoration(
                                width: 15,
                                height: 12,
                                borderRadius: BorderRadius.circular(10)),
                            activeDotDecoration: DotDecoration(
                                width: 32,
                                height: 12,
                                color: Colors.pink.shade200,
                                borderRadius: BorderRadius.circular(10))),
                        onDotClicked: (index) {
                          _controller.animateToPage(index);
                        },
                      ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
              // SizedBox(
              //   height: 40,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
