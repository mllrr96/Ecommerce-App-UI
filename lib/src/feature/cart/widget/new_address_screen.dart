import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';

@RoutePage()
class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          appBar: const EAppBar(title: 'New Address'),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    Assets.images.map.path,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: context.height * 0.4,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    width: context.width,
                    decoration: const BoxDecoration(
                      color: EColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Text(
                            'Address',
                            style: context.h4,
                          ),
                          const Divider(),
                          ShadInputFormField(
                            label: const Text('Address Nickname'),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            trailing: const SizedBox(
                              height: 52,
                            ),
                          ),
                          const Gap(16),
                          ShadInputFormField(
                            label: const Text('Full Address'),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            trailing: const SizedBox(
                              height: 52,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ShadCheckbox(
                              value: false,
                              label: Text(
                                'Make this as a default address',
                                style: context.b1Regular
                                    .copyWithColor(EColors.primary500),
                              ),
                            ),
                          ),
                          ShadButton(
                            height: 54,
                            width: double.infinity,
                            onPressed: () {},
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
