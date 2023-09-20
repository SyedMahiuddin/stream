import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String videoURl = 'https://www.youtube.com/watch?v=D3UnvGw87zA';
  List<String> videoUrls = [
    'https://www.youtube.com/watch?v=D3UnvGw87zA',
    'https://www.youtube.com/watch?v=B07MzA6IT58',
    'https://www.youtube.com/watch?v=sYbPH9xueps',
    'https://www.youtube.com/watch?v=xWDH-ycYMSI',
    'https://www.youtube.com/watch?v=BZPsTyVOKKA',
    'https://www.youtube.com/watch?v=82W11IdF_yw',
    'https://www.youtube.com/watch?v=98wIbzubiaY'
  ];
  late YoutubePlayerController _controller;

  List<String> reviews = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla venenatis quam in odio fringilla malesuada.",
    "In et tortor vitae quam ultrices convallis. Ut a elit eu neque facilisis volutpat ut nec lorem.",
    "Pellentesque vel ligula eu urna ullamcorper venenatis eget ac leo. Sed eget enim sed elit tempus placerat.",

  ];

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURl);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Stack(
              children: [
                Container(
                  height: 195.h,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.redAccent),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "images/concert.gif",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 195.h,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.redAccent),
                  ),
                ),
                Positioned(
                    top: 40.h,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.sp),
                          child: Text(
                            "TRUSTED MIAMI VIDEO PRODUCTION & \nLive Streaming COMPANY",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 16.sp),
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    top: 90.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0.sp),
                      child: AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          "Streamstek IS YOUR LOCAL PARTNER FOR THE BEST \nCORPORATE VIDEO PRODUCTION, LIVE-STREAMING, \nPHOTOGRAPHY, EVENTS AND LUXURY LIFESTYLE ",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Colors.white),
                        )
                      ], totalRepeatCount:40 ),
                    )),
                Positioned(
                    top: 150.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0.sp),
                      child: Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            color: AppColors.primaryColor,
                            border: Border.all(color: Colors.transparent)),
                        child: Center(
                            child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Live Straming',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator:
                      true, // Customize the live indicator color
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),

            Card(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                        'https://streamstek.com/wp-content/uploads/2023/04/blog-live-hybrid-event-cover.webp'),
                  ),
                  Positioned(
                    top: 75.h,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 20.0.sp),
                        child: Text(
                    '"IF A PICTURE IS WORTH A THOUSAND WORDS, \nTHEN streamstek WILL LEAVE YOU SPEECHLESS"',maxLines: 2,
                    style: TextStyle(color: Colors.white,fontSize: 15.sp,fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                  ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 10.h,),

            Center(
              child: Column(
                children: [
                  Text(
                    'UNMATCHED QUALITY & EXPERIENCE',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'watch our demo reels below',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator:
                  true, // Customize the live indicator color
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              'What Clients says',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0, // Adjust the height as needed
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: reviews.map((review) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Customize the background color
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person,size: 50.sp,),
                                  SizedBox(width: 3.w,),
                                  Column(
                                    children: [
                                      Text('Nick Presley',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                      Text('Adelle Tracy',style: TextStyle(fontSize: 13.sp),),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Text(
                                review,
                                style: TextStyle(
                                  color: Colors.black, // Customize text color
                                  fontSize: 16.0, // Customize text size
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 12.h,
            ),
            // SizedBox(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //       itemCount: 10,
            //       itemBuilder: (context,index){
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(15),
            //       child: YoutubePlayer(
            //         controller: _controller,
            //         showVideoProgressIndicator:
            //         true, // Customize the live indicator color
            //       ),
            //     );
            //   }),
            // )
          ],
        ),
      ),
    );
  }

}
