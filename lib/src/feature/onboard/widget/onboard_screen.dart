import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            width: context.width,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 0),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    24,
                    22,
                    24,
                    context.hasBottomPadding ? context.bottomPadding : 22,
                  ),
                  child: ShadButton(
                    width: double.infinity,
                    height: 54,
                    child: const Row(
                      children: [
                        Text('Get Started'),
                        SizedBox(width: 8),
                        RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            EcommerceIcons.arrow,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => context.router.replaceAll([
                      const LoginRoute(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              ShadImage(
                Assets.images.onboardingBackground,
                width: context.width,
              ),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).viewPadding.top),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Define yourself in in your unique way.',
                      style: ShadTheme.of(context)
                          .textTheme
                          .h1
                          .copyWith(fontSize: 62),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ShadImage(
                  Assets.images.onboardImage.path,
                ),
              ),
            ],
          ),
        ),
      );
}
