import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../Controller/homepage_controller.dart';

class TransactionsList extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: controller.firebaseService.getExpenseStream(),
          builder: (context, snapshot) {
            final expense = snapshot.data;

            if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (expense == null || expense.isEmpty) {
              return Center(child: Text("No expenses yet."));
            }
            return Obx(() {
              final filtered = expense.where((item)=>controller.extractMonth(item.timestamp)==controller.selectedMonth.value ).toList();
              if(filtered.isEmpty)
                {
                  return Center(child: Text("No expenses yet."));
                }
              return ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  String month = controller.extractMonth(
                    filtered[index].timestamp,
                  );
                  final expenseItem = filtered[index];
                  if (month != controller.selectedMonth.value) {
                    return SizedBox.shrink();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  controller.firebaseService.deleteExpense(
                                    expenseItem.id,
                                  );
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: ListTile(
                            tileColor: Color(0xFFDCCFC7),
                            trailing: Text(
                              "₹ ${expenseItem.amount.toString()}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3B2A28),
                              ),
                            ),
                            title: Row(
                              children: [
                                CircleAvatar(
                                  child: Text(
                                    expenseItem.title.substring(0, 1),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  expenseItem.title,
                                  style: TextStyle(color: Color(0xFF2E1A18)),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text(
                                controller.formatDate(expenseItem.timestamp),
                                style: TextStyle(color: Color(0xFF5F4B47)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            });
          },
        ),
      );
  }
}
