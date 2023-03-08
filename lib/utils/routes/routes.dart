import 'package:barber_parlor_app_fyp/view/main/choose_service_screen.dart';
import 'package:barber_parlor_app_fyp/view/parlor/select_parlor_person_type.dart';
import 'package:flutter/material.dart';

// import '../../view/dashboard/dashboard_screen.dart';
// import '../../view/forgot_password/forgot_password_screen.dart';
// import '../../view/login/login_screen.dart';
// import '../../view/signup/sign_up_screen.dart';
// import '../../view/splash/splash_screen.dart';
import 'route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      // case RouteName.splashScreen:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());

      // case RouteName.loginScreen:
      //   return MaterialPageRoute(builder: (_) => const LoginScreen());

      // case RouteName.signupScreen:
      //   return MaterialPageRoute(builder: (_) => const SignupScreen());

      case RouteName.chooseServiceScreen:
        return MaterialPageRoute(builder: (_) => const ChooseServiceScreen());

      // case RouteName.dashboardScreen:
      //   return MaterialPageRoute(builder: (_) => const DashboardScreen());

      // case RouteName.forgotPasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      //parlor
      case RouteName.selectParlorPersonTypeScreen:
        return MaterialPageRoute(builder: (_) => const SelectParlorPersonTypeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
