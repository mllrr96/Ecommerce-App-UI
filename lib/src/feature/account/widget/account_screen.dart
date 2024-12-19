import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const EAppBar(title: 'Account', isBackButtonVisible: false,),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(indent: 24, endIndent: 24, thickness: 2),
            SingleChildScrollView(
              child: Theme(
                data: context.theme.copyWith(
                  listTileTheme: context.theme.listTileTheme.copyWith(
                    contentPadding: const EdgeInsets.only(
                      left: 40.0,
                      right: 24.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(EcommerceIcons.box),
                      title: const Text('My Orders'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      onTap: () {
                        AutoRouter.of(context).push(const MyOrdersRoute());
                        // context.pushRoute(const MyOrdersRoute());
                      },
                    ),
                    const Divider(thickness: 8),
                    ListTile(
                      leading: const Icon(EcommerceIcons.details),
                      title: const Text('My Details'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      onTap: () => context.pushRoute(const MyDetailsRoute()),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    const ListTile(
                      leading: Icon(EcommerceIcons.address),
                      title: Text('Address Book'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      // onTap: () => context.pushRoute(const AddressRoute()),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    ListTile(

                      leading: const Icon(EcommerceIcons.card),
                      title: const Text('Payment Methods'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      onTap: () =>
                          context.pushRoute(const PaymentMethodRoute()),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    ListTile(
                      leading: const Icon(EcommerceIcons.bell),
                      title: const Text('Notifications'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      onTap: () =>
                          context.pushRoute(const NotificationsAccountRoute()),
                    ),
                    const Divider(thickness: 8),
                    ListTile(
                      leading: const Icon(EcommerceIcons.question),
                      title: const Text('FAQs'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      onTap: () => context.pushRoute(const FaqRoute()),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    ListTile(
                      leading: const Icon(EcommerceIcons.headphones),
                      title: const Text('Help Center'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: EColors.primary300,
                      ),
                      onTap: () => context.pushRoute(const HelpCenterRoute()),
                    ),
                    const Divider(thickness: 8),
                    ListTile(
                      leading: const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          EcommerceIcons.logout,
                          color: Colors.red,
                        ),
                      ),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {
                        showShadDialog<bool?>(
                          context: context,
                          builder: (context) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: ShadDialog(
                              padding: const EdgeInsets.all(25),
                              closeIcon: const SizedBox.shrink(),
                              title: const Text('Logout?'),
                              description: const Text(
                                'Are you sure you want to logout?',
                              ),
                              actions: [
                                ShadButton.outline(
                                  height: 54,
                                  onPressed: context.maybePop,
                                  child: const Text('No, Cancel'),
                                ),
                                ShadButton.destructive(
                                  height: 54,
                                  onPressed: () {
                                    context.router.replaceAll([
                                      const SplashRoute(),
                                    ]);
                                  },
                                  child: const Text('Yes, Logout'),
                                ),
                              ],
                              child: const Icon(
                                EcommerceIcons.warning,
                                color: Colors.red,
                                size: 48,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
