import 'package:flutter/material.dart';

import 'package:hospital_app/ui/landing_page/navigasi_bar/booking_page.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/home_page.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/layanan_page.dart';
//import 'package:hospital_app/ui/landing_page/navigasi_bar/more_floatingButton.dart';
import 'package:hospital_app/ui/landing_page/navigasi_bar/profile_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  bool showFAB = false;

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.25),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return FaB();
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  final _layoutPage = [
    HomePage(),
    LayananPage(),
    BookingPage(),
    ProfilePage(),
    //HomePage()
  ];

  void _onTabItem(int idx) {
    if (idx != 4) {
      setState(() {
        _selectedIndex = idx;
      });
    } else {
      setState(() {
        if (idx % 4 == 0) {
          //LoadingOverlay.of(context);
          showDialog();
        }
      });
    }

    // setState(() {
    //   _selectedIndex = idx;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        //\\

        //SHADOW \\

        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
            ),
          ],
        ),

        // NAV BAR BAWAH \\

        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? Image.asset(
                        "assets/navigasi_bar/home.png",
                        color: Color(0xFF2962FF),
                      )
                    : Image.asset(
                        "assets/navigasi_bar/home.png",
                      ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: _selectedIndex == 0
                          ? Color(0xFF2962FF)
                          : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? Image.asset(
                        "assets/navigasi_bar/layanan.png",
                        color: Color(0xFF2962FF),
                      )
                    : Image.asset(
                        "assets/navigasi_bar/layanan.png",
                      ),
                title: Text(
                  "Layanan",
                  style: TextStyle(
                      color: _selectedIndex == 1
                          ? Color(0xFF2962FF)
                          : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? Image.asset(
                        "assets/navigasi_bar/booking.png",
                        color: Color(0xFF2962FF),
                      )
                    : Image.asset(
                        "assets/navigasi_bar/booking.png",
                      ),
                title: Text(
                  "Booking",
                  style: TextStyle(
                      color: _selectedIndex == 2
                          ? Color(0xFF2962FF)
                          : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? Image.asset(
                        "assets/navigasi_bar/profile.png",
                        color: Color(0xFF2962FF),
                      )
                    : Image.asset(
                        "assets/navigasi_bar/profile.png",
                      ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: _selectedIndex == 3
                          ? Color(0xFF2962FF)
                          : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: _selectedIndex == 4
                    ? Image.asset(
                        "assets/navigasi_bar/more.png",
                        color: Color(0xFF2962FF),
                      )
                    : Image.asset(
                        "assets/navigasi_bar/more.png",
                      ),
                title: Text(
                  "More",
                  style: TextStyle(
                      color: _selectedIndex == 4
                          ? Color(0xFF2962FF)
                          : Colors.grey),
                )),
          ],
          type: BottomNavigationBarType.fixed,
          //currentIndex: _selectedIndex,
          onTap: _onTabItem,
        ),
      ),
      // floatingActionButton: Visibility(
      //   child: Stack(
      //     children: [
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.all(2),
      //           ),
      //           SizedBox(
      //             width: 120,
      //             child: RaisedButton(
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   new Text(
      //                     "Feedback",
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   Container(
      //                       child: Icon(
      //                     Icons.favorite_border,
      //                     color: Colors.white,
      //                   )),
      //                 ],
      //               ),
      //               color: Color(0xFF2962FF),
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(20)),
      //               onPressed: () {},
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      //   visible: showFAB,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

class FaB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 70),
      // FLOATING ACTION BUTTON dalam bentuk RaisedButton
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 150,
            height: 36,
            child: RaisedButton(
              color: Color(0xFF2962FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    "Tentang Kami",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Material(
                                color: Colors.white.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Container(
                                child: Image.asset(
                                    "assets/floating_action_button/tentangkami.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 165,
            height: 36,
            child: RaisedButton(
              color: Color(0xFF2962FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    "Partner & Carrer",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Material(
                                color: Colors.white.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Container(
                                child: Image.asset(
                                    "assets/floating_action_button/partner.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 125,
            height: 36,
            child: RaisedButton(
              color: Color(0xFF2962FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    "Feedback",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Material(
                                color: Colors.white.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Container(
                                child: Image.asset(
                                    "assets/floating_action_button/feedback.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LoadingOverlay {
//   BuildContext _context;

//   void hide() {
//     Navigator.of(_context).pop();
//   }

//   void show() {
//     showDialog(
//         context: _context,
//         barrierDismissible: true,
//         child: _FullScreenLoader());
//   }

//   Future<T> during<T>(Future<T> future) {
//     show();
//     return future.whenComplete(() => hide());
//   }

//   LoadingOverlay._create(this._context);
//   factory LoadingOverlay.of(BuildContext context) {
//     return LoadingOverlay._create(context);
//   }
// }

// class _FullScreenLoader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
//     );
//   }
// }
