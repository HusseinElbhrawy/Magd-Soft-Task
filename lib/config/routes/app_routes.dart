import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_strings.dart';
import 'package:magd_soft_task/modules/auth/presentation/screens/login/login_screen.dart';
import 'package:magd_soft_task/modules/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registersRoute = '/registers';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String storeDetailsRoute = '/storeDetails';
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
      // case Routes.registersRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterScreen(),
      //   );
      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordScreen(),
      //   );
      // case Routes.storeDetailsRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const StoreDetailsScreen(),
      //   );
      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:
              // ignore: todo
              const Text(
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
