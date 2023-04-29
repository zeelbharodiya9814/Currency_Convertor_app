// import 'package:flutter/material.dart';
//
// darkTheme() {
//   return ThemeData(
//     colorScheme: darkColorScheme,
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     primaryColor: const Color(0xFFADC6FF),
//     // textTheme: GoogleFonts.poppinsTextTheme(const TextTheme()),
//   );
// }
//
// lightTheme() {
//   return ThemeData(
//     colorScheme: lightColorScheme,
//     useMaterial3: true,
//     brightness: Brightness.light,
//     // textTheme: GoogleFonts.poppinsTextTheme(const TextTheme()),
//   );
// }
//
// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xFF005AC2),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFFD8E2FF),
//   onPrimaryContainer: Color(0xFF001A41),
//   secondary: Color(0xFF575E71),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFFDBE2F9),
//   onSecondaryContainer: Color(0xFF141B2C),
//   tertiary: Color(0xFF715573),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFFFBD7FC),
//   onTertiaryContainer: Color(0xFF29132D),
//   error: Color(0xFFBA1A1A),
//   errorContainer: Color(0xFFFFDAD6),
//   onError: Color(0xFFFFFFFF),
//   onErrorContainer: Color(0xFF410002),
//   background: Color(0xFFFEFBFF),
//   onBackground: Color(0xFF1B1B1F),
//   surface: Color(0xFFFEFBFF),
//   onSurface: Color(0xFF1B1B1F),
//   surfaceVariant: Color(0xFFE1E2EC),
//   onSurfaceVariant: Color(0xFF44474F),
//   outline: Color(0xFF75777F),
//   onInverseSurface: Color(0xFFF2F0F4),
//   inverseSurface: Color(0xFF303033),
//   inversePrimary: Color(0xFFADC6FF),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF005AC2),
//   // outlineVariant: Color(0xFFC4C6D0),
//   // scrim: Color(0xFF000000),
// );
//
// const darkColorScheme = ColorScheme(
//
//   brightness: Brightness.dark,
//   primary: Color(0xFFADC6FF),
//   onPrimary: Color(0xFF002E69),
//   primaryContainer: Color(0xFF004494),
//   onPrimaryContainer: Color(0xFFD8E2FF),
//   secondary: Color(0xFFBFC6DC),
//   onSecondary: Color(0xFF293041),
//   secondaryContainer: Color(0xFF3F4759),
//   onSecondaryContainer: Color(0xFFDBE2F9),
//   tertiary: Color(0xFFDEBCDF),
//   onTertiary: Color(0xFF402843),
//   tertiaryContainer: Color(0xFF583E5B),
//   onTertiaryContainer: Color(0xFFFBD7FC),
//   error: Color(0xFFFFB4AB),
//   errorContainer: Color(0xFF93000A),
//   onError: Color(0xFF690005),
//   onErrorContainer: Color(0xFFFFDAD6),
//   background: Colors.grey[900],
//   onBackground: Color(0xFFE3E2E6),
//   surface: Color(0xFF1B1B1F),
//   onSurface: Color(0xFFE3E2E6),
//   surfaceVariant: Color(0xFF44474F),
//   onSurfaceVariant: Color(0xFFC4C6D0),
//   outline: Color(0xFF8E9099),
//   onInverseSurface: Color(0xFF1B1B1F),
//   inverseSurface: Color(0xFFE3E2E6),
//   inversePrimary: Color(0xFF005AC2),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFFADC6FF),
//   // outlineVariant: Color(0xFF44474F),
//   // scrim: Color(0xFF000000),
// );



import 'package:flutter/material.dart';

class NeumorphicTheme {
  NeumorphicTheme({
    required this.outerShadow,
    required this.innerShadowColors,
    required this.borderColor,
    required this.buttonColor,
    this.isDark = false,
  });

  final List<BoxShadow> outerShadow;
  final List<Color> innerShadowColors;
  final Color borderColor;
  final Color buttonColor;
  final bool isDark;
}

final darkNeumorphicTheme = NeumorphicTheme(
  innerShadowColors: [
    kDarkBackgroundShadowColour,
    kOutline,
  ],
  borderColor: kOutline,
  buttonColor: kDarkBackgroundColour,
  outerShadow: kDarkBackgroundShadow,
  isDark: true,
);
final lightNeumorphicTheme = NeumorphicTheme(
  innerShadowColors: [kDarkShadow, Colors.white],
  borderColor: Colors.transparent,
  buttonColor: kBackgroundColour,
  outerShadow: kShadow,
);

final kBackgroundColour = Color.fromRGBO(239, 238, 238, 1);
final kOrange = Color.fromRGBO(238, 134, 48, 1); // rgb(238, 134, 48)
final kDarkShadow = Color.fromRGBO(216, 213, 208, 1); // rgb(216, 213, 208)
final kDarkBackgroundColour = Color.fromRGBO(38, 38, 38, 1); // rgb(38,38,38)
final kDarkBackgroundShadowColour = Color.fromRGBO(
  30,
  30,
  30,
  1,
); // rgb(30,30,30)
final kOutline = Color.fromRGBO(46, 46, 46, 1); // rgb(46,46,46)

final kShadow = [
  BoxShadow(
    blurRadius: 15,
    offset: -Offset(5, 5),
    color: Colors.white,
  ),
  BoxShadow(
    blurRadius: 15,
    offset: Offset(4.5, 4.5),
    color: kDarkShadow,
  )
];

final kDarkBackgroundShadow = [
  BoxShadow(
    blurRadius: 15,
    offset: Offset(4.5, 4.5),
    color: kDarkBackgroundShadowColour,
  )
];
