import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = context.b2SemiBold;
    final descriptionTextStyle =
        context.b3Regular.copyWithColor(EColors.primary500);
    return Theme(
      data: context.theme.copyWith(
        listTileTheme: context.theme.listTileTheme.copyWith(
          titleTextStyle: titleTextStyle,
          subtitleTextStyle: descriptionTextStyle,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          const Gap(20.0),
          Text('Today', style: context.h4),
          ListTile(
            leading: const Icon(EcommerceIcons.discount),
            title: const Text('30% Special Discount!'),
            subtitle: const Text(
              'Special promotion valid today.',
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
            ),
            onTap: () {},
          ),
          const Divider(indent: 50),
          ListTile(
            leading: const Icon(EcommerceIcons.location),
            title: const Text('New Service Available!'),
            subtitle: const Text(
              'Now you can track order in real-time.',
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
            ),
            onTap: () {},
          ),
          const Divider(indent: 50),
          ListTile(
            leading: const Icon(EcommerceIcons.user),
            title: const Text('Account Setup Successfully!'),
            subtitle: const Text(
              'Your account has been created.',
            ),
            onTap: () {},
          ),
          const Divider(),
        ],
      ),
    );
  }
}
