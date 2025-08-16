import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/homepage_controller.dart';

class UsableContainer extends GetView {
  final Color color;
  final String aboveText;
  final int usableAmount;
  void Function()? onDoubleTap;

  UsableContainer( {
    super.key,
    required this.color,
    required this.aboveText,
    required this.usableAmount,
    this.onDoubleTap
  });
  final controller = Get.find<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFE9DFDA),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 12),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        aboveText,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onDoubleTap: onDoubleTap,
                        child: Text(
                          "₹ $usableAmount",
                          style: TextStyle(
                            color: color,
                            fontSize: 20,
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
        ],
      ),
    );
  }
}
