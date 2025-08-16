import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar homePageAppBar() {
  return AppBar(
    title: Text(
      "Expense Tracker",
      style: GoogleFonts.playfairDisplay(
        fontSize: 25,
        color: Color(0xFFF5EEDC),
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFF5EEDC),
    ),
    backgroundColor: Color(0xFF4B2521),
    centerTitle: true,
    elevation: 3.0,
    shadowColor: Colors.black,
  );
}