import 'package:flutter/material.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/core/utils/app_flutter_secure_storage.dart';
import 'package:shopping_app/features/app_section/screens/app_section.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AppFlutterSecureStorage.getData("Token");
  String initialRoute = token == null
      ? AppRoutes.register
      : AppRoutes.appSection;
  runApp(ShoppingApp(route: initialRoute));
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key, required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: .light,
      initialRoute: route,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
        AppRoutes.appSection: (context) => AppSection(),
      },
    );
  }
}
