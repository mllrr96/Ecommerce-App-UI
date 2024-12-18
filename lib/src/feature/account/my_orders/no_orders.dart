import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({required this.title, required this.description, super.key});

  const NoOrders.ongoing({super.key})
      : title = 'No Ongoing Orders!',
        description = 'You don’t have any ongoing\norders at this time.';

  const NoOrders.completed({super.key})
      : title = 'No Completed Orders!',
        description = 'You don’t have any completed\norders at this time.';

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadImage(Assets.images.boxDuotone.path),
            const Gap(16.0),
            Text(
              title,
              style: context.shadTheme.textTheme.h4,
            ),
            const Gap(12.0),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xff808080),
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
