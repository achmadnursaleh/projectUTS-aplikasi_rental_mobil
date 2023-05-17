import 'package:carrental/config/constants.dart';
import 'package:carrental/controllers/mobil.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/pemilihan_brand.dart';
import '../widgets/daftar_mobil.dart';
import '../widgets/custom_tombol_bar.dart';
import '../widgets/profile_header.dart';
import '../widgets/input_cari.dart';
import '../widgets/bagian_judul.dart';
import '../widgets/penawaran_super.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: SafeArea(
        child: ListView(children: [
          const SizedBox(height: 10),
          const ProfileHeader(),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            child: const Text(
              "Ayo lakukan perjalanan hari ini!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: kPadding * 1.5),
          const SearchInput(),
          SizedBox(height: kPadding * 1.5),
          const BrandSelector(),
          SizedBox(height: kPadding * 1.5),
          const SectionHeading(title: "Penawaran Super"),
          SizedBox(height: kPadding),
          SuperDeal(
            car: Get.find<CarController>().allCars[2],
          ),
          SizedBox(height: kPadding),
          const SectionHeading(title: "Tersedia"),
          SizedBox(height: kPadding),
          CarList(
            carList: Get.find<CarController>().allCars,
          )
        ]),
      ),
    );
  }
}
