import 'package:flutter/material.dart';

import 'fonts.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
        FontWeight fontWeight, Color color) =>
    TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight);

TextStyle getRegularStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, Fonts.fontFamily, FontWeightManager.regular, color);

TextStyle getLightStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, Fonts.fontFamily, FontWeightManager.light, color);

TextStyle getBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, Fonts.fontFamily, FontWeightManager.bold, color);

TextStyle getSemiBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
        fontSize, Fonts.fontFamily, FontWeightManager.semiBold, color);

TextStyle getMediumStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, Fonts.fontFamily, FontWeightManager.medium, color);
