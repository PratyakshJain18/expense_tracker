import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/FIrebaseServices/firebase_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomepageController extends GetxController {
 RxInt currentBalance = 5000.obs;
 RxInt income = 5000.obs;
 RxInt expendedAmount = 0.obs;

 int expenses = 4000;

 List<String> months = [
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
 ];
 RxString selectedMonth = "".obs;

 final firebaseService = FirebaseService();

 List<dynamic> allExpenses = [];

 String formatDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return DateFormat('MMMM d').format(dateTime);
 }

 String extractMonth(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return DateFormat('MMMM').format(dateTime);
 }

 @override
 void onInit() {
  super.onInit();


  firebaseService.getExpenseStream().listen((expenseList) {
   allExpenses = expenseList;
   _recalculate();
  });

  ever(selectedMonth, (_) => _recalculate());
  selectedMonth.value = extractMonth(Timestamp.now());

 }

 void _recalculate() {
  final filtered = allExpenses.where((expense) =>
  extractMonth(expense.timestamp) == selectedMonth.value
  ).toList();

  int total = 0;
  for (var expense in filtered) {
   total += (expense.amount as num).toInt();
  }

  expendedAmount.value = total;
  currentBalance.value = income.value - total;
 }
}