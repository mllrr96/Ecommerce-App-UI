import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text('Cart Screen'),
    ),
  );
}
