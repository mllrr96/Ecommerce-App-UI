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
}
