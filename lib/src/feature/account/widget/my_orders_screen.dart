import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('My Orders Screen'),
        ),
  );
}
