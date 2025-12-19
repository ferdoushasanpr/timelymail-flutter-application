import 'package:flutter/material.dart';

class Tasklist extends StatelessWidget {
  const Tasklist({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors matching the image and previous form theme
    const Color cardBackground = Color(0xFF424242);
    const Color timeTextColor = Colors.white54;

    // Sample data to match the image
    final List<Map<String, String>> tasks = [
      {"title": "Meeting with Bob", "time": "15:00"},
      {"title": "Project deadline", "time": "09:00"},
      {"title": "Grocery shopping", "time": "18:30"},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pending Tasks",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Using ListView.separated to handle the list and spacing
          ListView.separated(
            shrinkWrap: true, // Needed if inside a Column
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: cardBackground,
                  borderRadius: BorderRadius.circular(
                    4,
                  ), // Slightly rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tasks[index]["title"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      tasks[index]["time"]!,
                      style: const TextStyle(
                        color: timeTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
