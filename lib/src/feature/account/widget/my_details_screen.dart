import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyDetailsScreen extends StatelessWidget {
  const MyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('My Details Screen'),
        ),
  );
}
