import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EAppBar({
    required this.title,
    super.key,
    this.titleStyle,
    this.isBackButtonVisible,
    this.onNotificationTap,
  });

  final String title;
  final TextStyle? titleStyle;
  final bool? isBackButtonVisible;
  final void Function()? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final isInDashboard = isBackButtonVisible != null
        ? !isBackButtonVisible!
        : context.router.current.name == DashboardRoute.name;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isInDashboard)
            IconButton(
              padding: const EdgeInsets.all(16.0),
              onPressed: context.maybePop,
              icon: const Icon(EcommerceIcons.arrow),
            ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isInDashboard) const Gap(24.0),
              Text(
                title,
                style: titleStyle ?? context.h2,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.all(14),
                onPressed: onNotificationTap ??
                    () => context.pushRoute(const NotificationsRoute()),
                icon: const Icon(EcommerceIcons.bell),
              ),
              const Gap(24.0),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
