import 'package:flutter/material.dart';
import '../../core/usecases/params/params.dart';
import '../../core/utils/app_strings.dart';
import '../../modules/auth/presentation/screens/login/login_screen.dart';
import '../../modules/auth/presentation/screens/verify/verify_screen.dart';
import '../../modules/help/presentation/screen/help_screen.dart';
import '../../modules/home/domain/entities/product_entity.dart';
import '../../modules/home/presentation/screens/details/product_details_screen.dart';
import '../../modules/home/presentation/screens/home/home_screen.dart';
import '../../modules/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String verifyRoute = '/verifyRoute';
  static const String helpRoute = '/helpRoute';
  static const String homeRoute = '/homeRoute';
  static const String productDetailsRoute = '/productDetailsRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.verifyRoute:
        final args = routeSettings.arguments as OtpData;
        return MaterialPageRoute(
          builder: (_) => VerifyScreen(otpData: args),
        );
      case Routes.helpRoute:
        return MaterialPageRoute(
          builder: (_) => const HelpScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.productDetailsRoute:
        final args = routeSettings.arguments as ProductEntity;

        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(productEntity: args),
        );
      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
