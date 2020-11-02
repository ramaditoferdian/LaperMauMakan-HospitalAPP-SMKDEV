import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital_app/layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  int _currentPage = 0;

  List<Widget> _deskripsiAwal = [
    Container(
      //color: Colors.black,
      child: DeskripsiAwal(),
    ),
    Container(
      //color: Colors.black,
      child: DeskripsiAwal(),
    ),
    Container(
      //color: Colors.black,
      child: DeskripsiAwal(),
    ),
    Container(
      //color: Colors.black,
      child: DeskripsiAwal(),
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      // print("page ${pageController.page}");
      // print("panjang array ${_deskripsiAwal.length}");
      if (pageController.page >= _deskripsiAwal.length - 1) {
        pageController.animateToPage(0,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
      } else {
        pageController.nextPage(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
  }

  _dotsIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List<Widget>.generate(_deskripsiAwal.length, (int index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: 8,
              width: (index == _currentPage ? 18 : 8),
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  color: (index == _currentPage)
                      ? Color(0xFF2962FF)
                      : Colors.white),
            );
          }),
        ),
      ],
    );
  }

  _tombolReadBiru() {
    return Container(
      width: 69,
      height: 30,
      child: RaisedButton(
        child: Text(
          "Read",
          style: TextStyle(
              fontSize: 14, fontFamily: 'Poppins', color: Colors.white),
        ),
        color: Color(0xFF2962FF),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // untuk ukuran widget
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          // SEKILAS TENTANG RS. SMKDEV
          LimitedBox(
            maxHeight: 255,
            //maxHeight: SizeConfig.blockVertical * 36,
            child: Stack(
              children: [
                PageView.builder(
                  // ISI LIST _deskripsiAwal
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _deskripsiAwal.length,
                  onPageChanged: _onChanged,
                  itemBuilder: (context, int index) {
                    return _deskripsiAwal[index];
                  },
                ),
                Positioned(
                    bottom: 20,
                    left: 20.0,
                    right: 0.0,
                    child: _dotsIndicator()),
                Positioned(bottom: 20, right: 20.0, child: _tombolReadBiru()),
              ],
            ),
          ),

          // TEMUI KAMI
          LimitedBox(
            maxHeight: 580,
            child: TemuiKami(),
          ),
          LimitedBox(
            maxHeight: 580,
            child: TentangKami(),
          ),
        ],
      )),
    );
  }
}

// DESKRIPSI AWAL
class DeskripsiAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC4C4C4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text(
              "Sekilas Tentang",
              style: TextStyle(
                //height: 0,
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 9),
            child: Text(
              "RS. SMKDEV",
              style: TextStyle(
                height: 1,
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "SMKDEV komunitas developer siswa SMK jurusan Rekayasa Perangkat Lunak (RPL), Teknik Komputer dan Jaringan (TKJ) dan Multimedia (MM) dari seluruh Indonesia.",
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TemuiKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text(
                "Temui Kami",
                style: TextStyle(
                  //height: 0,
                  fontSize: 20,
                  color: Colors.black,

                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print("map di tekan");
            },
            child: Center(
              child: Image.asset("assets/img/maps.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Container(
              child: Text(
                "Rumah Sakit SMKDEV",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Jl. Margacinta No.29",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Senin - Jumat : 08.00 - 20.00",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Sabtu : 08.00 - 17.00",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Container(
              child: Text(
                "Klinik SMKDEV",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Jl. Mars Barat I No. 9",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Senin - Jumat : 08.00 - 20.00 ",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Sabtu : 08.00 - 13.00",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Container(
              child: Text(
                "BPJS",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Senin - Jumat : 07.00 - 14.00, 16.00 - 19.00",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              child: Text(
                "Sabtu : 07.00 - 12.00 ",
                style: TextStyle(
                  //height: 0,
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TentangKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2962FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Text(
                    "Tentang Kami",
                    style: TextStyle(
                      //height: 0,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      print("selengkapnya di tekan");
                    },
                    child: Text(
                      "Selengkapnya",
                      style: TextStyle(
                        //height: 0,
                        fontSize: 12,
                        color: Colors.white,

                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            child: Center(
              child: Image.asset("assets/img/maps.png"),
            ),
          ),
        ],
      ),
    );
  }
}
