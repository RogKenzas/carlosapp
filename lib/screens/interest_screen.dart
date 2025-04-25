import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<Map<String, dynamic>> interests = [
    {
      "label": "Explanations",
      "icon": Icons.record_voice_over,
      "selected": false,
    },
    {"label": "Leaderboards", "icon": Icons.leaderboard, "selected": false},
    {
      "label": "Exam Meditations",
      "icon": Icons.self_improvement,
      "selected": true,
    },
    {"label": "Timer", "icon": Icons.timer, "selected": false},
    {"label": "Exam Stamina", "icon": Icons.menu_book, "selected": true},
    {"label": "Questions", "icon": Icons.help, "selected": false},
    {"label": "On the Go!", "icon": Icons.directions_run, "selected": false},
    {"label": "Gaming & Events", "icon": Icons.celebration, "selected": true},
    {
      "label": "Performance Statistics",
      "icon": Icons.bar_chart,
      "selected": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customise your interest',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: PageController(initialPage: 5),
              count: 7,
              effect: const WormEffect(
                dotHeight: 6,
                dotWidth: 30,
                spacing: 8,
                activeDotColor: Colors.blue,
                dotColor: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  final item = interests[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item["selected"] = !item["selected"];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            item["selected"]
                                ? Colors.blue.shade100
                                : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"],
                            size: 28,
                            color: item["selected"] ? Colors.blue : Colors.grey,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item["label"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  item["selected"]
                                      ? Colors.blue.shade700
                                      : Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                // Logique à implémenter
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
