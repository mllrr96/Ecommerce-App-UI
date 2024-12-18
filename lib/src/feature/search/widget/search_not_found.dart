import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ShadImage(Assets.images.searchDuotone.path),
          const Gap(20),
          Text('No Results Found!', style: context.h4),
          const Gap(10),
          Text(
            'Try a similar word or something\nmore general.',
            style: context.b1Regular.copyWithColor(EColors.primary500),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
