import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartphoneAddController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _fireStore = FirebaseFirestore.instance.collection('reviewSmartphone');
  final CollectionReference dbMaps =
      FirebaseFirestore.instance.collection('reviewSmartphone');

  TextEditingController c_brand = TextEditingController();
  TextEditingController c_deskripsi = TextEditingController();
  TextEditingController c_spek = TextEditingController();
  TextEditingController c_excess = TextEditingController();
  

   Future<void> createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    // final GeoPoint loc = documentSnapshot?['location'];

    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      c_brand.text = documentSnapshot['titleT'];
      c_deskripsi.text = documentSnapshot['type'];
      c_excess.text = documentSnapshot['snippset'];
      // lattC.text = documentSnapshot[loc.latitude.toString];
      // longC.text = documentSnapshot[loc.longitude.toString()];
      // loc = documentSnapshot['location'];
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Excess',
                    ),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(action == 'create' ? 'Create' : 'Update'),
                    onPressed: () async {
                      final String? brand = c_brand.text;
                      final String? deskripsi = c_deskripsi.text;
                      final String? spek = c_spek.text;
                      final String? excess = c_excess.text;

                      if (brand != null &&
                          deskripsi != null &&
                          spek != null &&
                          excess != null ) {
                        if (action == 'create') {
                          await dbMaps.add({
                            "brand": brand,
                            "deskripsi": deskripsi,
                            "spek": spek,
                            "excess": excess,
                          });
                        }

                        if (action == 'update') {
                          // Update the product
                          await dbMaps.doc(documentSnapshot!.id).update({
                            "brand": brand,
                            "deskripsi": deskripsi,
                            "spek": spek,
                            "excess": excess
                          });
                        }

                        // Clear the text fields
                        c_brand.text = '';
                        c_deskripsi.text = '';
                        c_spek.text = '';

                        c_excess.text = '';

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
  Future<void> _deleteProduct(String productId) async {
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
