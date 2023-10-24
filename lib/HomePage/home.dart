import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stream/BookingPage/view/booking.dart';
import 'package:stream/GetPricing/view/getpricing.dart';
import 'package:stream/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:stream/privacy/privacy_page.dart';
import 'package:stream/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_html/flutter_html.dart';

import '../BookingPage/controller/booking_controller.dart';
import '../Terms and Conditions/terms_page.dart';
import '../bottom_nav/view/bottom_nav.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int selectedController = 0;
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

  List<String> images = [
    'images/nam2.png',
    'images/nam3.png',
    'images/nam1.png',
    'images/nam4.png',
    'images/nam5.png',
  ];

  List<String> names = [
    'Frandley Julien',
    'Frantz Francilien Telfort',
    'Merlyn Chery',
    'Kenny Francois',
    'MARIE HARRIS',
  ];

  List<String> reviews = [
    'I hired streamstek to handle social media communication and promotion for my law firm. The results were immediate. I was not amazed as Patrick Pluviose is a genius. Strongly recommend!!!',
    "Patrick and his team responded to our every need and went beyond what was required. We strongly recommend Streamstek & the High Level Marketing Team.",
        "Streamstek was really professional and I am very satisfied for my daughter 13 years birthday video and photography.",
        "The best ever to take your company to the next level.",
        'Streamtek team members are great! Patrick always makes the customers feel comfortable. His teams get along well with customers and collaborate to complete tasks.',
  ];

  List<String> imagePaths = ['images/audio.jpg', 'images/livecast.jpg'];
  int _currentImageIndex = 0;
  final CarouselController controller = CarouselController();
  int _animationCount = 0;
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  final String videoUrl = 'https://www.youtube.com/watch?v=B07MzA6IT58';
  bool isLoading = true;
  final webController = WebViewController();

  @override
  void initState() {
    webController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageFinished: (url) {
            setState(() {
              isLoading =
                  false; // Hide loading indicator when page is finished loading
            });
          },
          onPageStarted: (url) {
            setState(() {
              isLoading =
                  true; // Show loading indicator when page starts loading
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://player.restream.io/?token=0ee76f3eb79641ed9513df4893419742&autoplay=true&allowfullscreen=true"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Stack(
                children: [
                  Container(
                    height: 200.h,
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
                      height: 200.h,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.redAccent),
                    ),
                  ),
                  Positioned(
                      top: 20.h,
                      child: Container(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width - 20,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "TRUSTED MIAMI VIDEO PRODUCTION & Live Streaming COMPANY",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp),
                          maxLines: 4,
                          // textAlign: TextAlign.justify,
                        ),
                      )),
                  Positioned(
                    top: 70.h,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      // color: Colors.red,
                      child: StreamBuilder<int>(
                        stream: Stream<int>.periodic(
                            const Duration(seconds: 3), (i) => i),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            _animationCount = snapshot.data!;
                          }
                          return AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                "Streamstek IS YOUR LOCAL PARTNER FOR THE BEST CORPORATE VIDEO PRODUCTION, LIVE-STREAMING, PHOTOGRAPHY, EVENTS AND LUXURY LIFESTYLE ",
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              )
                            ],
                            onFinished: () {
                              setState(() {
                                _animationCount++;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                      top: 150.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0.sp),
                        child: Container(
                          height: 35.h,
                          width: 150.w,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: AppColors.primaryColor,
                              border: Border.all(color: Colors.transparent)),
                          child: Center(
                              child: FittedBox(
                            child: TextButton(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GetPricing()),
                              );
                            }, child: Text(
                              'Get Started',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),),

                            ),
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
              SizedBox(
                  width: MediaQuery.of(context).size.width - 30.w,
                  height: 180.h,
                  // child: IframeScreen(),
                  child: Stack(
                    children: [
                      WebViewWidget(controller: webController),
                      if (isLoading)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  )
                  // child: Html(data: '''<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.restream.io/?token=0ee76f3eb79641ed9513df4893419742" allow="autoplay" allowfullscreen frameborder="0" style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe></div>'''),

                  // Card(
                  //     elevation: 4.0,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: CustomVideoPlayer(
                  //       customVideoPlayerController: _customVideoPlayerController,
                  //     )),

                  //     child: Html(
                  //       data: '''
                  //   <div style="padding:56.25% 0 0 0;position:relative;"
                  //     <iframe src="https://player.restream.io/?token=0ee76f3eb79641ed9513df4893419742"
                  //       allow="autoplay" allowfullscreen frameborder="0"
                  //       style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe>
                  //   </div>
                  // ''',
                  //     ),
                  ),
              // Card(
              //   elevation: 4.0,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(15),
              //     child: YoutubePlayer(
              //       controller: _controller,
              //       showVideoProgressIndicator:
              //           true, // Customize the live indicator color
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                child: Card(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                            'https://streamstek.com/wp-content/uploads/2023/04/blog-live-hybrid-event-cover.webp'),
                      ),
                      Positioned(
                          top: 75,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width - 10,
                            child: Text(
                              '"IF A PICTURE IS WORTH A THOUSAND WORDS, THEN streamstek WILL LEAVE YOU SPEECHLESS"',
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
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
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30.w,
                height: 180.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: videoUrls.length,
                  itemBuilder: (context, index) {
                    String id = YoutubePlayer.convertUrlToId(videoUrls[index])!;
                    YoutubePlayerController controller2 =
                        YoutubePlayerController(
                            initialVideoId: id!,
                            flags: const YoutubePlayerFlags(
                              mute: false,
                              autoPlay: false,
                              disableDragSeek: true,
                              loop: false,
                              isLive: false,
                              forceHD: false,
                              enableCaption: false,
                            ));
                    if (index == selectedController) {
                      controller2.play();
                    } else {
                      controller2.pause();
                    }
                    return index == videoUrls.length - 1
                        ? SizedBox(
                            width: 270.w,
                            child: Center(
                              child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryColor),
                                  child: InkWell(
                                    onTap: () {
                                      _launchURL(
                                          "https://www.youtube.com/watch?v=CKjl4XYLBDU&list=PLL4lSgC-rRQmk4vWuei41zEEgD892sJGS");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          18, 8, 18, 8),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.white,
                                            size: 25.sp,
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Watch more",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              color: AppColors.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedController = index;
                                        });
                                      },
                                      child: YoutubePlayer(
                                        controller: controller2,
                                        showVideoProgressIndicator:
                                            true, // Customize the live indicator color
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
              // Card(
              //   elevation: 4.0,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(15),
              //     child: YoutubePlayer(
              //       controller: _controller,
              //       showVideoProgressIndicator:
              //           true, // Customize the live indicator color
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Text(
                'What Clients says',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: 'Poppins',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 240.0.h,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
                items: List.generate(images.length, (index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140.h,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                    Image.asset(images[index], height: 50.0.h, width: 50.0.w),
                                    SizedBox(width: 10.w),
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    reviews[index],
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width - 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        'VIDEO PRODUCTION PRICING',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        'MADE EASY',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        'streamstek is proud to be the only miami video production company - to offer an online brochure of creative services and pricing; that are designed to fit your goals, timeline, and budget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 550 ? 25 :  15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        'These are the same tools we use grow our business and lead the South Florida video production industry.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 550 ? 25 :  15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        "Simply choose from individual services, all-inclusive packages, or request a custom quote to get things started. It's really that easy to get high-quality content created; for businesses of all shapes and sizes.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 550 ? 25 :  15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Colors.red,
                      // height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: MediaQuery.of(context).size.width > 550 ? 16/5 : 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                        ),
                        items: imagePaths.map((imagePath) {
                          return Image.asset(
                            imagePath,
                            // height: 100,
                            width: 400,
                            fit: BoxFit.fill,
                          );
                        }).toList(),
                        carouselController: controller,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagePaths.asMap().entries.map((entry) {
                        int index = entry.key;
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentImageIndex == index
                                ? AppColors.primaryColor
                                : Colors.grey, // Active and inactive dot colors
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width > 550 ? 50 : 35,
                        width: MediaQuery.of(context).size.width > 550 ? 300: 150,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primaryColor,
                            border: Border.all(color: Colors.transparent)),
                        child: Center(
                            child: TextButton(
                                onPressed: () {
                                  BottomNavController btm = Get.find();
                                  btm.selectedIndex.value = 2;
                                  Get.offAll(() => BottomNavScreen());
                                },

                          child: Text(
                            'Get Pricing',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize:MediaQuery.of(context).size.width > 550 ? 25: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: SizedBox(
                  height: 120.h,
                  child: Column(
                    children: [
                      Text(
                        'Power of video',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Communication is the fine line between obscurity... '
                            'or dominating your market. And nothing is more powerful'
                            ' at convincing someone to take a predetermined action'
                            ' than watching a video. Video engages the senses, and awakens your emotions.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  // height: 150.0.h,
                    viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  aspectRatio: 14/9
                ),
                items: [
                  Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 100.0.h,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(15.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'VISUALLY STIMULATING',
                                    style: TextStyle(
                                      fontSize: 17.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Tell Your Story', // Review text
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Build Trust & Confidence', // Review text
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Demonstrate Products or Services ',
                                      // Review text
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 150.0.h,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'DIFFERENTIATE',
                                    style: TextStyle(
                                      fontSize: 17.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Stand Out From Your Competition ',
                                      // Review text
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Be Remembered & Respectede',
                                      // Review text
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Showcase Your Value Proposition ',
                                      // Review text
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Third container with different data
                  Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150.0.h,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(15.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'BOTTOM LINE',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 17.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Reduce Sales & Support Costs',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'More Engagement & Conversions ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Video Works for You 24/7  ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           height: 150.0,
              //           margin: const EdgeInsets.symmetric(horizontal: 10.0),
              //           decoration: BoxDecoration(
              //             color: Colors.white, // Customize the background color
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           child:  Padding(
              //             padding: EdgeInsets.all(8.0.sp),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   children: [
              //                     Text(
              //                       'VISUALLY STIMULATING',
              //                       style: TextStyle(
              //                         fontSize: 13.0.sp,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),

              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 5.0.h,
              //                 ),
              //                 Row(
              //                   children: [
              //                     Icon(Icons.arrow_circle_right_outlined),
              //                     Text(
              //                       'Tell Your Story',
              //                       style: TextStyle(
              //                         color: Colors.black, // Customize text color
              //                         fontSize: 16.0, // Customize text size
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child:Container(
              //           height: 150.0,
              //           margin: const EdgeInsets.symmetric(horizontal: 10.0),
              //           decoration: BoxDecoration(
              //             color: Colors.white, // Customize the background color
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           child: const Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Column(
              //                   children: [
              //                     Text(
              //                       'Nick Presley',
              //                       style: TextStyle(
              //                         fontSize: 15.0,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                     Text(
              //                       'Adelle Tracy',
              //                       style: TextStyle(fontSize: 13.0),
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 10.0, // Adjust spacing as needed
              //                 ),
              //                 Text(
              //                   'review',
              //                   style: TextStyle(
              //                     color: Colors.black, // Customize text color
              //                     fontSize: 16.0, // Customize text size
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(
              //           height: 150.0,
              //           margin: const EdgeInsets.symmetric(horizontal: 10.0),
              //           decoration: BoxDecoration(
              //             color: Colors.white, // Customize the background color
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           child: const Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Column(
              //                   children: [
              //                     Text(
              //                       'Nick Presley',
              //                       style: TextStyle(
              //                         fontSize: 15.0,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                     Text(
              //                       'Adelle Tracy',
              //                       style: TextStyle(fontSize: 13.0),
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 10.0, // Adjust spacing as needed
              //                 ),
              //                 Text(
              //                   'review',
              //                   style: TextStyle(
              //                     color: Colors.black, // Customize text color
              //                     fontSize: 16.0, // Customize text size
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),)
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 20.h,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivacyPage()),
                        );
                      },
                      child: Text('Privacy Policy ',style: TextStyle(color: Colors.grey),)),
                 Container(width: 10.w,child: Text('||',style: TextStyle(color: Colors.grey),),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TermsPage()),
                        );
                      },
                      child: Text('Terms & Condition',style: TextStyle(color: Colors.grey),)),

                ],
              ),
              SizedBox(
                height: 20.h,
              ),

              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10), color: Colors.white),
              //   height: 550.h,
              //   width: MediaQuery.of(context).size.width - 20,
              //   child: Row(
              //     children: [
              //
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
