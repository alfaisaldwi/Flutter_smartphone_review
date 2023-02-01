import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/profile_page/views/profile_page_view.dart';
import 'package:smartphone_review/app/modules/smartphone_add/views/smartphone_add_view.dart';

import '../controllers/detail_review_controller.dart';

class DetailReviewView extends GetView<DetailReviewController> {
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
                    onTap: () => Navigator.pop,
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
                      'Brand Smartphone',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  ListTile(
                    onTap: () => (Get.to(() => SmartphoneAddView())),
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
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VIVO V19',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                child: Container(
                    child: Image.network(
                        'https://cdn-2.tstatic.net/surabaya/foto/bank/images/bocoran-terbaru-hp-vivo-v19-jadi-seri-v-pertama-di-indonesia-berikut-tampilan-dan-fitur-unggulannya.jpg')),
              ),
              Text(
                'DESCRIPTION',
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Vivo, vendor smartphone asal Tiongkok yang juga merupakan saudara tiri dari Oppo, telah memperkenalkan dan merilis duo jagoan terbarunya, yakni Vivo V15 dan Vivo V15 Pro. Kedua HP ini sama-sama menjadikan sektor kamera dan layar lebar sebagai nilai jualnya.',
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 5,
              ),
              Text('Processor :    '),
              SizedBox(
                height: 5,
              ),
              Text('RAM :    GB'),
              SizedBox(
                height: 5,
              ),
              Text('Penyimpanan :    '),
              SizedBox(
                height: 5,
              ),
              Text('Baterai :    mAh'),
              SizedBox(
                height: 5,
              ),
              Text('Pengisian Cepat :    '),
              SizedBox(
                height: 5,
              ),
              Text('Warna :    '),
              SizedBox(
                height: 5,
              ),
              Text('Sistem Operasi :    '),
              SizedBox(
                height: 20,
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
                height: 15,
              ),
              Text(
                  'Kelebihan pertama yang dimiliki Vivo V15 Pro terletak pada layarnya yang berukuran besar dan memiliki kualtias bagus. Dengan ukuran 6,39 inci berjenis Super AMOLED, serta tidak terdapatnya penghalang seperti notch ataupun punch hole, maka akan membuat penggunanya lebih leluasa ketika menggunakannya. Kelebihan lain adalah pada fitur kamera depan dan belakangnya yang sama-sama berkualitas dan mampu menghasilkan foto atau video bagus. Kapasitas RAM dan ROM-nya pun memiliki kapasitas besar yang dapat membuat sistem bertambah lancar.',
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
