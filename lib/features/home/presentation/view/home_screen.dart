import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constants/constants_value.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/widgets/proudect_item_widget.dart';
import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';
import 'package:shopping_app/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 100),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is HCSuccess || current is HCError,
              builder: (context, state) {
                if (state is HCError) {
                  return Text(state.message);
                }
                if (state is HCSuccess) {
                  return SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: .horizontal,
                      itemBuilder: (context, index) => CategoryItemWidget(
                        category: state.categoriesList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 6),
                      itemCount: state.categoriesList.length,
                    ),
                  );
                }
                return Skeletonizer(
                  enabled: true,
                  child: SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: .horizontal,
                      itemBuilder: (context, index) =>
                          CategoryItemWidget(category: CategoryEntity()),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 6),
                      itemCount: 10,
                    ),
                  ),
                );
              },
            ),

            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is HPSuccess || current is HPError,
              builder: (context, state) {
                if (state is HPError) {
                  return Text(state.message);
                }
                if (state is HPSuccess) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 30,
                        childAspectRatio: 163 / 288,
                      ),
                      itemBuilder: (context, index) => ProductItemWidget(
                        imagePath: state.categoriesList[index].images.first,
                        title: state.categoriesList[index].title,
                        oldPrice: state.categoriesList[index].price,
                        price: state.categoriesList[index].discountPercentage,
                        rating: state.categoriesList[index].rating,
                        onTap: () {},
                        onFavoriteTap: () {},
                      ),
                      itemCount: 10,
                    ),
                  );
                }
                return Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 30,
                        childAspectRatio: 163 / 288,
                      ),
                      itemBuilder: (context, index) => ProductItemWidget(
                        imagePath: ConstantsValue.image,
                        title: "Title Product",
                        oldPrice: 10,
                        price: 20,
                        rating: 5,
                        onTap: () {},
                        onFavoriteTap: () {},
                      ),
                      itemCount: 10,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});
  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.charcoal, width: 1),
      ),
      child: Text(category.name, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
