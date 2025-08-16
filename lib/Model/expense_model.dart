import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class ExpenseModel
{
  final String title;
  final int amount;
  final String id;
  Timestamp timestamp;
  final String month;
  ExpenseModel({required this.title, required this.amount, required this.id , required this.timestamp , required this.month});
  factory ExpenseModel.fromJson(Map<String, dynamic> json , String id)
  {
    return ExpenseModel(
        timestamp:json['timestamp'],
        id: id,
        title: json['title'] ?? "Untitled",
        amount: json['amount'],
        month: json['month']
    );

  }
}
