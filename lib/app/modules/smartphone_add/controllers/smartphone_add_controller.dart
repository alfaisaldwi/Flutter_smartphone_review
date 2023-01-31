import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartphoneAddController extends GetxController {
var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
