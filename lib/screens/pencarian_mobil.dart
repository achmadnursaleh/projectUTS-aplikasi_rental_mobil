import 'package:carrental/config/constants.dart';
import 'package:carrental/controllers/mobil.controller.dart';
import 'package:carrental/models/mobil.dart';
import 'package:carrental/widgets/daftar_mobil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
        Get.back();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length > 2) {
      List<Car> cars = Get.find<CarController>().searchCars(query);
      if (cars.isEmpty) {
        return Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.drive_eta,
              size: 100,
            ),
            Text("Tidak Dapat Menemukan '$query'"),
          ],
        ));
      }
      return ListView(
        children: [
          SizedBox(height: kPadding),
          CarList(carList: cars),
        ],
      );
    } else {
      return const Center(child: Text("Cari Mobil"));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 2) {
      List<Car> cars = Get.find<CarController>().searchCars(query);
      if (cars.isEmpty) {
        return Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.drive_eta,
              size: 100,
            ),
            Text("Tidak Dapat Menemukan '$query'"),
          ],
        ));
      }
      return ListView(
        children: [
          SizedBox(height: kPadding),
          CarList(carList: cars),
        ],
      );
    } else {
      return const Center(child: Text("Cari Mobil"));
    }
  }
}
