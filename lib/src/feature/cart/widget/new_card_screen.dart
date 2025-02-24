import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class NewCardScreen extends StatelessWidget {
  const NewCardScreen({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          appBar: const EAppBar(title: 'New Card'),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Text(
                    'Add Debit or Credit Card',
                    style: context.b1SemiBold,
                  ),
                  const Gap(16.0),
                  ShadInputFormField(
                    leading: const SizedBox(height: 52),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    label: const Text('Card Number'),
                    placeholder: const Text('Enter your card number'),
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: ShadInputFormField(
                          leading: const SizedBox(height: 52),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          label: const Text('Expiry Date'),
                          placeholder: const Text('MM/YY'),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: ShadInputFormField(
                          leading: const SizedBox(height: 52),
                          trailing: const Icon(
                            EcommerceIcons.question,
                            color: EColors.primary400,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          label: const Text('Security Code'),
                          placeholder: const Text('CVC'),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ShadButton(
                    height: 54,
                    width: double.infinity,
                    onPressed: context.maybePop,
                    child: const Text('Add Card'),
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ),
        ),
      );
}
