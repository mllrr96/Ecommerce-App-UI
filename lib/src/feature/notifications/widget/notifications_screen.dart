import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/feature/notifications/widget/notification_content.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: EAppBar(
          title: 'Notifications',
          titleStyle: context.h3,
          onNotificationTap: (){},
        ),
        body: const SafeArea(
          child: Column(
            children: [
              Divider(
                indent: 24,
                endIndent: 24,
              ),
              Expanded(child: Center(child: NotificationContent())),
            ],
          ),
        ),
      );
}
