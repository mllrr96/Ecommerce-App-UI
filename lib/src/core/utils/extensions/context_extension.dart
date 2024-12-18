import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ContextExtension on BuildContext {
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;

  bool get hasBottomPadding => MediaQuery.of(this).viewPadding.bottom > 0;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ShadThemeData get shadTheme => ShadTheme.of(this);

  ThemeData get theme => Theme.of(this);

  void unfocus() => FocusScope.of(this).unfocus();

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  SystemUiOverlayStyle get adaptiveUiOverlay => SystemUiOverlayStyle(
        statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: ShadTheme.of(this).cardTheme.backgroundColor,
        statusBarColor: ShadTheme.of(this).cardTheme.backgroundColor,
      );

  // Text Styles
  TextStyle get h1 => shadTheme.textTheme.h1;

  TextStyle get h2 => shadTheme.textTheme.h2;

  TextStyle get h3 => shadTheme.textTheme.h3;

  TextStyle get h4 => shadTheme.textTheme.h4;

  TextStyle get b1Regular => shadTheme.textTheme.h4.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get b1Medium => shadTheme.textTheme.h4.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get b1SemiBold => shadTheme.textTheme.h4.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  TextStyle get b2Regular => shadTheme.textTheme.h4.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get b2Medium => shadTheme.textTheme.h4.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get b2SemiBold => shadTheme.textTheme.h4.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  TextStyle get b3Regular => shadTheme.textTheme.h4.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get b3Medium => shadTheme.textTheme.h4.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  TextStyle get b3SemiBold => shadTheme.textTheme.h4.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );
}
