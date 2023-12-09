import 'package:comdig/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white.withOpacity(0.97),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.darkGray,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: AppColors.darkGray,
          size: 30,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.darkGray,
          size: 30,
        ),
        titleSpacing: 20,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        elevation: 5,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: AppColors.lightGray,
        selectedIconTheme: IconThemeData(
          color: AppColors.purple,
          size: 27,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.lightGray,
          size: 27,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColors.purple,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.lightGray,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.purple,
          elevation: 5,
          disabledBackgroundColor: AppColors.lightPurple,
          disabledForegroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(
            color: AppColors.purple,
            fontSize: 22,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.transparent,
          shadowColor: AppColors.transparent,
          elevation: 5,
          disabledBackgroundColor: AppColors.gray,
          side: const BorderSide(width: 1, color: AppColors.purple),
          foregroundColor: AppColors.purple,
          textStyle: const TextStyle(
            color: AppColors.purple,
            fontSize: 18,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purple,
          disabledBackgroundColor: AppColors.gray,
          disabledForegroundColor: AppColors.white,
          elevation: 5,
          side: const BorderSide(width: 1, color: AppColors.purple),
          foregroundColor: AppColors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundColor: AppColors.purple,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.purple,
        size: 27,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.purple,
          elevation: 5,
          disabledBackgroundColor: AppColors.gray,
          side: const BorderSide(width: 1, color: AppColors.purple),
          foregroundColor: AppColors.purple,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.purple.withOpacity(0.4);
          } else {
            return AppColors.purple.withOpacity(0.4);
          }
        }),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: AppColors.purple),
              borderRadius: BorderRadius.circular(10),
            );
          } else {
            return RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: AppColors.transparent),
              borderRadius: BorderRadius.circular(10),
            );
          }
        }),
        hintStyle: MaterialStateProperty.resolveWith(
            (states) => const TextStyle(color: AppColors.lightGray)),
        textStyle:
            MaterialStateProperty.resolveWith((states) => const TextStyle()),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.iceWhite.withOpacity(0.4)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColors.lightGray),
        fillColor: AppColors.iceWhite.withOpacity(0.4),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColors.transparent, width: 0.5),
        ),
        errorStyle: const TextStyle(height: 0),
        activeIndicatorBorder:
            const BorderSide(color: AppColors.purple, width: 2),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.white),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.purple;
          } else {
            return AppColors.white;
          }
        }),
        side: const BorderSide(
          color: AppColors.iceWhite,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: AppColors.transparent),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        largeSize: 15,
        smallSize: 5,
        alignment: Alignment.topRight,
        textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 5,
        titleTextStyle: const TextStyle(
          color: AppColors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          color: AppColors.black,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: AppColors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardColor: AppColors.white,
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      colorScheme: ColorScheme(
        background: AppColors.white.withOpacity(0.97),
        brightness: Brightness.light,
        primary: AppColors.purple,
        onPrimary: AppColors.white,
        secondary: AppColors.white,
        onSecondary: AppColors.lightGray,
        error: AppColors.red,
        onError: AppColors.red,
        onBackground: AppColors.white,
        surface: AppColors.darkPurple,
        onSurface: AppColors.purple,
        primaryContainer: AppColors.orange,
        inversePrimary: AppColors.lightPurple,
        inverseSurface: AppColors.purple,
        onPrimaryContainer: AppColors.lightPurple,
        onSecondaryContainer: AppColors.darkGray,
        onTertiary: AppColors.white,
        shadow: AppColors.white.withOpacity(0.97),
        outline: AppColors.purple,
        surfaceTint: AppColors.purple.withOpacity(0.5),
        onSurfaceVariant: AppColors.orange,
        outlineVariant: AppColors.white,
      ),
    );
  }

  static dark() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkPurple.withOpacity(0.6),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: AppColors.white,
          size: 30,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.white,
          size: 30,
        ),
        titleSpacing: 20,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkPurple,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        enableFeedback: true,
        elevation: 5,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.lightPurple,
        selectedIconTheme: IconThemeData(
          color: AppColors.white,
          size: 27,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.lightPurple,
          size: 27,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.lightPurple,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.purple,
          elevation: 5,
          disabledBackgroundColor: AppColors.lightPurple,
          disabledForegroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(
            color: AppColors.purple,
            fontSize: 22,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.transparent,
          shadowColor: AppColors.transparent,
          elevation: 5,
          disabledBackgroundColor: AppColors.gray,
          side: const BorderSide(width: 1, color: AppColors.white),
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(
            color: AppColors.purple,
            fontSize: 18,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purple,
          disabledBackgroundColor: AppColors.gray,
          disabledForegroundColor: AppColors.white,
          elevation: 5,
          side: const BorderSide(width: 1, color: AppColors.purple),
          foregroundColor: AppColors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 27,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.purple,
          elevation: 5,
          disabledBackgroundColor: AppColors.gray,
          side: const BorderSide(width: 1, color: AppColors.purple),
          foregroundColor: AppColors.purple,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.purple.withOpacity(0.4);
          } else {
            return AppColors.purple.withOpacity(0.4);
          }
        }),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: AppColors.purple),
              borderRadius: BorderRadius.circular(10),
            );
          } else {
            return RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: AppColors.transparent),
              borderRadius: BorderRadius.circular(10),
            );
          }
        }),
        hintStyle: MaterialStateProperty.resolveWith(
            (states) => const TextStyle(color: AppColors.lightGray)),
        textStyle:
            MaterialStateProperty.resolveWith((states) => const TextStyle()),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => AppColors.lightPurple.withOpacity(0.1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.lightPurple.withOpacity(0.1),
        errorStyle: const TextStyle(height: 0),
        hintStyle: const TextStyle(color: AppColors.lightGray),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.purple, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColors.transparent, width: 0.5),
        ),
        focusColor: AppColors.purple,
        activeIndicatorBorder:
            const BorderSide(color: AppColors.purple, width: 2),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.white),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.purple;
          } else {
            return AppColors.white;
          }
        }),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: AppColors.white),
          borderRadius: BorderRadius.circular(5),
        ),
        side: const BorderSide(color: AppColors.white, width: 2),
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        largeSize: 15,
        smallSize: 5,
        alignment: Alignment.topRight,
        textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 5,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        backgroundColor: AppColors.darkPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      colorScheme: ColorScheme(
        background: AppColors.darkPurple.withOpacity(0.6),
        brightness: Brightness.dark,
        primary: AppColors.white,
        onPrimary: AppColors.orange,
        secondary: AppColors.black,
        onSecondary: AppColors.lightGray,
        error: AppColors.red,
        onError: AppColors.black,
        onBackground: AppColors.black,
        surface: AppColors.black,
        onSurface: AppColors.darkPurple,
        primaryContainer: AppColors.orange,
        inversePrimary: AppColors.lightPurple,
        inverseSurface: AppColors.lightPurple,
        onPrimaryContainer: AppColors.lightPurple,
        onSecondaryContainer: AppColors.white,
        onTertiary: AppColors.darkPurple,
        shadow: AppColors.purple.withOpacity(0.5),
        outline: AppColors.white,
        surfaceTint: AppColors.lightPurple.withOpacity(0.5),
        onSurfaceVariant: AppColors.purple,
        outlineVariant: AppColors.white,
      ),
      cardColor: AppColors.purple,
      cardTheme: CardTheme(
        color: AppColors.purple,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          color: AppColors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: AppColors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
