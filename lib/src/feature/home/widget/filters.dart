import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonDecoration =
    context.shadTheme.outlineButtonTheme.decoration?.copyWith(
      border: context.shadTheme.outlineButtonTheme.decoration?.border?.copyWith(
        radius: BorderRadius.circular(12),
      ),
    );
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 64,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filters', style: context.shadTheme.textTheme.h4),
                const CloseButton(),
              ],
            ),
            const Divider(),
            const Text('Sort by'),
            const Gap(10.0),
            SizedBox(
              height: 52,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  ShadButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('Relevance'),
                  ),
                  ShadButton.outline(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('Price: Low - High'),
                  ),
                  ShadButton.outline(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('Price: High - Low'),
                  ),
                ],
              ),
            ),
            const Divider(height: 30),
            const Text('Price'),
            const Gap(10.0),
            const ShadSlider(
              min: 0.0,
              max: 100.0,
              initialValue: 20.0,
            ),
            const Divider(height: 30),
            const Text('Size'),
            const Spacer(),
            ShadButton(
              width: double.infinity,
              height: 54,
              onPressed: () {},
              child: const Text('Apply Filters'),
            ),
            const Gap(10.0),
          ],
        ),
      );
  }
}
