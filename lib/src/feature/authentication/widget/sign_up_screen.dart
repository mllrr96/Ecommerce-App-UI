import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final shadStatesController = ShadStatesController();

  bool isPasswordVisible = false;
  bool showEye = false;
  bool isButtonEnabled = false;

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          onTap: context.unfocus,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
              width: context.width,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShadButton.ghost(
                    onPressed: context.maybePop,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        children: [
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(context.hasBottomPadding ? context.bottomPadding : 24),
                ],
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(
                      context.mediaQuery.viewPadding.top,
                    ),
                    Text(
                      'Create an account',
                      style: context.h2,
                    ),
                    const Gap(8.0),
                    Text(
                      "Let's create your account.",
                      style:
                          context.b1Regular.copyWithColor(EColors.primary500),
                    ),
                    const Gap(24.0),
                    ShadInputFormField(
                      controller: nameCtrl,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      label: const Text('Full Name'),
                      placeholder: const Text('Enter your full name'),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      suffix: const SizedBox(height: 52),
                    ),
                    const Gap(16.0),
                    ShadInputFormField(
                      controller: emailCtrl,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      keyboardType: TextInputType.emailAddress,
                      label: const Text('Email'),
                      placeholder: const Text('Enter your email'),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      suffix: const SizedBox(height: 52),
                    ),
                    const Gap(16.0),
                    Focus(
                      onFocusChange: (hasFocus) =>
                          setState(() => showEye = hasFocus),
                      child: ShadInputFormField(
                        controller: passwordCtrl,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        label: const Text('Password'),
                        obscureText: !isPasswordVisible,
                        placeholder: const Text('Enter your password'),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        suffix: SizedBox(
                          height: 52,
                          width: 52,
                          child: showEye
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                    shadStatesController.value =
                                        isPasswordVisible
                                            ? {ShadState.disabled}
                                            : {ShadState.focused};
                                  },
                                  icon: Icon(
                                    isPasswordVisible
                                        ? EcommerceIcons.eye_off
                                        : EcommerceIcons.eye,
                                    color: Colors.grey,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    const Gap(12.0),
                    RichText(
                      text: TextSpan(
                        text: 'By signing up you agree to our ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        children: [
                          TextSpan(
                            text: 'Terms',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: ', '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: ', and '),
                          TextSpan(
                            text: 'Cookie Use',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                    const Gap(24.0),
                    ShadButton(
                      width: double.infinity,
                      statesController: shadStatesController,
                      height: 54,
                      onPressed: () {},
                      child: const Text('Create an Account'),
                    ),
                    const Gap(24.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Divider(
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('Or'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Gap(24.0),
                    ShadButton.outline(
                      width: double.infinity,
                      height: 54,
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(EcommerceIcons.logos_google_icon),
                          Gap(10.0),
                          Text('Sign Up with Google'),
                        ],
                      ),
                    ),
                    const Gap(12.0),
                    ShadTheme(
                      data: context.shadTheme.copyWith(
                        primaryButtonTheme:
                            context.shadTheme.primaryButtonTheme.copyWith(
                          backgroundColor: EColors.facebookBlue,
                          pressedBackgroundColor:
                              EColors.facebookBlue.withValues(alpha: 0.8),
                        ),
                      ),
                      child: ShadButton(
                        width: double.infinity,
                        height: 54,
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(EcommerceIcons.facebook, color: Colors.white),
                            Gap(10.0),
                            Text('Sign Up with Facebook'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
