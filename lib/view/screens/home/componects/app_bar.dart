import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding homeAppBar(double heigth) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            height: heigth * 0.05,
            child: Image.asset(
              'asset/img/app logo/logo.png',
              fit: BoxFit.cover,
            )),
        Text(
          'TV Shows',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Movies',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'My List',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}