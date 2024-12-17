import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final shadStatesController = ShadStatesController();

  bool isPasswordVisible = false;
  bool showEye = false;
  bool isButtonEnabled = false;

  @override
  void dispose() {
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
                    child: RichText(
                      text: const TextSpan(
                        text: 'Do not have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        children: [
                          TextSpan(
                            text: 'Join',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => context.router.push(const SignUpRoute()),
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
                      'Login to your account',
                      style: context.shadTheme.textTheme.h2,
                    ),
                    const Gap(8.0),
                    Text(
                      "It's great to see you again.",
                      style: context.shadTheme.textTheme.muted,
                    ),
                    const Gap(24.0),
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
                    ShadButton.ghost(
                      padding: EdgeInsets.zero,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Forgot your password? ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: [
                            TextSpan(
                              text: 'Reset your password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () =>
                          context.router.push(const ForgotPasswordRoute()),
                    ),
                    const Gap(12.0),
                    ShadButton(
                      width: double.infinity,
                      statesController: shadStatesController,
                      height: 54,
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                    const Gap(24.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Divider(
                            height: 0,
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
                      child: Row(
                        children: [
                          ShadImage(
                            Assets.images.logosGoogleIcon,
                            width: 24,
                          ),
                          // Icon(EcommerceIcons.logos_google_icon),
                          const Gap(10.0),
                          const Text('Login with Google'),
                        ],
                      ),
                    ),
                    const Gap(12.0),
                    ShadTheme(
                      data: context.shadTheme.copyWith(
                        primaryButtonTheme:
                            context.shadTheme.primaryButtonTheme.copyWith(
                          backgroundColor: const Color(0xff1877F2),
                          pressedBackgroundColor:
                              const Color(0xff1877F2).withOpacity(0.8),
                        ),
                      ),
                      child: ShadButton(
                        width: double.infinity,
                        height: 54,
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              EcommerceIcons.facebook,
                              color: Colors.white,
                            ),
                            Gap(10.0),
                            Text('Login with Facebook'),
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
