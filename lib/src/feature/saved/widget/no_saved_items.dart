import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';

class NoSavedItems extends StatelessWidget {
  const NoSavedItems({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadImage(Assets.images.heartDuotone.path),
            const Gap(16.0),
            Text(
              'No Saved Items!',
              style: context.shadTheme.textTheme.h4,
            ),
            const Gap(12.0),
            const Text(
              'You don’t have any saved items.\nGo to home and add some.',
              style: TextStyle(
                color: Color(0xff808080),
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
  );
}
