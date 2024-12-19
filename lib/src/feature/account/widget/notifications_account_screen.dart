import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';

@RoutePage()
class NotificationsAccountScreen extends StatefulWidget {
  const NotificationsAccountScreen({super.key});

  @override
  State<NotificationsAccountScreen> createState() =>
      _NotificationsAccountScreenState();
}

class _NotificationsAccountScreenState
    extends State<NotificationsAccountScreen> {
  Map<String, bool> notificationSettings = {
    'General Notifications': true,
    'Sound': true,
    'Vibration': false,
    'Special Offers': true,
    'Promo and Discounts': false,
    'Payment': false,
    'Cashback': true,
    'App Updates': false,
    'New Service Available': true,
    'New Tips Available': false,
  };

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const EAppBar(title: 'Notifications'),
        body: Column(
          children: [
            const Divider(indent: 24, endIndent: 24, thickness: 2),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final key = notificationSettings.keys.elementAt(index);
                  final value = notificationSettings.values.elementAt(index);
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text(key),
                    trailing: ShadSwitch(
                      margin: 3,
                      value: value,
                      onChanged: (value) =>
                          setState(() => notificationSettings[key] = value),
                    ),
                    onTap: () => setState(
                      () => notificationSettings[key] =
                          !notificationSettings[key]!,
                    ),
                  );
                },
                separatorBuilder: (_, __) =>
                    const Divider(indent: 24, endIndent: 24, thickness: 2),
                itemCount: notificationSettings.length,
              ),
            ),
          ],
        ),
      );
}
