import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sizzle_starter/src/feature/initialization/widget/material_context.dart';

class RootContext extends StatelessWidget {
  const RootContext({super.key});
  @override
  Widget build(BuildContext context) => DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: const MaterialContext(),
      );
}
