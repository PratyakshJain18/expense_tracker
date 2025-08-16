import 'package:expense_tracker/View/home_page.dart';
import 'package:get/get.dart';

import 'binding.dart';

class Routes
{
  static final initialRoute='/home';
  static final routes=[
    GetPage(name: initialRoute, page: ()=>HomePage() , binding: Binding())
  ];
}