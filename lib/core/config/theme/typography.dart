import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;

TextStyle headerTitle = GoogleFonts.lato(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: appColor.defaultWhite
);

TextStyle bodyTitle = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: appColor.defaultBlack
);

TextStyle bodySubtitle = GoogleFonts.lato(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: appColor.defaultBlack
);

TextStyle body = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: appColor.defaultBlack
);