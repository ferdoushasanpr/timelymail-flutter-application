import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(label: Text("Name"))),
          const SizedBox(height: 5),
          TextFormField(decoration: InputDecoration(label: Text("Email"))),
          const SizedBox(height: 5),
          TextFormField(decoration: InputDecoration(label: Text("Password"))),
        ],
      ),
    );
  }
}
