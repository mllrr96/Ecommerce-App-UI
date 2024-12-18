import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';

@RoutePage()
class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: EAppBar(title: 'FAQs'),
        body: Center(
          child: Text('FAQ Screen'),
        ),
      );
}
