import 'package:auto_route/auto_route.dart';
import 'package:sizzle_starter/src/core/route/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: SearchRoute.page),
            AutoRoute(page: SavedRoute.page),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: AccountRoute.page),
          ],
        ),
        // Auth Routes
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: VerificationCodeRoute.page),
        // Onboard Routes
        AutoRoute(page: OnboardRoute.page),
        // Account Routes
        AutoRoute(page: FaqRoute.page),
        AutoRoute(page: HelpCenterRoute.page),
        AutoRoute(page: MyDetailsRoute.page),
        AutoRoute(page: MyOrdersRoute.page),
        AutoRoute(page: NotificationsAccountRoute.page),
        // Notifications Route
        AutoRoute(page: NotificationsRoute.page),
        // Search Route
        //
      ];
}
