import 'package:carrental/config/constants.dart';
import 'package:carrental/controllers/mobil.controller.dart';
import 'package:carrental/models/mobil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/daftar_mobil.dart';
import '../widgets/custom_tombol_bar.dart';
import '../widgets/profile_header.dart';
import '../widgets/input_cari.dart';
import '../widgets/bagian_judul.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: SafeArea(
        child: ListView(children: [
          const SizedBox(height: 10),
          const ProfileHeader(),
          SizedBox(height: kPadding),
          const SearchInput(),
          SizedBox(height: kPadding * 1.5),
          const SectionHeading(title: "Favorites"),
          SizedBox(height: kPadding),
          Obx(
            () => CarList(
              carList: List<Car>.from(Get.find<CarController>().favorites),
            ),
          )
        ]),
      ),
    );
  }
}
