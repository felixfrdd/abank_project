import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF363636),
        body: MyCarousel(),
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 5.0),
            child: Stack(
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      color: const Color.fromARGB(0, 168, 168, 168),
                      child: Center(
                        child: Image.network('https://imgs.search.brave.com/sVMF2Wkhgg7rtK2yQiiUIbi7L2PpEAe--yjlxvtC4cs/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzU4L2Vk/LzJmLzU4ZWQyZmJk/ODZmZTgxMTJkYTg0/NWFiNGQ4YWQ5ODJi/LmpwZw'),
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(0, 168, 168, 168),
                      child: Center(
                        child: Image.network('https://imgs.search.brave.com/LSmVzGbGArdq2ILkWawT7FMeB8gQZqePtws-lIh6D3I/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzllLzAz/L2RjLzllMDNkYzgx/MjczOWU2NjA2ZWNj/OTRiZGZhZWFmMzEy/LmpwZw'),
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(0, 168, 168, 168),
                      child: Center(
                        child: Image.network('https://imgs.search.brave.com/w3N71bPBqU-GPlSjNzYqzRhrNKe0l9rwtTgM_DWZJCs/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9saDMu/Z29vZ2xldXNlcmNv/bnRlbnQuY29tL2V6/NUszQ3BmOWRfVzJ4/c2gzSlZldVV4a213/LVNFdk5FWHVoMk14/S0gyaGdFWGFueHRL/V012SXhvdWRwQllJ/TGM0dEY4SFMzdEhR/Nlo3N3JQM2dOYlRF/ZTdyREU0T196S3dD/LUJGNHhoc1JjVzRu/dz13OTYwLXJqLW51/LWUzNjU.jpeg'),
                      ),
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
                    autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentIndex ? Colors.white : Colors.grey,
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
                    // Aksi yang akan dilakukan saat tombol LOGIN ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('LOGIN', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang akan dilakukan saat tombol REGISTER ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('REGISTER', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
