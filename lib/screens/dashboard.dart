import 'package:flutter/material.dart';
import 'package:timelymail/widgets/taskform.dart';
import 'package:timelymail/widgets/tasklist.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/login-avater.png'),
                radius: 20,
              ),
            ),
            Text('Ferdous Hasan', style: TextStyle(color: Colors.white70)),
          ],
        ),
        backgroundColor: Colors.black87,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.only(right: 10, top: 8, bottom: 8),
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white70),
              onPressed: () {
                // Handle logout action
              },
            ),
          ),
        ],
      ),
      body: Column(children: [TaskForm(), Tasklist()]),
    );
  }
}
