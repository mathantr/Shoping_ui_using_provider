import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color _colorHexCode(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

Color black = _colorHexCode('000000');
Color liteWhite = _colorHexCode('e2e2e2');
Color white = _colorHexCode('ffffff');
Color liteGreen = _colorHexCode('26A3A2');

final header = GoogleFonts.vollkornSc();
final textFont = GoogleFonts.arapey();
