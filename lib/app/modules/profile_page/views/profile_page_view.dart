import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/home/views/home_view.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: controller.openDrawer,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      key: controller.scaffoldKey,
      drawer: GestureDetector(
        onTap: controller.openDrawer,
        child: Drawer(
          elevation: 10.0,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/images/logo.png', width: 180),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () => (Get.to(() => HomeView())),
                      title: Text(
                        'Home',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'BrandSmartphone',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Add Smartphone',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'MY PROFILE',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              child: ClipOval(child: Image.asset('assets/images/person.png')),
            ),
            SizedBox(
              height: 10,
            ),
            Text('User'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListTile(
                leading: Text('Email'),
                trailing: Text('Usser'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListTile(
                leading: Text('Name'),
                trailing: Text('Usser'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 330,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
                child: Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  // Get.to(() => HomeView());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
