import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';

@RoutePage()
class MyDetailsScreen extends StatelessWidget {
  const MyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: EAppBar(title: 'My Details'),
        body: Center(
          child: Text('My Details Screen'),
        ),
  );
}
