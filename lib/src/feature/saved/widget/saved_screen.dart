import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/feature/saved/widget/no_saved_items.dart';

@RoutePage()
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: EAppBar(title: 'Saved Items'),
        body: NoSavedItems(),
      );
}
