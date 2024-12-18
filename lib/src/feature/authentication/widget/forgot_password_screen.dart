import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: kToolbarHeight,
                  width: context.width,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: context.maybePop,
                        child: Ink(
                          width: kToolbarHeight,
                          height: kToolbarHeight,
                          child: const Icon(EcommerceIcons.arrow),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot password',
                        style: context.h2,
                      ),
                      const Gap(8.0),
                      Text(
                        'Enter your email address for the verification process.\nWe will send 4 digit code to your email.',
                        style: context.b1Regular.copyWithColor(EColors.primary500),
                      ),
                      ShadInputFormField(
                        controller: emailCtrl,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        label: const Text('Email'),
                        placeholder: const Text('Enter your email'),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        suffix: const SizedBox(height: 52),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ShadButton(
                    height: 54,
                    width: context.width,
                    onPressed: () =>
                        context.pushRoute(const VerificationCodeRoute()),
                    child: const Text('Send Code'),
                  ),
                ),
                const Gap(8.0),
              ],
            ),
          ),
        ),
      );
}
