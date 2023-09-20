import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12.h,),
            Stack(
              children: [
                Container(
                  height: 180.h,
                  width: MediaQuery.of(context).size.width-20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.redAccent
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("images/concert.gif",fit: BoxFit.fill,),
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 180.h,
                    width: MediaQuery.of(context).size.width-20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.redAccent
                    ),
                  ),
                ),
                Positioned(
                    child: Column(
                      children: [
                  Text("TRUSTED MIAMI VIDEO PRODUCTION & Live Streaming COMPANY",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 16.sp),),
                        Text("TRUSTED MIAMI VIDEO PRODUCTION & Live Streaming COMPANY",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)

                      ],
                    ))
              ],
            )

          ],
        ),
      ),
    );
  }
}
