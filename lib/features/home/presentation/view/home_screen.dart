import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/features/home/data/model/categories_list_model.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_imp.dart';
import 'package:shopping_app/features/home/presentation/view_model/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = HomeCubit(HomeRepoImp(HomeDataSourceImp()))..getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 100),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: cubit,
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
                return CircularProgressIndicator();
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
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.charcoal, width: 1),
      ),
      child: Text(
        category.name ?? "",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
