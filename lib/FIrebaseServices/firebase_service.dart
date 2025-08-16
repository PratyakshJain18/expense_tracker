import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Controller/homepage_controller.dart';
import 'package:expense_tracker/Model/expense_model.dart';
class FirebaseService
{
  final expense=FirebaseFirestore.instance.collection('Expenses');
  Stream<List<ExpenseModel>> getExpenseStream() {
    return expense.snapshots().map(
          (event) =>
          event.docs.map((e) => ExpenseModel.fromJson(e.data(), e.id)).toList(),
    );
  }
  Future<void> addExpense(String note , int amount , HomepageController controller) {
    final random = Random();
    int randomNum = 10000 + random.nextInt(900000);
    String customId = randomNum.toString();
    return expense.doc(customId).set(
        {
          'title': note,
          'amount': amount,
          'id': customId,
          'timestamp': Timestamp.now(),
          'month':controller.extractMonth(Timestamp.now())
        }
    );
  }
  Future<void> deleteExpense(String id) {
    return expense.doc(id).delete();
  }
}