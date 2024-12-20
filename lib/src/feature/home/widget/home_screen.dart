import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/dummy_products.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';
import 'package:sizzle_starter/src/feature/home/widget/filters.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = [
    'All',
    'T shirt',
    'Jeans',
    'Shoes',
    'Hoodies',
  ];
  String selectedCategory = 'All';
  List<bool> favorites = List.generate(products.length, (index) => false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.shadTheme.outlineButtonTheme.decoration?.copyWith(
      border: context.shadTheme.outlineButtonTheme.decoration?.border?.copyWith(
        radius: BorderRadius.circular(12),
      ),
    );
    return Scaffold(
      appBar: const EAppBar(title: 'Discover'),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Gap(8.0),
                  Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => context.pushRoute(const SearchRoute()),
                          child: const AbsorbPointer(
                            child: ShadInput(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              placeholder: Text('Search for clothes...'),
                              readOnly: true,
                              prefix: Icon(
                                EcommerceIcons.search,
                                color: EColors.primary300,
                              ),
                              suffix: Icon(
                                EcommerceIcons.mic,
                                color: EColors.primary300,
                              ),
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
                          height: 56,
                          width: 56,
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
              height: 50,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const Gap(10.0),
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == selectedCategory;
                  return ActionChip(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    side: BorderSide(
                      color: isSelected ? Colors.black : EColors.primary100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: isSelected ? Colors.black : null,
                    label: Text(category),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 16.0,
                    ),
                    onPressed: () =>
                        setState(() => selectedCategory = category),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final isFavorite = favorites[index];
                  return InkWell(
                    onTap: () => context.pushRoute(
                      ProductDetailsRoute(product: product),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Align(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image.asset(
                                    product.imageUrl,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () => setState(
                                        () => favorites[index] = !isFavorite,
                                      ),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        height: 34,
                                        width: 34,
                                        child: Center(
                                          child: Icon(
                                            isFavorite
                                                ? EcommerceIcons.heart_filled
                                                : EcommerceIcons.heart,
                                            color:
                                                isFavorite ? Colors.red : null,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(8.0),
                              Text(
                                product.name,
                                style: context.b1SemiBold,
                              ),
                              const Gap(4.0),
                              Text(
                                '\$ ${product.price}',
                                style: context.b3Medium
                                    .copyWithColor(EColors.primary500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
