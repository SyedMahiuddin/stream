import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _launchDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    await launch(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                _launchDialer('+1 (954) 625-9123');
              },
                child: Image.asset("images/call.gif")),
            SizedBox(height: 10.h,),
             Text('Contact for free Consulting',style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
