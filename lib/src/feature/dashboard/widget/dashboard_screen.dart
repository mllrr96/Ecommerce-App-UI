import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: AutoTabsScaffold(
          homeIndex: 0,
          // transitionBuilder: (_,child,__) => child,
          bottomNavigationBuilder: (_, tabsRouter) => Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 0),
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: tabsRouter.activeIndex,
                  selectedItemColor:
                      ShadTheme.of(context).primaryButtonTheme.backgroundColor,
                  onTap: tabsRouter.setActiveIndex,
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(EcommerceIcons.home),
                    ),
                    BottomNavigationBarItem(
                      label: 'Search',
                      icon: Icon(EcommerceIcons.search),
                    ),
                    BottomNavigationBarItem(
                      label: 'Saved',
                      icon: Icon(EcommerceIcons.heart),
                    ),
                    BottomNavigationBarItem(
                      label: 'Cart',
                      icon: Icon(EcommerceIcons.cart),
                    ),
                    BottomNavigationBarItem(
                      label: 'Account',
                      icon: Icon(EcommerceIcons.user),
                    ),
                  ],
                ),
              ],
            ),
          ),
          routes: const [
            HomeRoute(),
            SearchRoute(),
            SavedRoute(),
            CartRoute(),
            AccountRoute(),
          ],
        ),
      );
}
