import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
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
                        'Enter 4 Digit Code',
                        style: context.shadTheme.textTheme.h2,
                      ),
                      const Gap(8.0),
                      Text(
                        'Enter 4 digit code that you received on your email (*******@gmail.com)',
                        style: context.shadTheme.textTheme.muted,
                      ),
                      const Gap(24.0),
                      Row(
                        children: [
                          Flexible(
                            child: ShadInputFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              padding: const EdgeInsets.all(20),
                              // suffix: const SizedBox(height: 52,),
                            ),
                          ),
                          Flexible(
                            child: ShadInputFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              padding: const EdgeInsets.all(20),
                              // suffix: const SizedBox(height: 52),
                            ),
                          ),Flexible(
                            child: ShadInputFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              padding: const EdgeInsets.all(20),
                              // suffix: const SizedBox(height: 52),
                            ),
                          ),Flexible(
                            child: ShadInputFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              padding: const EdgeInsets.all(20),
                              // suffix: const SizedBox(height: 52),
                            ),
                          ),
                        ],
                      ),
                      ShadButton.ghost(
                        padding: EdgeInsets.zero,
                        child: RichText(
                          text: const TextSpan(
                            text: 'Email not received? ',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: [
                              TextSpan(
                                text: 'Resend code',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
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
                    onPressed: () => context.pushRoute(const ResetPasswordRoute()),
                    child: const Text('Continue'),
                  ),
                ),
                const Gap(8.0),
              ],
            ),
          ),
        ),
      );
}
