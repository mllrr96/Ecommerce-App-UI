import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ShadImage(
        Assets.images.bellDuotone.path,
        height: 64,
        width: 64,
      ),
      const Gap(24.0),
      Flexible(
        child: Text(
          'You haven’t gotten\nany notifications yet!',
          style: context.shadTheme.textTheme.h4,
          textAlign: TextAlign.center,
        ),
      ),
      const Gap(12.0),
      Flexible(
        child: Text(
          'We’ll alert you when something\ncool happens.',
          style: context.shadTheme.textTheme.large.copyWith(
            color: const Color(0xff808080),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
