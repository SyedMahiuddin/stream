import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:stream/HomePage/home.dart';
import 'package:stream/appbar.dart';
import 'package:stream/BookingPage/view/booking.dart';
import 'package:stream/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:stream/contact.dart';
import 'package:stream/ReviewPage/view/reviews.dart';
import 'package:stream/ticket.dart';

class BottomNavScreen extends StatefulWidget {
  static const String routeName="bottompage";
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}
int selectedIndex = 0;
class _BottomNavScreenState extends State<BottomNavScreen> {

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    TicketScreen(),
    BookingScreen(),
    ReviewScreen(),
    ContactScreen(),
  ];

  void _onItemTapped(int index) {
    BottomNavController bottomNavController = Get.find();
    bottomNavController.selectedIndex.value = index;
    // indexsetState(() {
    //   selectedIndex = index;
    // });
  }
  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return SafeArea(
      child: Obx( () =>
        Scaffold(
          appBar: CustomAppBar(),
          body: Center(
            child: _widgetOptions.elementAt(bottomNavController.selectedIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true, // Show labels for selected items
            showUnselectedLabels: true, //
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            selectedFontSize: 15.sp,
            backgroundColor:Colors.red,
            currentIndex: bottomNavController.selectedIndex.value,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.black,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket_outlined,color: Colors.black,),
                label: 'Ticket',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event,color: Colors.black,),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.reviews_outlined,color: Colors.black,),
                label: 'Review',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.phone,color: Colors.black,),
                label: 'Contact',
              ),

            ],
            // selectedLabelStyle: TextStyle(color: Color(0xFFF31A54)),
            // unselectedLabelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
