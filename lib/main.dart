import 'package:flutter/material.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/register_screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: .light,
      initialRoute: AppRoutes.register,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
    );
  }
}
