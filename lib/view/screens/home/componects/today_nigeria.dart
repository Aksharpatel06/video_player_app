import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row todayNigeria() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white)),
        child: Column(
          children: [
            Text(
              'TOP',
              style: GoogleFonts.notoSans(
                fontSize: 6,
              ),
            ),
            Text(
              '10',
              style: GoogleFonts.notoSans(height: 0.9,fontSize: 12,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Text(
        '  #2 in Nigeria Today',
        style: GoogleFonts.notoSans(
            fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
