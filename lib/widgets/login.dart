import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackGround(),
          SafeArea(
              child: Column(children: [
            _buildIcon(),
            _buildForm(),
          ])),
        ],
      ),
    );
  }

  Expanded _buildForm() {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350, minWidth: 200),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Email',
                icon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350, minWidth: 200),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Password',
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(300, 40))),
              child: Text(
                'LogIn',
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 1, 134), fontSize: 30),
              ))
        ],
      ),
    );
  }

  Expanded _buildIcon() {
    return Expanded(
      flex: 2,
      child: Center(
        child: Icon(
          Icons.lock,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }

  Container _buildBackGround() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 158, 13, 184),
        Color.fromARGB(244, 63, 0, 146)
      ], begin: Alignment.bottomLeft)),
    );
  }
}
