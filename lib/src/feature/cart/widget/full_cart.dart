import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/constant/dummy_products.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';
import 'package:sizzle_starter/src/feature/product_details/model/product.dart';

class FullCart extends StatefulWidget {
  const FullCart({super.key});

  @override
  State<FullCart> createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
  final scrollController = ScrollController();
  List<Product> cartProducts = products.take(4).toList();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: ShadButton(
              height: 54,
              onPressed: () => context.pushRoute(const CheckoutRoute()),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Go To Checkout'),
                  Gap(10),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      EcommerceIcons.arrow,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
          controller: scrollController,
          itemCount: cartProducts.length + 1,
          itemBuilder: (context, index) {
            if (index == cartProducts.length) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub-total',
                          style: context.b1Regular
                              .copyWithColor(EColors.primary500),
                        ),
                        Text('\$ 5,000', style: context.b1Medium),
                      ],
                    ),
                    const Gap(16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vat (%)',
                          style: context.b1Regular
                              .copyWithColor(EColors.primary500),
                        ),
                        Text('\$ 0.00', style: context.b1Medium),
                      ],
                    ),
                    const Gap(16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping fee',
                          style: context.b1Regular
                              .copyWithColor(EColors.primary500),
                        ),
                        Text('\$ 80.00', style: context.b1Medium),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: context.b1Regular,
                        ),
                        Text('\$ 5,080', style: context.b1Medium),
                      ],
                    ),
                  ],
                ),
              );
            }
            return CartItem(product: cartProducts[index]);
          },
        ),
      );
}

class CartItem extends StatelessWidget {
  const CartItem({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) => Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: EColors.primary100),
        ),
        // padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product.imageUrl,
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Gap(16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: context.b2SemiBold,
                          ),
                          Text(
                            'Size ${product.variants.first}',
                            style: context.b3Regular
                                .copyWithColor(EColors.primary500),
                          ),
                        ],
                      ),
                      Text(
                        '\$${product.price}',
                        style: context.b2SemiBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  EcommerceIcons.trash,
                  color: Colors.red,
                ),
                padding: const EdgeInsets.all(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: EColors.primary100),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          EcommerceIcons.minus,
                          size: 20,
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(EcommerceIcons.minus),
                    //   padding: const EdgeInsets.all(16),
                    // ),
                    const Gap(10),
                    const Flexible(child: Text('1')),
                    const Gap(10),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: EColors.primary100),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          EcommerceIcons.plus,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
