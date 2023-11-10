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
                      color: const Color.fromARGB(255, 168, 168, 168),
                      child: const Center(
                        child: Text('Slider 1'),
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 168, 168, 168),
                      child: const Center(
                        child: Text('Slider 2'),
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 168, 168, 168),
                      child: const Center(
                        child: Text('Slider 3'),
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
                    viewportFraction: 0.75,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: 15.0,
                        height: 15.0,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentIndex ? Colors.white : Colors.grey,
                          border: Border.all(color: Colors.grey),
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
