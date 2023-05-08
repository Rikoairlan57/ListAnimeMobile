// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String email = '';
    String password = '';

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sign in to Continue",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: const Text(
                          "Email",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: const Text(
                          'PASSWORD',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.lock),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.end,
                  ),
                ),
                GestureDetector(
                  onTap: () => print("melakukan login"),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.black),
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have account?'),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: const Text(
                          ' Create account',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
