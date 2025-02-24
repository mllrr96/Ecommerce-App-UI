import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<String> faqCategory = [
    'General',
    'Account',
    'Service',
    'Payment',
  ];

  String selectedFaqCategory = 'General';
  List<({String content, String title})> faqDetails = [
    (
      title: 'How do I make a purchase?',
      content:
          'When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the "Add to Cart" button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.',
    ),
    (
      title: 'What payment methods are accepted?',
      content:
          'We accept all major credit and debit cards, including Visa, MasterCard, American Express, and Discover. You can also pay using PayPal, Apple Pay, Google Pay, and other digital wallets. If you have a gift card or store credit, you can apply it to your purchase during checkout.',
    ),
    (
      title: 'How do I track my orders?',
      content:
          'Once your order has been shipped, you will receive a tracking number via email or SMS. You can use this tracking number to monitor the status of your delivery and get real-time updates on the estimated delivery date and time. If you have an account with us, you can also log in to your account and view your order history and tracking information.',
    ),
    (
      title: 'Can I cancel or return an order?',
      content:
          'You can cancel or return an order within 30 days of purchase, as long as the item is in its original condition and packaging. To cancel or return an order, contact our customer service team with your order number and reason for cancellation or return. We will provide you with instructions on how to proceed and process your refund or exchange as quickly as possible.',
    ),
    (
      title: 'How can I contact customer support for assistance?',
      content:
          'If you have any questions or need assistance with your order, you can contact our customer support team via email, phone, or live chat. Our customer service representatives are available 24/7 to help you with any issues or concerns you may have. You can find our contact information on our website or in your order confirmation email.',
    ),
    (
      title: 'How do I create an account?',
      content:
          'To create an account, tap the "Sign Up" or "Create Account" button on our website or app. You will be prompted to enter your name, email address, and password to create an account. Once your account is created, you can log in to access your order history, track your orders, and manage your account settings.',
    ),
  ];

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          appBar: const EAppBar(title: 'FAQs'),
          body: Column(
            children: [
              const Divider(indent: 24, endIndent: 24, thickness: 2),
              SizedBox(
                height: 52,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: faqCategory.length,
                  separatorBuilder: (_, __) => const Gap(10.0),
                  itemBuilder: (context, index) {
                    final category = faqCategory[index];
                    final isSelected = selectedFaqCategory == category;
                    return ActionChip(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      side: BorderSide(
                        color: isSelected ? Colors.black : EColors.primary100,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: isSelected ? Colors.black : null,
                      label: Text(category),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 16.0,
                      ),
                      onPressed: () =>
                          setState(() => selectedFaqCategory = category),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(16),
                        ShadInputFormField(
                          placeholder: const Text('Search'),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          leading: const SizedBox(
                            height: 52,
                            child: Icon(
                              EcommerceIcons.search,
                              color: EColors.primary300,
                            ),
                          ),
                          trailing: const SizedBox(
                            height: 52,
                            child: Icon(
                              EcommerceIcons.mic,
                              color: EColors.primary300,
                            ),
                          ),
                        ),
                        const Gap(16),
                        ShadAccordion<
                            ({String content, String title})>.multiple(
                          children: faqDetails.map(
                            (detail) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: EColors.primary100,
                                ),
                              ),
                              child: ShadAccordionItem(
                                separator: const SizedBox.shrink(),
                                value: detail,
                                title: Text(
                                  detail.title,
                                  style: context.b1Medium,
                                ),
                                child: Text(detail.content),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
