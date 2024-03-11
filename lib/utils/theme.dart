/// const_colors.dart
/// - This file contains the constant colors used for the application UI development.
///
/// Primary Color:
/// - These colors are for the most prominent components across the UI.
///
/// Secondary Colors:
/// - These are used for the less prominent components in the UI.
///
/// Error Color:
/// - Are to display error messages.
///
/// Surface Color:
/// - For More neutral backgrounds and containers like sheets, dialogs or cards.
///
/// Outline Color:
/// - colors use for oultining the UI components. like textfeild or outlined button etc.
///
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamx/utils/const_values.dart';

/// This utility class is defined to encapsulate themes and colors of the application.
/// AppTheme class contains the static members for definining light and dark mode used
/// within the application. It also contains a boolean flag [isDarkThemeMode] to determine whether
/// the dark mode is disabled or enabled. and also [isSystemThemeMode] to determine the system current theme
/// is disabled or enabled.
class AppTheme {
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
  static ThemeData textTheme({required BuildContext context}) {
    // List of Different font sizes.
    const double kTitleLargeSize = 22;
    const double kTitleMediumSize = 16;
    const double kTitleSmallSize = 14;
    const double kBodyLargeSize = 16;
    const double kBodyMediumSize = 14;
    const double kBodySmallSize = 12;
    const double klabellargeSize = 14;
    const double klabelMediumSize = 12;
    const double klabelSmallSize = 11;
    const double kDisplayLargeSize = 32;
    const double kDisplayMediumSize = 28;
    const double kDisplaySmallSize = 24;
    return ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kBodyLargeSize),
            bodyMedium: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kBodyMediumSize),
            bodySmall: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: kBodySmallSize,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto.toString(),
            ),
            displayLarge: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kDisplayLargeSize,
                fontWeight: FontWeight.w400),
            displayMedium: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kDisplayMediumSize,
                fontWeight: FontWeight.w400),
            displaySmall: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kDisplaySmallSize,
                fontWeight: FontWeight.w400),
            labelLarge: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: GoogleFonts.roboto.toString(),
                fontWeight: FontWeight.w500,
                fontSize: klabellargeSize),
            labelMedium: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: klabelMediumSize,
                fontWeight: FontWeight.w500),
            labelSmall: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: klabelSmallSize,
                fontWeight: FontWeight.w500),
            titleSmall: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kTitleSmallSize,
                fontWeight: FontWeight.w500),
            titleLarge: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kTitleLargeSize,
                fontWeight: FontWeight.w400),
            titleMedium: TextStyle(
                fontFamily: GoogleFonts.roboto.toString(),
                fontSize: kTitleMediumSize,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface)));
  }

  /// This function was defined to store the icon data. and returns the icondata from
  /// the ThemeData class to be used into the application to design icons.
  /// Returns:
  /// [ThemeData] - ThemeData class.
  /// Parameters:
  /// [context] - of type BuildContext: this parameter requires function context.
  static ThemeData iconUnSelected({required BuildContext context}) {
    // List of icon constant properties.
    const double kIconSize = 24;
    const double kFill = 0.0;
    // Returing Themedata Class.
    return ThemeData(
        // Using iconTheme property from the ThemeData Class.
        iconTheme: IconThemeData(
            size: kIconSize, // Size of icon.
            fill: kFill, // Fill of the icon.
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant // Color of the Icon.
            ));
  }
}

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

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.darkMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  Future<void> applyUserTheme() async {
    SharedPreferences userSettings = await SharedPreferences.getInstance();
    if (userSettings.getBool("isDark") == null) {
      _themeData = AppTheme.darkMode;
      print("theme setting were null");
    } else {
      print("Theme setting were not null");
      _themeData = userSettings.getBool("isDark")!
          ? AppTheme.darkMode
          : AppTheme.lightMode;
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
