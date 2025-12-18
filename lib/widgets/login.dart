import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(label: Text("Email"))),
          const SizedBox(height: 5),
          TextFormField(decoration: InputDecoration(label: Text("Password"))),
        ],
      ),
    );
  }
}
