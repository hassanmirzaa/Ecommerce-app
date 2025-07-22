import 'package:flutter/material.dart';

/// ✅ Responsive Sizes
class AppSizes {
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double h(BuildContext context, double factor) =>
      screenHeight(context) * factor;

  static double w(BuildContext context, double factor) =>
      screenWidth(context) * factor;
}

/// ✅ App Colors
class AppColors {
  static const Color primary = Color(0xFFE53935); // Red shade
  static const Color background = Colors.white;
  static const Color text = Colors.black45;
  static const Color secondary = Color(0xFFEF9A9A); // Light red
  static const Color grey = Color(0xFFBDBDBD);
}

/// ✅ Default Box Decoration
class AppDecorations {
  static BoxDecoration container =  BoxDecoration(
     gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0.1),
      Colors.white.withOpacity(0.2),
    ],
  ),
           // color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          );
}

/// ✅ Responsive Text Styles (base styles, just change fontSize when using)
class AppTextStyle {
  static TextStyle headline1(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.text,
        fontSize: AppSizes.h(context, 0.03),
      );

  static TextStyle headline2(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.text,
        fontSize: AppSizes.h(context, 0.025),
      );

  static TextStyle bodyText(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        color: AppColors.text,
        fontSize: AppSizes.h(context, 0.02),
      );

  static TextStyle smallText(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColors.text,
        fontSize: AppSizes.h(context, 0.016),
      );
}
