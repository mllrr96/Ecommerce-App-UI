import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final paymentMethods = {
    'Credit Card': EcommerceIcons.card,
    'Cash': EcommerceIcons.cash,
    'Apple': EcommerceIcons.logos_apple_pay,
  };

  String selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: ShadButton(
                height: 54,
                onPressed: () {},
                child: const Text('Place Order'),
              ),
            ),
          ),
          appBar: const EAppBar(title: 'Checkout'),
          body: Column(
            children: [
              const Divider(
                indent: 24,
                endIndent: 24,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Address',
                          style: context.b1SemiBold,
                        ),
                        ShadButton.ghost(
                          onPressed: () {},
                          child: const Text('Change'),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          EcommerceIcons.location,
                          color: EColors.primary400,
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Home',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '925 S Chugach St #APT 10, Alaska 99645',
                              style: context.b2Regular
                                  .copyWithColor(EColors.primary500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 40),
                    Text(
                      'Payment Method',
                      style: context.b1SemiBold,
                    ),
                    const Gap(16),
                    const _PaymentMethodsChips(),
                    const Gap(16),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () =>
                          context.pushRoute(const PaymentMethodRoute()),
                      child: Ink(
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(color: EColors.primary100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(EcommerceIcons.bxl_visa),
                                const Gap(70),
                                Text(
                                  '**** **** **** 2512',
                                  style: context.b2Medium,
                                ),
                              ],
                            ),
                            const Icon(EcommerceIcons.edit),
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 40),
                    Text('Order Summary', style: context.b1SemiBold),
                    const Gap(16),
                    const _OrderSummaryItem(
                      title: 'Sub-total',
                      value: '\$ 120.00',
                    ),
                    const Gap(16),
                    const _OrderSummaryItem(
                      title: 'VAT',
                      value: '\$ 0.00',
                    ),
                    const Gap(16),
                    const _OrderSummaryItem(
                      title: 'Shipping Fee',
                      value: '\$ 5.00',
                    ),
                    const Divider(height: 32),
                    _OrderSummaryItem(
                      title: 'Total',
                      titleTextStyle: context.b1Regular,
                      value: '\$ 125.00',
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        const Expanded(
                          child: ShadInput(
                            prefix: Icon(
                              EcommerceIcons.discount,
                              color: EColors.primary300,
                            ),
                            placeholder: Text('Enter promo code'),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),
                        const Gap(8),
                        ShadButton(
                          height: 52,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Text(
                            'Add',
                            style: context.b1Medium.copyWithColor(Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _OrderSummaryItem extends StatelessWidget {
  const _OrderSummaryItem({
    required this.title,
    required this.value,
    this.titleTextStyle,
  });

  final String title;
  final String value;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleTextStyle ??
                context.b1Regular.copyWithColor(EColors.primary500),
          ),
          Text(
            value,
            style: context.b1Medium,
          ),
        ],
      );
}

class _PaymentMethodsChips extends StatefulWidget {
  const _PaymentMethodsChips();

  @override
  State<_PaymentMethodsChips> createState() => _PaymentMethodsChipsState();
}

class _PaymentMethodsChipsState extends State<_PaymentMethodsChips> {
  String selectedPaymentMethod = 'Card';

  @override
  Widget build(BuildContext context) {
    const paymentMethods = {
      'Card': EcommerceIcons.card,
      'space': Icons.access_alarm,
      'Cash': EcommerceIcons.cash,
      'space1': Icons.access_alarm,
      'Pay': Icons.apple,
    };
    return Row(
      children: paymentMethods.entries.map(
        (entry) {
          if (entry.key.startsWith('space')) {
            return const Gap(8);
          }
          final isSelected = selectedPaymentMethod == entry.key;
          return Expanded(
            child: ActionChip(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              side: BorderSide(
                color: isSelected ? Colors.black : EColors.primary100,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: isSelected ? Colors.black : null,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    entry.value,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  const Gap(4),
                  Text(
                    entry.key,
                    style: context.b2Medium.copyWithColor(
                      isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16.0,
              ),
              onPressed: () => setState(
                () => selectedPaymentMethod = entry.key,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
