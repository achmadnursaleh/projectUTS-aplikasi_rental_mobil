import 'package:carrental/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentController extends GetxController {
  Rx<DateTime> rentStartDate = DateTime.now().obs;
  Rx<DateTime> rentReturnDate = DateTime.now().obs;
  var rentTotal = 0.0.obs;

  Future<DateTime?> showDateSelector() async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(9999),
      errorFormatText: "Masukkan tanggal yang benar",
      confirmText: "KONFIRMASI",
      errorInvalidText: "Masukkan tanggal yang benar",
    );
  }

  Future<void> pickStartDate(double price) async {
    var date = await showDateSelector();
    rentStartDate.value = date ?? rentStartDate.value;
    calculateTotal(price);
  }

  Future<void> pickReturnDate(double price) async {
    var date = await showDateSelector();
    if (date != null &&
            date.isBefore(rentStartDate.value.add(const Duration(days: 1))) ||
        date != null && date == rentStartDate.value) {
      Get.snackbar(
        "Tanggal Pengembalian Tidak Valid",
        "Mobil harus dikembalikan satu hari di kemudian hari",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 7),
      );
      return;
    }
    rentReturnDate.value = date ?? rentReturnDate.value;
    calculateTotal(price);
  }

  ///Function used ot calculate the price for rental
  calculateTotal(double price) {
    if (rentStartDate.value
        .isBefore(rentReturnDate.value.add(const Duration(days: 1)))) {
      int diffInDays =
          rentReturnDate.value.difference(rentStartDate.value).inDays;
      rentTotal.value = diffInDays * price;
    }
  }

  showProccessing() async {
    if (rentReturnDate.value.difference(rentStartDate.value).inDays < 2) {
      Get.snackbar(
        "Tanggal Sewa Tidak Valid",
        "Silakan periksa tanggal penyewaan. Mobil tidak dapat disewa kurang dari 2 hari.",
        icon: Icon(Icons.date_range),
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 7),
      );
      return;
    }
    Get.bottomSheet(
      Center(
        child: Container(
          height: Get.context!.height,
          width: Get.context!.width,
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Permintaan Anda sedang diproses',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  strokeWidth: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
    paymentSuccess();
  }

  paymentSuccess() async {
    Get.bottomSheet(
      Center(
        child: Container(
          height: Get.context!.height,
          width: Get.context!.width,
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Get.offAll(() => const HomeScreen());
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 17,
                  ),
                ),
              ),
              const Icon(
                Icons.check_circle,
                size: 150,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              const Text(
                'Pembayaran berhasil dilakukan!',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 10));
    Get.offAll(() => const HomeScreen());
  }
}
