import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20.0),
            Text('Today', style: context.h4),
            ListTile(
              leading: const Icon(EcommerceIcons.discount),
              title: const Text('30% Special Discount!'),
              subtitle: const Text(
                'Special promotion valid today.',
                style: TextStyle(
                  color: Color(0xff808080),
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
            const Gap(20.0),
            Text('Yesterday', style: context.h4),
            ListTile(
              leading: const Icon(Icons.wallet_giftcard),
              title: const Text('Top Up E-wallet Successfully!'),
              subtitle: const Text(
                'You have top up your e-wallet.',
                style: TextStyle(
                  color: Color(0xff808080),
                ),
              ),
              onTap: () {},
            ),
            const Divider(indent: 50),
            ListTile(
              leading: const Icon(EcommerceIcons.location),
              title: const Text('New Service Available!'),
              subtitle: const Text(
                'Now you can track order in real-time.',
                style: TextStyle(
                  color: Color(0xff808080),
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
            const Gap(20.0),
            Text('June 7, 2024', style: context.h4),
            ListTile(
              leading: const Icon(EcommerceIcons.card),
              title: const Text('Credit Card Connected!'),
              subtitle: const Text(
                'Credit card has been linked.',
                style: TextStyle(
                  color: Color(0xff808080),
                ),
              ),
              onTap: () {},
            ),
            const Divider(indent: 50),
            ListTile(
              leading: const Icon(EcommerceIcons.user),
              title: const Text('Account Setup Successfully!'),
              subtitle: const Text(
                'Your account has been created.',
                style: TextStyle(
                  color: Color(0xff808080),
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
          ],
        ),
      ),
    ],
  );
}
