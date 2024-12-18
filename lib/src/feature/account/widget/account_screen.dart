import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Account', style: context.shadTheme.textTheme.h2),
                    IconButton(
                      padding: const EdgeInsets.all(14),
                      onPressed: () =>
                          context.pushRoute(const NotificationsRoute()),
                      icon: const Icon(EcommerceIcons.bell),
                    ),
                  ],
                ),
              ),
              const Divider(indent: 24, endIndent: 24, thickness: 2),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        leading: const Icon(EcommerceIcons.box),
                        title: const Text('My Orders'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        onTap: () => context.pushRoute(const MyOrdersRoute()),
                      ),
                    ),
                    const Divider(thickness: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        leading: const Icon(EcommerceIcons.details),
                        title: const Text('My Details'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        onTap: () => context.pushRoute(const MyDetailsRoute()),
                      ),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        leading: Icon(EcommerceIcons.address),
                        title: Text('Address Book'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        // onTap: () => context.pushRoute(const AddressRoute()),
                      ),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        leading: const Icon(EcommerceIcons.card),
                        title: const Text('Payment Methods'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        onTap: () =>
                            context.pushRoute(const PaymentMethodRoute()),
                      ),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        leading: const Icon(EcommerceIcons.bell),
                        title: const Text('Notifications'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        onTap: () => context
                            .pushRoute(const NotificationsAccountRoute()),
                      ),
                    ),
                    const Divider(thickness: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        leading: const Icon(EcommerceIcons.question),
                        title: const Text('FAQs'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        onTap: () => context.pushRoute(const FaqRoute()),
                      ),
                    ),
                    const Divider(indent: 80, endIndent: 24, thickness: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        leading: const Icon(EcommerceIcons.headphones),
                        title: const Text('Help Center'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB3B3B3),
                        ),
                        onTap: () => context.pushRoute(const HelpCenterRoute()),
                      ),
                    ),
                    const Divider(thickness: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
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
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
