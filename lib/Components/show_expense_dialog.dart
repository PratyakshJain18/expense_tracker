import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/homepage_controller.dart';

void showExpenseDialogBox(HomepageController controller) {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  Get.defaultDialog(
    title: "Add Expense",
    titleStyle: TextStyle(fontWeight: FontWeight.bold),
    content: Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: "Title",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Amount",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    ),
    textConfirm: "Add",
    textCancel: "Cancel",
    confirmTextColor: Colors.white,
    onConfirm: () {
      String title = titleController.text.trim();
      int? amount = int.tryParse(amountController.text.trim());

      if (title.isNotEmpty && amount != null) {
        if (!(amount > controller.currentBalance.value)) {
          controller.firebaseService.addExpense(title, amount , controller);
          Get.back();
        } else {
          Get.snackbar(
            "Error",
            "Insufficient Balance . Need ${amount-controller.currentBalance.value} more",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Please enter valid title and amount",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    },
  );
}