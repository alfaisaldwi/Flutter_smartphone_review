import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartphone_review/app/modules/home/views/home_view.dart';
import 'package:smartphone_review/app/modules/profile_page/views/profile_page_view.dart';

import '../controllers/smartphone_add_controller.dart';

class SmartphoneAddView extends GetView<SmartphoneAddController> {
  String imageUrl = '';
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
                controller: controller.c_brand,
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
                controller: controller.c_deskripsi,
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
                controller: controller.c_spek,
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
                controller: controller.c_excess,
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
            Container(
              width: 300,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.cyan[400]),
                child: Text(
                  'Add Image',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  print('${file?.path}');

                  if (file == null) return;

                  String uniqueFileName =
                      DateTime.now().microsecondsSinceEpoch.toString();
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImage = referenceRoot.child('images');

                  Reference referenceImagetoUpload =
                      referenceDirImage.child(uniqueFileName);

                  referenceImagetoUpload.putFile(File(file!.path));

                  try {
                    await referenceImagetoUpload.putFile(File(file.path));

                    imageUrl = await referenceImagetoUpload.getDownloadURL();
                  } catch (e) {}
                },
              ),
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
                 

                  controller.createOrUpdate();
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
