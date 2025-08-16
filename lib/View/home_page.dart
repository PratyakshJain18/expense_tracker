import 'dart:math';
import 'package:expense_tracker/Components/transaction_list.dart';
import 'package:expense_tracker/Components/usable_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/Controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../Components/edit_monthly_income.dart';
import '../Components/show_expense_dialog.dart';
import '../Components/usable_container.dart';
import '../Components/homepageAppbar.dart';

class HomePage extends GetView<HomepageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(),
      drawer:UsableDrawer(controller: controller),
      body: Container(
        color: Color(0xFFDAB9AD),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 23.0, left: 23.0, top: 15),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFFC7B4),
                ),
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 12),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Current Balance",
                          style: TextStyle(color: Color(0xFF3B2A28), fontSize: 15),
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "₹ ${controller.currentBalance.value}",
                            style: TextStyle(
                              color: Color(0xFF3B2A28),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => UsableContainer(
                    onDoubleTap: (){editMonthlyIncome(controller);},
                    color: Color(0xFF6A8E76),
                    aboveText: "Monthly Income",
                    usableAmount: controller.income.value,
                  ),
                ),
                Obx(
                  () => UsableContainer(
                    color: Color(0xFFA85D5D),
                    aboveText: "Monthly Expenses",
                    usableAmount: controller.expendedAmount.value,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20, bottom: 5),
                  child: Text("Transactions", style: TextStyle(fontSize: 25)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 20, bottom: 5),
                  child: IconButton(
                    onPressed: () {
                      showExpenseDialogBox(controller);
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            TransactionsList()
          ],
        ),
      ),
    );
  }
}
