import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/home/views/home_view.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 85, left: 40, right: 50, bottom: 20),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              child: Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: TextFormField(
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  //add prefix icon
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: TextFormField(
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  //add prefix icon
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                ),
                child: Text('Login'),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('or'),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
                child: Text(
                  'Login with Google',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  Get.to(() => HomeView());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
