import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marboket_app/app/extensions/to_material_color.dart';
import 'package:marboket_app/app/themes/app_dark_theme_colors.dart';

import 'app_light_theme_colors.dart';

/// Define all themes here.
class AppThemes {
  AppThemes._();

  static ThemeData light = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppLightThemeColors.primary,
        onPrimary: AppLightThemeColors.onPrimary,
        secondary: AppLightThemeColors.secondary,
        onSecondary: AppLightThemeColors.onSecondary,
        error: AppLightThemeColors.error,
        onError: AppLightThemeColors.onError,
        background: AppLightThemeColors.background,
        onBackground: AppLightThemeColors.onBackground,
        surface: AppLightThemeColors.surface,
        onSurface: AppLightThemeColors.onSurface),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black), // Text widget
      bodySmall: const TextStyle(color: Colors.black),
      displayLarge: const TextStyle(color: Colors.black),
      displayMedium: const TextStyle(color: Colors.black),
      displaySmall: const TextStyle(color: Colors.black),
      headlineLarge: const TextStyle(color: Colors.black),
      headlineMedium: const TextStyle(color: Colors.black),
      headlineSmall: const TextStyle(color: Colors.black),
      labelLarge: const TextStyle(color: Colors.black),
      labelMedium: const TextStyle(color: Colors.black),
      labelSmall: const TextStyle(color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black),
      titleMedium: const TextStyle(color: Colors.black), // Text widget
      titleSmall: const TextStyle(color: Colors.black),
    ),
    // brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.blue, // Customize the app bar color
      elevation: 0, // Set the elevation of the app bar
      titleTextStyle: TextStyle(
        color: Colors.white, // Customize the app bar text color
        fontSize: 20, // Customize the app bar text size
        fontWeight: FontWeight.bold, // Customize the app bar text weight
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black, // Customize the default button color
      textTheme:
          ButtonTextTheme.normal, // Customize the default button text color
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8), // Customize the button border radius
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue;
          }
          return Colors.transparent;
        }),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue;
          }
          return Colors.transparent;
        }),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return AppLightThemeColors.secondary;
          }
          return AppLightThemeColors.primary;
        }),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      hoverColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        // if (states.contains(MaterialState.pressed)) {
        //   return Colors.blue;
        // }
        return Colors.transparent;
      }), textStyle: MaterialStateProperty.resolveWith((states) {
        // if (states.contains(MaterialState.pressed)) {
        //   return const TextStyle(color: Colors.white);
        // }
        return const TextStyle(color: Colors.white);
      })),
    ),
    cardColor: AppLightThemeColors.primary,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(
          AppLightThemeColors.primary), // Customize the fill color
      overlayColor: MaterialStateProperty.all(AppLightThemeColors.primary
          .withOpacity(0.2)), // Customize the overlay color
      splashRadius: 16, // Customize the splash radius
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Customize the tap target size
      visualDensity:
          VisualDensity.adaptivePlatformDensity, // Customize the visual density
    ),
    iconTheme: const IconThemeData(
      color: AppLightThemeColors.onPrimary, // Customize the default icon color
      size: 24, // Customize the default icon size
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8), // Customize the elevated button border radius
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.blue, width: 2), // Customize the focused input border
        borderRadius: BorderRadius.circular(
            8), // Customize the focused input border radius
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1), // Customize the enabled input border
        borderRadius: BorderRadius.circular(
            8), // Customize the enabled input border radius
      ),
    ),
    // Add more customizations as needed
  );

  static Color lightColor = const Color.fromRGBO(187, 225, 250, 1);
  static Color primaryColor = const Color.fromRGBO(15, 76, 117, 1);
  static Color secondaryColor = const Color.fromRGBO(50, 130, 184, 1);
  static ThemeData dark = ThemeData(
    primarySwatch: Colors.black.asMaterialColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppDarkThemeColors.primary,
        onPrimary: AppDarkThemeColors.onPrimary,
        secondary: AppDarkThemeColors.secondary,
        onSecondary: AppDarkThemeColors.onSecondary,
        error: AppDarkThemeColors.error,
        onError: AppDarkThemeColors.onError,
        background: AppDarkThemeColors.background,
        onBackground: AppDarkThemeColors.onBackground,
        surface: AppDarkThemeColors.surface,
        onSurface: AppDarkThemeColors.onSurface),
    // textTheme: GoogleFonts.robotoTextTheme().copyWith(
    //   bodyLarge: const TextStyle(color: Colors.black),
    //   bodyMedium: TextStyle(color: lightColor), // Text widget
    //   bodySmall: const TextStyle(color: Colors.black),
    //   displayLarge: const TextStyle(color: Colors.black),
    //   displayMedium: const TextStyle(color: Colors.black),
    //   displaySmall: const TextStyle(color: Colors.black),
    //   headlineLarge: const TextStyle(color: Colors.black),
    //   headlineMedium: const TextStyle(color: Colors.black),
    //   headlineSmall: const TextStyle(color: Colors.black),
    //   labelLarge: const TextStyle(color: Colors.black),
    //   labelMedium: const TextStyle(color: Colors.black),
    //   labelSmall: const TextStyle(color: Colors.black),
    //   titleLarge: const TextStyle(color: Colors.black),
    //   titleMedium: TextStyle(color: lightColor), // Text widget
    //   titleSmall: const TextStyle(color: Colors.black),
    // ),
    // brightness: Brightness.dark,
    // scaffoldBackgroundColor: AppDarkThemeColors.primary,
    // appBarTheme: AppBarTheme(
    //   color: AppDarkThemeColors.primary, // Customize the app bar color
    //   elevation: 0, // Set the elevation of the app bar
    //   titleTextStyle: TextStyle(
    //     color: lightColor, // Customize the app bar text color
    //     fontSize: 20, // Customize the app bar text size
    //     fontWeight: FontWeight.bold, // Customize the app bar text weight
    //   ),
    // ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: Colors.black, // Customize the default button color
    //   textTheme:
    //       ButtonTextTheme.primary, // Customize the default button text color
    //   shape: RoundedRectangleBorder(
    //     borderRadius:
    //         BorderRadius.circular(8), // Customize the button border radius
    //   ),
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.resolveWith((states) {
    //       if (states.contains(MaterialState.pressed)) {
    //         return Colors.black;
    //       }
    //       return Colors.transparent;
    //     }),
    //   ),
    // ),
    // filledButtonTheme: FilledButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.resolveWith((states) {
    //       if (states.contains(MaterialState.pressed)) {
    //         return primaryColor;
    //       }
    //       return Colors.transparent;
    //     }),
    //   ),
    // ),
    // iconButtonTheme: IconButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.resolveWith((states) {
    //       if (states.contains(MaterialState.pressed)) {
    //         return primaryColor;
    //       }
    //       return lightColor;
    //     }),
    //   ),
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: primaryColor,
    //   hoverColor: lightColor,
    // ),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.resolveWith((states) {
    //     // if (states.contains(MaterialState.pressed)) {
    //     //   return primaryColor;
    //     // }
    //     return Colors.transparent;
    //   }), textStyle: MaterialStateProperty.resolveWith((states) {
    //     // if (states.contains(MaterialState.pressed)) {
    //     //   return const TextStyle(color: lightColor);
    //     // }
    //     return TextStyle(color: lightColor);
    //   })),
    // ),
    cardColor: AppDarkThemeColors.primary,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(
          AppDarkThemeColors.primary), // Customize the fill color
      overlayColor: MaterialStateProperty.all(AppDarkThemeColors.primary
          .withOpacity(0.2)), // Customize the overlay color
      splashRadius: 16, // Customize the splash radius
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Customize the tap target size
      visualDensity:
          VisualDensity.adaptivePlatformDensity, // Customize the visual density
    ),
    // iconTheme: IconThemeData(
    //   color: lightColor, // Customize the default icon color
    //   size: 24, // Customize the default icon size
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(
    //         primaryColor), // Customize the elevated button color
    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(
    //             8), // Customize the elevated button border radius
    //       ),
    //     ),
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //         color: primaryColor,
    //         width: 2), // Customize the focused input border
    //     borderRadius: BorderRadius.circular(
    //         8), // Customize the focused input border radius
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //         color: Colors.grey[400]!,
    //         width: 1), // Customize the enabled input border
    //     borderRadius: BorderRadius.circular(
    //         8), // Customize the enabled input border radius
    //   ),
    // ),
    // Add more customizations as needed
  );
}
