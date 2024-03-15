/// theme.dart
///
/// This file was created to store the application theme data
/// it was various class used to build application theme. It contains color scheme
/// texttheme and theme provider notifier.
///
/// Importing important packages used in this file.
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This utility class is defined to encapsulate themes and colors of the application.
/// AppTheme class contains the static members for definining light and dark mode used
/// within the application. It also contains a boolean flag [isDarkThemeMode] to determine whether
/// the dark mode is disabled or enabled. and also [isSystemThemeMode] to determine the system current theme
/// is disabled or enabled.
class AppTheme {
  // List of Different font sizes.
  static const double kTitleLargeSize = 22;
  static const double kTitleMediumSize = 16;
  static const double kTitleSmallSize = 14;
  static const double kBodyLargeSize = 16;
  static const double kBodyMediumSize = 14;
  static const double kBodySmallSize = 12;
  static const double klabellargeSize = 14;
  static const double klabelMediumSize = 12;
  static const double klabelSmallSize = 11;
  static const double kDisplayLargeSize = 32;
  static const double kDisplayMediumSize = 28;
  static const double kDisplaySmallSize = 24;

  static final ThemeData lightMode = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff28638a),
          surfaceTint: Color(0xff28638a),
          onPrimary: Color(0xffffffff),
          primaryContainer: Color(0xffcae6ff),
          onPrimaryContainer: Color(0xff001e30),
          secondary: Color(0xff50606e),
          onSecondary: Color(0xffffffff),
          secondaryContainer: Color(0xffd3e5f6),
          onSecondaryContainer: Color(0xff0c1d29),
          tertiary: Color(0xff65587b),
          onTertiary: Color(0xffffffff),
          tertiaryContainer: Color(0xffebddff),
          onTertiaryContainer: Color(0xff201634),
          error: Color(0xffba1a1a),
          onError: Color(0xffffffff),
          errorContainer: Color(0xffffdad6),
          onErrorContainer: Color(0xff410002),
          background: Color(0xfff7f9ff),
          onBackground: Color(0xff181c20),
          surface: Color(0xfff7f9ff),
          onSurface: Color(0xff181c20),
          surfaceVariant: Color(0xffdde3ea),
          onSurfaceVariant: Color(0xff41474d),
          outline: Color(0xff72787e),
          outlineVariant: Color(0xffc1c7ce),
          shadow: Color(0xff000000),
          scrim: Color(0xff000000),
          inverseSurface: Color(0xff2d3135),
          inversePrimary: Color(0xff96cdf8)));

  /// This 'darkMode' theme is for the light mode for the application.
  /// It will be used when [isDarkMode] is set to true.
  ///
  ///

  static final ExtraColors extraColorsLight = ExtraColors(
    primaryFixed: Color(0xffcae6ff),
    inverseOnSurface: Color(0xffeef1f6),
    onPrimaryFixed: Color(0xff001e30),
    primaryFixedDim: Color(0xff96cdf8),
    onPrimaryFixedVariant: Color(0xff004b70),
    secondaryFixed: Color(0xffd3e5f6),
    onSecondaryFixed: Color(0xff0c1d29),
    secondaryFixedDim: Color(0xffb7c9d9),
    onSecondaryFixedVariant: Color(0xff384956),
    tertiaryFixed: Color(0xffebddff),
    onTertiaryFixed: Color(0xff201634),
    tertiaryFixedDim: Color(0xffcfc0e8),
    onTertiaryFixedVariant: Color(0xff4d4162),
    surfaceDim: Color(0xffd7dadf),
    surfaceBright: Color(0xfff7f9ff),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff1f4f9),
    surfaceContainer: Color(0xffebeef3),
    surfaceContainerHigh: Color(0xffe5e8ed),
    surfaceContainerHighest: Color(0xffe0e3e8),
  );
  static final ExtraColors extraColorsDark = ExtraColors(
    primaryFixed: Color(0xffcae6ff),
    inverseOnSurface: Color(0xff2d3135),
    onPrimaryFixed: Color(0xff001e30),
    primaryFixedDim: Color(0xff96cdf8),
    onPrimaryFixedVariant: Color(0xff004b70),
    secondaryFixed: Color(0xffd3e5f6),
    onSecondaryFixed: Color(0xff0c1d29),
    secondaryFixedDim: Color(0xffb7c9d9),
    onSecondaryFixedVariant: Color(0xff384956),
    tertiaryFixed: Color(0xffebddff),
    onTertiaryFixed: Color(0xff201634),
    tertiaryFixedDim: Color(0xffcfc0e8),
    onTertiaryFixedVariant: Color(0xff4d4162),
    surfaceDim: Color(0xff101417),
    surfaceBright: Color(0xff363a3e),
    surfaceContainerLowest: Color(0xff0b0f12),
    surfaceContainerLow: Color(0xff181c20),
    surfaceContainer: Color(0xff1c2024),
    surfaceContainerHigh: Color(0xff262a2e),
    surfaceContainerHighest: Color(0xff313539),
  );

  static final ThemeData darkMode = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff96cdf8),
          surfaceTint: Color(0xff96cdf8),
          onPrimary: Color(0xff00344f),
          primaryContainer: Color(0xff004b70),
          onPrimaryContainer: Color(0xffcae6ff),
          secondary: Color(0xffb7c9d9),
          onSecondary: Color(0xff22323f),
          secondaryContainer: Color(0xff384956),
          onSecondaryContainer: Color(0xffd3e5f6),
          tertiary: Color(0xffcfc0e8),
          onTertiary: Color(0xff362b4a),
          tertiaryContainer: Color(0xff4d4162),
          onTertiaryContainer: Color(0xffebddff),
          error: Color(0xffffb4ab),
          onError: Color(0xff690005),
          errorContainer: Color(0xff93000a),
          onErrorContainer: Color(0xffffdad6),
          background: Color(0xff101417),
          onBackground: Color(0xffe0e3e8),
          surface: Color(0xff101417),
          onSurface: Color(0xffe0e3e8),
          surfaceVariant: Color(0xff41474d),
          onSurfaceVariant: Color(0xffc1c7ce),
          outline: Color(0xff8b9198),
          outlineVariant: Color(0xff41474d),
          shadow: Color(0xff000000),
          scrim: Color(0xff000000),
          inverseSurface: Color(0xffe0e3e8),
          inversePrimary: Color(0xff28638a)));

  /// This static member of the class contains the textstyle data.
  /// It returns the ThemeData class that contains textTheme.

  static TextTheme textTheme = TextTheme(
      bodyLarge: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(), fontSize: kBodyLargeSize),
      bodyMedium: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(), fontSize: kBodyMediumSize),
      bodySmall: TextStyle(
          fontSize: kBodySmallSize,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.roboto.toString()),
      displayLarge: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontSize: kDisplayLargeSize,
          fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontSize: kDisplayMediumSize,
          fontWeight: FontWeight.w400),
      displaySmall:
          TextStyle(fontSize: kDisplaySmallSize, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontWeight: FontWeight.w500,
          fontSize: klabellargeSize),
      labelMedium: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontSize: klabelMediumSize,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontSize: klabelSmallSize,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontSize: kTitleSmallSize,
          fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
          fontFamily: GoogleFonts.roboto.toString(),
          fontSize: kTitleLargeSize,
          fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.roboto.toString(),
        fontSize: kTitleMediumSize,
        fontWeight: FontWeight.w500,
      ));
}

// This class contains the extra colors used within the application.
class ExtraColors {
  final Color inverseOnSurface;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  const ExtraColors({
    required this.inverseOnSurface,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });
}

/// Class ThemeProvider extends to ChangeNotifier.
/// It is responsible for to theme theme according to the user.
/// preference. It also provide the listener.
class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme.darkMode;
  // Defining the theme Getter.
  ThemeData get getThemeData => _themeData;
  // Defining the theme setter.
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // It defined to apply user preferences.
  Future<void> applyUserTheme() async {
    // Creating SharePreferences instance.
    SharedPreferences userSettings = await SharedPreferences.getInstance();
    // Changing theme based on the user preference.
    if (userSettings.getBool("isDark") == false) {
      themeData = AppTheme.lightMode;
    } else if (userSettings.getBool("isDark") == true) {
      themeData = AppTheme.darkMode;
    } else {
      themeData = AppTheme.darkMode;
    }
  }

  // toggleTheme function swtich the theme from drak to light and vice versa.
  Future<void> toggleTheme() async {
    SharedPreferences userSettings = await SharedPreferences.getInstance();
    if (_themeData == AppTheme.lightMode) {
      themeData = AppTheme.darkMode;
      userSettings.setBool("isDark", false);
    } else {
      themeData = AppTheme.lightMode;
      userSettings.setBool("isDark", true);
    }
  }
}
