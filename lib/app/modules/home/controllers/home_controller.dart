import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final fireStore = FirebaseFirestore.instance.collection('reviewSmartphone');
  final CollectionReference dbMaps =
      FirebaseFirestore.instance.collection('reviewSmartphone');
  String imageUrl = '';

  TextEditingController c_brand = TextEditingController();
  TextEditingController c_deskripsi = TextEditingController();
  TextEditingController c_slogan = TextEditingController();
  TextEditingController c_spek = TextEditingController();
  TextEditingController c_excess = TextEditingController();

  Future<void> createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    // final GeoPoint loc = documentSnapshot?['location'];

    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      c_brand.text = documentSnapshot['brand'];
      c_slogan.text = documentSnapshot['slogan'];
      c_deskripsi.text = documentSnapshot['deskripsi'];
      c_spek.text = documentSnapshot['spek'];
      c_excess.text = documentSnapshot['excess'];

    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: c_brand,
                    decoration: const InputDecoration(labelText: 'Brand'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: c_slogan,
                    decoration: const InputDecoration(labelText: 'Slogan'),
                  ),
                  TextField(
                    controller: c_deskripsi,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Deskription',
                    ),
                  ),
                  TextField(
                    controller: c_spek,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Specification',
                    ),
                  ),
                  TextField(
                    controller: c_excess,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Excess',
                    ),
                  ),
                  Container(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan[400]),
                      child: Text(
                        'Add Image',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print('${file?.path}');

                        if (file == null) return;

                        String uniqueFileName =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImage =
                            referenceRoot.child('images');

                        Reference referenceImagetoUpload =
                            referenceDirImage.child(uniqueFileName);

                        referenceImagetoUpload.putFile(File(file!.path));

                        try {
                          await referenceImagetoUpload.putFile(File(file.path));

                          imageUrl =
                              await referenceImagetoUpload.getDownloadURL();
                        } catch (e) {}
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(action == 'create' ? 'Create' : 'Update'),
                    onPressed: () async {
                      final String? brand = c_brand.text;
                      final String? slogan = c_slogan.text;
                      final String? deskripsi = c_deskripsi.text;
                      final String? spek = c_spek.text;
                      final String? excess = c_excess.text;

                      if (brand != null &&
                          slogan != null &&
                          deskripsi != null &&
                          spek != null &&
                          excess != null &&
                          imageUrl != null) {
                        if (action == 'create') {
                          await dbMaps.add({
                            "brand": brand,
                            "slogan": slogan,
                            "deskripsi": deskripsi,
                            "spek": spek,
                            "excess": excess,
                            "imageUrl": imageUrl
                          });
                        }

                        if (action == 'update') {
                          // Update the product
                          await dbMaps.doc(documentSnapshot!.id).update({
                            "brand": brand,
                            "slogan": slogan,
                            "deskripsi": deskripsi,
                            "spek": spek,
                            "excess": excess,
                            "imageUrl": imageUrl
                          });
                        }

                        // Clear the text fields
                        c_brand.text = '';
                        c_slogan.text = '';
                        c_deskripsi.text = '';
                        c_spek.text = '';

                        c_excess.text = '';
                        imageUrl = '';

                        // Hide the bottom sheet
                        Navigator.of(Get.context!).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> deleteProduct(String productId) async {
    await dbMaps.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
