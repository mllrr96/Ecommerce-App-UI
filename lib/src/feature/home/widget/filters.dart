import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final List<String> _sortCategory = [
    'Relevance',
    'Price: Low - High',
    'Price: High - Low',
  ];

  String selectedCategory = 'Relevance';
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 64,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filters', style: context.shadTheme.textTheme.h4),
                const CloseButton(),
              ],
            ),
            const Divider(),
            const Text('Sort by'),
            const Gap(10.0),
            SizedBox(
              height: 52,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _sortCategory.length,
                separatorBuilder: (_,__)=> const Gap(10.0),
                itemBuilder: (context, index) {
                  final category = _sortCategory[index];
                  final isSelected = selectedCategory == category;
                  return ActionChip(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    side: BorderSide(
                      color:
                      isSelected ? Colors.black : const Color(0xffE6E6E6),
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
                } ,
              ),
            ),
            const Divider(height: 30),
            const Text('Price'),
            const Gap(10.0),
            const ShadSlider(
              min: 0.0,
              max: 100.0,
              initialValue: 20.0,
            ),
            const Divider(height: 30),
            const Text('Size'),
            const Spacer(),
            ShadButton(
              width: double.infinity,
              height: 54,
              onPressed: () {},
              child: const Text('Apply Filters'),
            ),
            const Gap(10.0),
          ],
        ),
      );
}
