import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.pushRoute(const AddressRoute()),
              child: Image.asset(Assets.images.cartDuotone.path),
            ),
            const Gap(16.0),
            Text(
              'Your Cart is Empty!',
              style: context.h4,
            ),
            const Gap(12.0),
            const Text(
              'When you add products, they’ll\nappear here.',
              style: TextStyle(
                color: EColors.primary500,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
