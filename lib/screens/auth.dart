import 'package:flutter/material.dart';
import 'package:timelymail/widgets/login.dart';
import 'package:timelymail/widgets/signup.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/login-avater.png', width: 150, height: 150),
            const SizedBox(height: 20),
            Text(
              'Welcome to Timely Mail!',
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            (isLogin ? Login() : Signup()),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                (isLogin ? "Login" : "Signup"),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: (isLogin
                  ? Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(color: Colors.white70),
                    )
                  : Text(
                      "Already have an account? Login",
                      style: TextStyle(color: Colors.white70),
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
