import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/di/service_locator.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/widgets/custom_material_button.dart';
import 'package:shopping_app/core/widgets/custom_text_form_field.dart';
import 'package:shopping_app/features/account/presentation/view_model/account_cubit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<AccountCubit, AccountState>(
            buildWhen: (previous, current) =>
                current is AccountSuccess || current is AccountError,
            builder: (context, state) {
              if (state is AccountError) {
                return Center(child: Text(state.error));
              }
              if (state is AccountSuccess) {
                final name = TextEditingController(
                  text: state.user.message.name,
                );
                final email = TextEditingController(
                  text: state.user.message.email,
                );
                final phone = TextEditingController(
                  text: state.user.message.phone,
                );
                final image = state.user.message.image;
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
                      controller: name,
                    ),
                    CustomTextFormField(
                      label: "Email",
                      hint: "Enter New Email",
                      controller: email,
                    ),
                    CustomTextFormField(
                      label: "Phone",
                      hint: "Enter New Phone",
                      controller: phone,
                    ),
                    BlocConsumer<AccountCubit, AccountState>(
                      buildWhen: (previous, current) =>
                          current is AccountUpdateLoading ||
                          current is AccountUpdateSuccess ||
                          current is AccountUpdateError,
                      listener: (context, state) {
                        if (state is AccountUpdateSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              duration: Duration(seconds: 1),
                              backgroundColor: AppColors.charcoal,
                            ),
                          );
                        }
                        if (state is AccountUpdateError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                              duration: Duration(seconds: 1),
                              backgroundColor: AppColors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomMaterialButton(
                          isLoading: state is AccountUpdateLoading,
                          onPressed: () async {
                            await context.read<AccountCubit>().updateData(
                              name: name.text,
                              image: image,
                              phone: phone.text,
                            );
                          },
                          text: "Submit",
                        );
                      },
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
