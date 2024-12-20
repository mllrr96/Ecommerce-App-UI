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
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Map<String, String> addresses = {
    'Home': '925 S Chugach St #APT 10, Alas...',
    'Office': '2438 6th Ave, Ketchikan, Alaska 99901, USA',
    'Apartment': '2551 Vista Dr #B301, Juneau, Alaska 99801, USA',
    'Parents House': '4821 Ridge Top Cir, Anchorage, Alaska 99508, USA',
  };

  String selectedAddress = 'Home';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const EAppBar(title: 'Address'),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ShadButton(
              height: 54,
              onPressed: context.maybePop,
              child: const Text(
                'Apply',
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            ColoredBox(
              color: EColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(indent: 24, endIndent: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      'Saved Addresses',
                      style: context.b1SemiBold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  if (index == addresses.length) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: ShadButton.outline(
                        onPressed: () =>
                            context.pushRoute(const NewAddressRoute()),
                        decoration: ShadDecoration(
                          border: ShadBorder.all(
                            radius: BorderRadius.circular(12),
                            color: EColors.primary200,
                          ),
                        ),
                        height: 54,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              size: 32,
                            ),
                            const Gap(4),
                            Text(
                              'Add New Address',
                              style: context.b1Medium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final key = addresses.keys.elementAt(index);
                  final value = addresses[key];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: EColors.primary100,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: const Icon(
                      EcommerceIcons.location,
                      color: EColors.primary400,
                    ),
                    title: Text(key, style: context.b2SemiBold),
                    subtitle: Text(
                      value!,
                      style:
                          context.b2Regular.copyWithColor(EColors.primary500),
                    ),
                    onTap: () => setState(() => selectedAddress = key),
                    trailing: Radio<String>(
                      value: key,
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => selectedAddress = value);
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Gap(12),
                itemCount: addresses.length + 1,
              ),
            ),
          ],
        ),
      );
}
