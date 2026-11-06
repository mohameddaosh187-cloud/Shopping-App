import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/widgets/custom_text_form_field.dart';
import 'package:shopping_app/features/account/data/repo/account_data_source_imp.dart';
import 'package:shopping_app/features/account/data/repo/account_repo_imp.dart';
import 'package:shopping_app/features/account/domain/use_case/get_user_data_use_case.dart';
import 'package:shopping_app/features/account/presentation/view_model/account_cubit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late AccountCubit _cubit;
  @override
  void initState() {
    super.initState();
    final repo = AccountRepoImp(AccountDataSourceImp());
    _cubit = AccountCubit(GetUserDataUseCase(repo))..getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<AccountCubit, AccountState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is AccountError) {
              return Center(child: Text(state.error));
            }
            if (state is AccountSuccess) {
              return Column(
                spacing: 30,
                children: [
                  SizedBox(height: 100),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.charcoal),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          state.user.message.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, size: 50),
                        ),
                      ),
                      Positioned(
                        right: -4,
                        bottom: 4,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: AppColors.charcoal,
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    label: "Name",
                    hint: "Enter New Name",
                    controller: TextEditingController(
                      text: state.user.message.name,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Email",
                    hint: "Enter New Email",
                    controller: TextEditingController(
                      text: state.user.message.email,
                    ),
                  ),
                  CustomTextFormField(
                    label: "Phone",
                    hint: "Enter New Phone",
                    controller: TextEditingController(
                      text: state.user.message.phone,
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
