import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordCtrl = TextEditingController();
  final passwordCtrl2 = TextEditingController();
  bool isPasswordVisible = false;
  bool isPasswordVisible2 = false;
  bool showEye = false;
  bool showEye2 = false;
  final shadStatesController = ShadStatesController();

  @override
  void dispose() {
    passwordCtrl.dispose();
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
                        'Reset Password',
                        style: context.shadTheme.textTheme.h2,
                      ),
                      const Gap(8.0),
                      Text(
                        'Set the new password for your account so you can login again and access all the features.',
                        style: context.shadTheme.textTheme.muted,
                      ),
                      const Gap(24.0),
                      Focus(
                        onFocusChange: (hasFocus) =>
                            setState(() => showEye = hasFocus),
                        child: ShadInputFormField(
                          controller: passwordCtrl,
                          textInputAction: TextInputAction.next,
                          onSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
                      const Gap(16.0),
                      Focus(
                        onFocusChange: (hasFocus) =>
                            setState(() => showEye2 = hasFocus),
                        child: ShadInputFormField(
                          controller: passwordCtrl2,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          label: const Text('Password'),
                          obscureText: !isPasswordVisible2,
                          placeholder: const Text('Enter your password'),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          suffix: SizedBox(
                            height: 52,
                            width: 52,
                            child: showEye2
                                ? IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible2 = !isPasswordVisible2;
                                });
                                shadStatesController.value =
                                isPasswordVisible2
                                    ? {ShadState.disabled}
                                    : {ShadState.focused};
                              },
                              icon: Icon(
                                isPasswordVisible2
                                    ? EcommerceIcons.eye_off
                                    : EcommerceIcons.eye,
                                color: Colors.grey,
                              ),
                            )
                                : null,
                          ),
                        ),
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
                    onPressed: () {
                    },
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
