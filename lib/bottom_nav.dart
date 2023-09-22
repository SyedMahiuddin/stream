import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream/HomePage/home.dart';
import 'package:stream/appbar.dart';
import 'package:stream/booking.dart';
import 'package:stream/contact.dart';
import 'package:stream/reviews.dart';
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
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true, // Show labels for selected items
          showUnselectedLabels: true, //
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedFontSize: 15.sp,
          backgroundColor:Colors.red,
          currentIndex: selectedIndex,
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
    );
  }
}
