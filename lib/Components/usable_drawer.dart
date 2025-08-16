import 'package:expense_tracker/Controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UsableDrawer extends StatelessWidget {
  const UsableDrawer({super.key, required this.controller});
  final HomepageController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFCBB5AC),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: DrawerHeader(
                child: Text(
                  "L O G O",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(title: Text("Settings"), leading: Icon(Icons.settings)),
            ListTile(title: Text("Contact"), leading: Icon(Icons.phone)),
            Obx(()=>DropdownButton(
              value: controller.selectedMonth.value,
              hint: Text("Select Month"),
              icon: Icon(Icons.arrow_drop_down),
              items: controller.months.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? newValue) {
                controller.selectedMonth.value = newValue!;
              },
            ),)
          ],
        ),
      ),
    );
  }
}
