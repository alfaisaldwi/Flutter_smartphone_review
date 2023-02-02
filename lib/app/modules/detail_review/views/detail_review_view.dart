import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/profile_page/views/profile_page_view.dart';
import 'package:smartphone_review/app/modules/smartphone_add/views/smartphone_add_view.dart';

import '../controllers/detail_review_controller.dart';

class DetailReviewView extends GetView<DetailReviewController> {
  final p = Get.arguments;

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
                      onTap: () => (Get.toNamed('home')),
                      title: Text(
                        'Home',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    ListTile(
                      onTap: () => controller.createOrUpdate(),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${p[0]}'.toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${p[1]}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 0, bottom: 40),
                child:
                    Center(child: Container(child: Image.network('${p[4]}'))),
              ),
              Text(
                'DESCRIPTION',
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${p[2]}',
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.5, fontSize: 15),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'SPESIFICATION',
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
              SizedBox(
                height: 10,
              ),
              Text('${p[5]}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 1.5, fontSize: 15)),
              SizedBox(
                height: 25,
              ),
              Text(
                'EXCESS',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 10,
              ),
              Text('${p[3]}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 1.5, fontSize: 15)),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
