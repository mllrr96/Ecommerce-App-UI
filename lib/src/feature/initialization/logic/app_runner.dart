import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizzle_starter/src/core/utils/app_bloc_observer.dart';
import 'package:sizzle_starter/src/core/utils/bloc_transformer.dart';
import 'package:sizzle_starter/src/core/utils/logger/logger.dart';
import 'package:sizzle_starter/src/core/utils/logger/printing_log_observer.dart';
import 'package:sizzle_starter/src/feature/initialization/logic/composition_root.dart';
import 'package:sizzle_starter/src/feature/initialization/widget/initialization_failed_app.dart';
import 'package:sizzle_starter/src/feature/initialization/widget/root_context.dart';

sealed class AppRunner {
  /// {@macro app_runner}
  const AppRunner._();

  /// Initializes dependencies and launches the application within a guarded execution zone.
  static Future<void> startup() async {
    final logger = const AppLoggerFactory(
      observers: [
        if (!kReleaseMode) PrintingLogObserver(logLevel: LogLevel.trace),
      ],
    ).create();

    await runZonedGuarded(
      () async {
        // Ensure Flutter is initialized
        WidgetsFlutterBinding.ensureInitialized();

        // Configure global error interception
        FlutterError.onError = logger.logFlutterError;
        WidgetsBinding.instance.platformDispatcher.onError =
            logger.logPlatformDispatcherError;

        // Setup bloc observer and transformer
        Bloc.observer = AppBlocObserver(logger);
        Bloc.transformer = SequentialBlocTransformer().transform;

        Future<void> launchApplication() async {
          try {
            runApp(const RootContext());
          } on Object catch (e, stackTrace) {
            logger.error(
              'Initialization failed',
              error: e,
              stackTrace: stackTrace,
            );
            runApp(
              InitializationFailedApp(
                error: e,
                stackTrace: stackTrace,
                onRetryInitialization: launchApplication,
              ),
            );
          }
        }

        // Launch the application
        await launchApplication();
      },
      logger.logZoneError,
    );
  }
}
