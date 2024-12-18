import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const EAppBar(title: 'Help Center'),
        body: Theme(
          data: context.theme.copyWith(
              listTileTheme: context.theme.listTileTheme.copyWith(
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffE6E6E6), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Divider(thickness: 2),
                const Gap(24.0),
                ListTile(
                  leading: const Icon(EcommerceIcons.headphones),
                  title: const Text('Customer Service'),
                  onTap: () {},
                ),
                const Gap(14.0),
                ListTile(
                  leading: const Icon(EcommerceIcons.whatsapp),
                  title: const Text('WhatsApp'),
                  onTap: () {},
                ),
                const Gap(14.0),
                ListTile(
                  leading: const Icon(EcommerceIcons.web),
                  title: const Text('Website'),
                  onTap: () {},
                ),
                const Gap(14.0),
                ListTile(
                  leading: const Icon(EcommerceIcons.facebook),
                  title: const Text('Facebook'),
                  onTap: () {},
                ),
                const Gap(14.0),
                ListTile(
                  leading: const Icon(EcommerceIcons.twitter),
                  title: const Text('Twitter'),
                  onTap: () {},
                ),
                const Gap(14.0),
                ListTile(
                  leading: const Icon(EcommerceIcons.instagram),
                  title: const Text('Instagram'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
}
