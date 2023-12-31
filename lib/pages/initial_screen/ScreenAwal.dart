import 'package:abank_project/pages/form_login_regist/login_page.dart';
import 'package:abank_project/pages/form_login_regist/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF363636),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'images/50548.png',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 5.0),
                child: Stack(
                  children: [
                    CarouselSlider(
                      items: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/1.png',
                              width: 230,
                              height: 230,
                            ),
                            const SizedBox(height: 0),
                            const Text(
                              'Manage your finances easily and safely with the ABank Mobile Banking Application',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/2.png',
                              width: 230,
                              height: 230,
                            ),
                            const SizedBox(height: 0),
                            const Text(
                              'Enjoy the convenience of banking services at your fingertips',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/3.png',
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(height: 0),
                            const Text(
                              'One step closer to getting your finances in order. Start your journey with our Mobile Banking App',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                      options: CarouselOptions(
                        height: 450.0,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        viewportFraction: 0.9,
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      carouselController: _carouselController,
                    ),
                    Positioned(
                      bottom: 5.0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return InkWell(
                            onTap: () {
                              _carouselController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                            child: Container(
                              width: 15.0,
                              height: 15.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == _currentIndex
                                    ? Colors.white
                                    : Colors.grey,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('LOGIN',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('REGISTER',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
