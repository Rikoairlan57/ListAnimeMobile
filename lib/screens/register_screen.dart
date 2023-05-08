// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  String c_password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Create a new account',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Text(
                                "Email",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.email),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Text(
                                'NAME',
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Text(
                                'PASSWORD',
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                obscureText: true,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.lock)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Text(
                                'CONFIRM PASSWORD',
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.lock)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () => {},
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.black),
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'SIGN UP',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
