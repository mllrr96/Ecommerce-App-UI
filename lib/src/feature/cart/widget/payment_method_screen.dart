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
import 'package:sizzle_starter/src/feature/cart/model/credit_card.dart';

@RoutePage()
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<CreditCard> cards = [
    CreditCard(
      cardNumber: '4234 4567 7981 2569',
      expiryDate: '',
      cvv: '344',
    ),
    CreditCard(
      cardNumber: '2234 4567 7981 2569',
      expiryDate: '',
      cvv: '344',
    ),
    CreditCard(
      cardNumber: '4254 4567 7981 2569',
      expiryDate: '',
      cvv: '344',
    ),
  ];

  String selectedCard = '4234 4567 7981 2569';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const EAppBar(title: 'Payment Method'),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ShadButton(
              height: 52,
              onPressed: context.maybePop,
              child: Text(
                'Apply',
                style: context.b1Medium.copyWithColor(Colors.white),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12,
          ),
          child: Column(
            children: [
              Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: Text(
                        'Saved Cards',
                        style: context.b1SemiBold,
                      ),
                    ),
                  ],
                ),
              ),
              ...cards.map(
                (card) => Column(
                  children: [
                    _CardTile(
                      groupValue: selectedCard,
                      onChanged: (_) {
                        setState(() {
                          selectedCard = card.cardNumber;
                        });
                      },
                      card: card,
                    ),
                    const Gap(10.0),
                  ],
                ),
              ),
              ShadButton.outline(
                height: 52,
                width: double.infinity,
                onPressed: () => context.pushRoute(const NewCardRoute()),
                child: Row(
                  children: [
                    const Icon(EcommerceIcons.plus),
                    const Gap(10),
                    Text(
                      'New Card',
                      style: context.b1Medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _CardTile extends StatelessWidget {
  const _CardTile({
    required this.card,
    required this.groupValue,
    required this.onChanged,
  });

  final CreditCard card;
  final String groupValue;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onChanged(card.cardNumber),
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(color: EColors.primary100),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            // vertical: 14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      card.cardIcon,
                    ),
                    const Gap(60),
                    Flexible(child: Text(card.obscuredCardNumber)),
                  ],
                ),
              ),
              Radio<String>(
                value: card.cardNumber,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      );
}
