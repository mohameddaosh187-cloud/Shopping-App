import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constants/app_assets.dart';
import 'package:shopping_app/core/di/service_locator.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/features/account/presentation/view/account_screen.dart';
import 'package:shopping_app/features/account/presentation/view_model/account_cubit.dart';
import 'package:shopping_app/features/cart/presentation/view/cart_screen.dart';
import 'package:shopping_app/features/favorite/presentation/view/favorite_screen.dart';
import 'package:shopping_app/features/home/presentation/view/home_screen.dart';
import 'package:shopping_app/features/home/presentation/view_model/home/home_cubit.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getAllCategories()
        ..getAllProducts(),
      child: HomeScreen(),
    ),
    CartScreen(),
    FavoriteScreen(),
    BlocProvider(
      create: (context) => getIt<AccountCubit>()..getUserData(),
      child: AccountScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.homeIcons),
            activeIcon: Image.asset(
              AppAssets.homeIcons,
              color: AppColors.primaryOrange,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.cartIcons),
            activeIcon: Image.asset(
              AppAssets.cartIcons,
              color: AppColors.primaryOrange,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.favouriteIcons),
            activeIcon: Image.asset(
              AppAssets.favouriteIcons,
              color: AppColors.primaryOrange,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.profileIcons),
            activeIcon: Image.asset(
              AppAssets.profileIcons,
              color: AppColors.primaryOrange,
            ),
            label: "Account",
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: .w600),
        unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: .w600),
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.authFieldBorder,
      ),
    );
  }
}
