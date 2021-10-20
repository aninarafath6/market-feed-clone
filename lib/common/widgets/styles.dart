import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';

class Styles {
  InputDecoration inputStyle(inputLabel) => InputDecoration(
    hintText: inputLabel ?? '',
    hintStyle: GoogleFonts.roboto(
      color: AppColors.textGrey,
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.textGrey,
        width: 1,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.yellow,
        width: 1,
      ),
    ),
  );
}
