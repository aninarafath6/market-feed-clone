import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    this.inputLabel,
    this.onChanged,
    this.type
  }) : super(key: key);

  final String? inputLabel;
  final Function(String)? onChanged;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType:type?? TextInputType.number,
      style: GoogleFonts.roboto(color: Colors.white),
      decoration: InputDecoration(
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
      ),
    );
  }
}
