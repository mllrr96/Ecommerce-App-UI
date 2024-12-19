import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/feature/cart/widget/empty_cart.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: EAppBar(title: 'Cart'),
        body: Column(
          children: [
            Divider(
              indent: 24,
              endIndent: 24,
              height: 0,
            ),
            Expanded(child: EmptyCart()),
          ],
        ),
      );
}
