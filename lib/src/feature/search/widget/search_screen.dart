import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchHistory = <String>[
    'Jeans',
    'Casual Clothes',
    'Hoodie',
    'Nike shoes black',
    'V-neck t-shirt',
    'Winter clothes',
  ];

  @override
  Widget build(BuildContext context) {
    final isInDashboard = context.router.current.name == DashboardRoute.name;
    return GestureDetector(
      onTap: context.unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isInDashboard)
                    IconButton(
                      padding: const EdgeInsets.all(24.0),
                      onPressed: context.maybePop,
                      icon: const Icon(EcommerceIcons.arrow),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isInDashboard) const Gap(24.0),
                      Text(
                        'Search',
                        style: context.shadTheme.textTheme.h2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(14),
                        onPressed: () =>
                            context.pushRoute(const NotificationsRoute()),
                        icon: const Icon(EcommerceIcons.bell),
                      ),
                      const Gap(24.0),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    ShadInputFormField(
                      autofocus: !isInDashboard,
                      textInputAction: TextInputAction.search,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      placeholder: const Text('Search for clothes...'),
                      cursorHeight: 30,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Icon(
                          EcommerceIcons.search,
                          color: Color(0xffB3B3B3),
                        ),
                      ),
                      suffix: const Icon(
                        EcommerceIcons.mic,
                        color: Color(0xffB3B3B3),
                      ),
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Searches',
                          style: context.shadTheme.textTheme.h4,
                        ),
                        ShadButton.ghost(
                          onPressed: () => setState(searchHistory.clear),
                          child: Text(
                            'Clear all',
                            style: context.shadTheme.textTheme.list.copyWith(
                              color: const Color(0xff808080),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemBuilder: (context, index) {
                    final item = searchHistory[index];
                    return ListTile(
                      key: ValueKey(item),
                      title: Text(item),
                      contentPadding: const EdgeInsets.only(left: 16.0),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(16),
                        onPressed: () {
                          setState(() {
                            searchHistory.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          EcommerceIcons.cancel_circle,
                          color: Color(0xff999999),
                        ),
                      ),
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: searchHistory.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
