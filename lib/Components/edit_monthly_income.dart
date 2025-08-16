import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/homepage_controller.dart';

void editMonthlyIncome(HomepageController controller) {
  final amountController = TextEditingController();
  Get.defaultDialog(
    title: "Edit Monthly Income",
    titleStyle: TextStyle(fontWeight: FontWeight.bold),
    content: Column(
      children: [
        TextField(
          controller: amountController,
          decoration: InputDecoration(
            labelText: "Title",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    ),
    textConfirm: "Update",
    textCancel: "Cancel",
    confirmTextColor: Colors.white,
    onConfirm: () {
      int? amount = int.tryParse(amountController.text.trim());

      if (amount != null) {
        controller.income.value = amount;
        Get.back();
      } else {
        Get.snackbar(
          "Error",
          "Please enter valid amount",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    },
  );
}