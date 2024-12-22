import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizzle_starter/src/core/constant/colors.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/utils/extensions/text_style_extension.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';
import 'package:sizzle_starter/src/feature/product_details/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, required this.isFavorite, required this.onFavoriteChanged, super.key});
  final Product product;
  final bool isFavorite;
  final void Function() onFavoriteChanged;

  @override
  Widget build(BuildContext context) => InkWell(
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
                        onTap: onFavoriteChanged,
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
}
