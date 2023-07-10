import 'package:codeit/screens/addAccounts/add_accounts_screen.dart';
import 'package:codeit/screens/login/login_screen.dart';
import 'package:codeit/screens/main/mainScreen.dart';
import 'package:codeit/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const login = '/';
  static const signup = '/signup';
  static const addAccount = '/add_account';
  static const main = '/main';
}

class AppRoutes {
  static List<GetPage> get getPages => [
        GetPage(name: Routes.login, page: () => const LoginScreen()),
        GetPage(name: Routes.signup, page: () => const SignUpScreen()),
        GetPage(name: Routes.addAccount, page: () => const AddAccountsScreen()),
        GetPage(name: Routes.main, page: () => const MainScreen())
      ];
}
