import 'package:carlosapp/widgets/carousel_items.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'interest_screen.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Which Board exam are you currently studying for?",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  CarouselItem(
                    title: "NBCE Part 1",
                    subtitle:
                        "I Always work out regular two or three times a week.",
                  ),
                  CarouselItem(
                    title: "NBCE Part 2",
                    subtitle: "Prepare effectively with daily sessions.",
                  ),
                  CarouselItem(
                    title: "NBCE Part 3",
                    subtitle: "Achieve mastery through consistency.",
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                dotHeight: 6,
                dotWidth: 30,
                spacing: 8,
                activeDotColor: Colors.blue,
                dotColor: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Colors.blue.shade900,
              ),
              child: const Text(
                "Select",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestScreen()),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
