import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';

class NoSavedItems extends StatelessWidget {
  const NoSavedItems({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.heartDuotone.path),
            const Gap(16.0),
            Text(
              'No Saved Items!',
              style: context.h4,
            ),
            const Gap(12.0),
            Text(
              'You don’t have any saved items.\nGo to home and add some.',
              style: context.b1Regular.copyWithColor(EColors.primary500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
