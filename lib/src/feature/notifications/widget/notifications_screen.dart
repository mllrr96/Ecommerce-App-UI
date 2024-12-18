import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';
import 'package:sizzle_starter/src/feature/notifications/widget/no_notification.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(24.0),
                    onPressed: context.maybePop,
                    icon: const Icon(EcommerceIcons.arrow),
                  ),
                  Text(
                    'Notifications',
                    style: context.shadTheme.textTheme.h3,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Icon(EcommerceIcons.bell),
                  ),
                ],
              ),
              const Divider(
                height: 0,
                indent: 24,
                endIndent: 24,
              ),
              const Expanded(child: Center(child: NoNotification())),
            ],
          ),
        ),
      );
}
