import 'package:flutter/material.dart';

import 'package:hospital_app/ui/landing_page/navigasi_bar/booking_page.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/home_page.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/layanan_page.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/more_floatingButton.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/profile_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final _layoutPage = [
    HomePage(),
    LayananPage(),
    BookingPage(),
    ProfilePage(),
    MooreButton()
  ];

  void _onTabItem(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Image.asset(
                      "assets/navigasi_bar/home.png",
                      color: Colors.blue,
                    )
                  : Image.asset(
                      "assets/navigasi_bar/home.png",
                    ),
              title: Text(
                "Home",
                style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset(
                      "assets/navigasi_bar/layanan.png",
                      color: Colors.blue,
                    )
                  : Image.asset(
                      "assets/navigasi_bar/layanan.png",
                    ),
              title: Text(
                "Layanan",
                style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Image.asset(
                      "assets/navigasi_bar/booking.png",
                      color: Colors.blue,
                    )
                  : Image.asset(
                      "assets/navigasi_bar/booking.png",
                    ),
              title: Text(
                "Booking",
                style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Image.asset(
                      "assets/navigasi_bar/profile.png",
                      color: Colors.blue,
                    )
                  : Image.asset(
                      "assets/navigasi_bar/profile.png",
                    ),
              title: Text(
                "Profile",
                style: TextStyle(
                    color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? Image.asset(
                      "assets/navigasi_bar/more.png",
                      color: Colors.blue,
                    )
                  : Image.asset(
                      "assets/navigasi_bar/more.png",
                    ),
              title: Text(
                "Profile",
                style: TextStyle(
                    color: _selectedIndex == 4 ? Colors.blue : Colors.grey),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        //currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
