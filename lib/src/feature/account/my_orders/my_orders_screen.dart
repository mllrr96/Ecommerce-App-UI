import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';
import 'package:sizzle_starter/src/feature/account/my_orders/no_orders.dart';

@RoutePage()
class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedSegment = 0;
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const EAppBar(title: 'My Orders'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  padding: const EdgeInsets.all(8.0),
                  groupValue: _selectedSegment,
                  onValueChanged: (value) => setState(() {
                    if (value == null) return;
                    _selectedSegment = value;
                    pageController.jumpToPage(value);
                  }),
                  children: const {
                    0: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                      child: Text('Ongoing'),
                    ),
                    1: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                      child: Text('Completed'),
                    ),
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  NoOrders.ongoing(),
                  NoOrders.completed(),
                ],
              ),
            ),
          ],
        ),
      );
}
