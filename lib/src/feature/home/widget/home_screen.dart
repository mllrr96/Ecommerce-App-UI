import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';
import 'package:sizzle_starter/src/feature/home/widget/filters.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final buttonDecoration =
        context.shadTheme.outlineButtonTheme.decoration?.copyWith(
      border: context.shadTheme.outlineButtonTheme.decoration?.border?.copyWith(
        radius: BorderRadius.circular(12),
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discover', style: context.shadTheme.textTheme.h2),
                      IconButton(
                        padding: const EdgeInsets.all(14),
                        onPressed: () =>
                            context.pushRoute(const NotificationsRoute()),
                        icon: const Icon(EcommerceIcons.bell),
                      ),
                    ],
                  ),
                  const Gap(16.0),
                  Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => context.pushRoute(const SearchRoute()),
                          child: Ink(
                            height: 52,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xffB3B3B3),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      EcommerceIcons.search,
                                      color: Color(0xffB3B3B3),
                                    ),
                                    Gap(12.0),
                                    Text(
                                      'Search for clothes...',
                                      style:
                                          TextStyle(color: Color(0xff999999)),
                                    ),
                                  ],
                                ),
                                Icon(
                                  EcommerceIcons.mic,
                                  color: Color(0xffB3B3B3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(8.0),
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          showModalBottomSheet<String>(
                            context: context,
                            builder: (context) => const Filters(),
                          );
                        },
                        child: Ink(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            EcommerceIcons.filter,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16.0),
                ],
              ),
            ),
            SizedBox(
              height: 52,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  ShadButton.outline(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('All'),
                  ),
                  ShadButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('T shirt'),
                  ),
                  ShadButton.outline(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('Jeans'),
                  ),
                  ShadButton.outline(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('Shoes'),
                  ),
                  ShadButton.outline(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: buttonDecoration,
                    child: const Text('Hoodies'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
