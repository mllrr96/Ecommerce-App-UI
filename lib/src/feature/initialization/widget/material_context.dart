import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/localization/localization.dart';
import 'package:sizzle_starter/src/core/route/app_route.dart';

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  static final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => ShadApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: Localization.localizationDelegates,
        supportedLocales: Localization.supportedLocales,
        routerConfig: _appRouter.config(),
        themeMode: ThemeMode.light,
        theme: ShadThemeData(
          colorScheme: const ShadStoneColorScheme.light(),
          brightness: Brightness.light,
          textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.openSans),
        ),
        darkTheme: ShadThemeData(
          colorScheme: const ShadSlateColorScheme.dark(),
          brightness: Brightness.dark,
          textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.openSans),
        ),
      );
}
