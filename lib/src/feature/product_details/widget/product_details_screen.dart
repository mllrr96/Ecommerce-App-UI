import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/generated/assets.gen.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';
import 'package:sizzle_starter/src/feature/product_details/model/product.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({required this.product, super.key});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedVariant;

  bool get isVariantSelected => selectedVariant != null;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                height: 0,
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: context.b1Regular
                              .copyWithColor(EColors.primary500),
                        ),
                        Text(
                          '\$${widget.product.price}',
                          style: context.h3,
                        ),
                      ],
                    ),
                    const Gap(15),
                    Expanded(
                      child: ShadButton(
                        height: 54,
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(EcommerceIcons.bag, color: Colors.white),
                            Gap(10),
                            Text('Add to Cart'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: const EAppBar(title: 'Details'),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    ShadImage(
                      Assets.images.products.product1.path,
                      width: double.infinity,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => setState(
                              () => isFavorite = !isFavorite,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              height: 48,
                              width: 48,
                              child: Center(
                                child: Icon(
                                  isFavorite
                                      ? EcommerceIcons.heart_filled
                                      : EcommerceIcons.heart,
                                  size: 25,
                                  color: isFavorite ? Colors.red : null,
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
              const Gap(12),
              Text(
                'Regular Fit Slogan',
                style: context.h3,
              ),
              const Gap(12),
              Row(
                children: [
                  const Icon(EcommerceIcons.star, color: Color(0xffFFA928)),
                  const Gap(6),
                  Text('4.5/5', style: context.b1Medium),
                ],
              ),
              const Gap(12),
              Text(
                'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
                style: context.b1Regular.copyWithColor(EColors.primary500),
              ),
              const Gap(12),
              Text('Choose Size', style: context.h4),
              const Gap(12),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = widget.product.variants[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => setState(() {
                        selectedVariant = item;
                      }),
                      child: Container(
                        height: 50,
                        constraints: const BoxConstraints(minWidth: 50),
                        decoration: BoxDecoration(
                          color: isVariantSelected && selectedVariant == item
                              ? EColors.primary900
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isVariantSelected && selectedVariant == item
                                ? EColors.primary900
                                : EColors.primary100,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            item,
                            style: context.h4.copyWithColor(
                              isVariantSelected && selectedVariant == item
                                  ? Colors.white
                                  : EColors.primary900,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Gap(10.0),
                  itemCount: widget.product.variants.length,
                ),
              ),
            ],
          ),
        ),
      );
}
