import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18, color: Color(0XFF8D8E98));
const numberTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);

/// Raleway Bold
TextStyle ralewayBold(double size, Color color) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "RalewayBold",
      decoration: TextDecoration.none);
}

/// Muli Bold
TextStyle muliBold(double size, Color color) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "MuliBold",
      decoration: TextDecoration.none);
}

/// Used on widget constructor must stay here
const muli_bold_20_black = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 20,
    color: Colors.black,
    fontFamily: 'MuliBold');

///Muli Regular
TextStyle muliRegular(double size, Color color) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "MuliRegular",
      decoration: TextDecoration.none);
}

/// Muli Semi Bold
TextStyle muliSemiBold(double size, Color color) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "MuliSemiBold",
      decoration: TextDecoration.none);
}

/// Muli Italic
TextStyle muliItalic(double size, Color color) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "MuliItalic",
      decoration: TextDecoration.none);
}

/// Muli Light Italic
TextStyle muliLightItalic(double size, Color color) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "MuliLightItalic",
      decoration: TextDecoration.none);
}
