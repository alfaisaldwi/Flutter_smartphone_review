import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/home/views/home_view.dart';
import 'package:smartphone_review/app/modules/profile_page/views/profile_page_view.dart';

import '../controllers/smartphone_add_controller.dart';

class SmartphoneAddView extends GetView<SmartphoneAddController> {
    var items = [    
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () => Get.to(() => ProfilePageView()),
              child: Icon(
                Icons.person_outline_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      key: controller.scaffoldKey,
      drawer: Drawer(
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
                    onTap: () => Get.to(() => HomeView()),
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
                    onTap: () => (Get.to(() => Navigator.pop)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                'Add Smartphone',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Brand',
                  focusColor: Colors.white,
                  //add prefix icon
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
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Deskripsi',
                  focusColor: Colors.white,
                  //add prefix icon
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
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Specification',
                  focusColor: Colors.white,
                  //add prefix icon
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
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Excess',
                  focusColor: Colors.white,
                  //add prefix icon
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
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Defiency',
                  focusColor: Colors.white,
                  //add prefix icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  Get.to(() => HomeView());
                },
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
