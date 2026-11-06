import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/core/utils/app_dialog.dart';
import 'package:shopping_app/core/widgets/custom_material_button.dart';
import 'package:shopping_app/core/widgets/custom_text_form_field.dart';
import 'package:shopping_app/features/auth/data/models/register_request_model.dart';
import 'package:shopping_app/features/auth/data/repo/data_source/auth_data_source_imp.dart';
import 'package:shopping_app/features/auth/data/repo/repo/auth_repo_imp.dart';
import 'package:shopping_app/features/auth/presentation/view_model/register/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController(text: "Mohamed");
  final _phoneController = TextEditingController(text: "01039874521");
  final _emailController = TextEditingController(text: "mohamed@gmail.com");
  final _passwordController = TextEditingController(text: "Mohamed@123");
  final _confirmPasswordController = TextEditingController(text: "Mohamed@123");
  final _registerCubit = RegisterCubit(AuthRepoImp(AuthDataSourceImp()));
  @override
  void dispose() {
    _userNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _registerCubit.close();
    super.dispose();
  }

  String? _validateUserName(String? value) {
    final userName = value?.trim() ?? '';
    if (userName.isEmpty) return 'Enter your user name';
    if (userName.length < 2) return 'User name must be at least 2 characters';
    return null;
  }

  String? _validatePhone(String? value) {
    final phone = value?.trim() ?? '';
    if (phone.isEmpty) return 'Enter your phone number';
    final digits = phone.replaceAll(RegExp(r'[+\s()-]'), '');
    if (!RegExp(r'^\d{7,15}$').hasMatch(digits)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Enter your email';
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? _validateConfirmation(String? value) {
    if (value == null || value.isEmpty) return 'Confirm your password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        bloc: _registerCubit,
        listener: (context, state) {
          if (state is RegisterLoading) {
            AppDialog.showLoading(context);
          }
          if (state is RegisterSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AppRoutes.login);
          }
          if (state is RegisterError) {
            Navigator.of(context).pop();
            AppDialog.showError(
              context,
              _registerCubit.massageError ?? "Error From cubit",
            );
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 26,
                left: 0,
                right: 0,
                child: Center(
                  child: Text('Sign up', style: AppTheme.authTitle),
                ),
              ),
              Positioned(
                top: 26,
                left: 8,
                child: IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: const Icon(Icons.arrow_back, size: 28),
                  color: const Color(0xFF212121),
                  tooltip: 'Back',
                ),
              ),
              Positioned(
                top: 85,
                left: AppTheme.screenPadding,
                right: AppTheme.screenPadding,
                bottom: 86,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          label: 'User name',
                          hint: 'Enter your user name',
                          controller: _userNameController,
                          validator: _validateUserName,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          label: 'Phone',
                          hint: 'Enter your phone number',
                          controller: _phoneController,
                          validator: _validatePhone,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          label: 'Email',
                          hint: 'youusefmhmd30@gmail.coom',
                          controller: _emailController,
                          validator: _validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          label: 'Password',
                          hint: 'Enter your password',
                          controller: _passwordController,
                          validator: _validatePassword,
                          obscureText: true,
                          showVisibilityToggle: true,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          label: 'Confirm password',
                          hint: 'Confirm your password',
                          controller: _confirmPasswordController,
                          validator: _validateConfirmation,
                          obscureText: true,
                          showVisibilityToggle: true,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _submit(),
                        ),
                        const SizedBox(height: 32),
                        CustomMaterialButton(
                          onPressed: () async {
                            var request = RegisterRequestModel(
                              name: _userNameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                            );
                            await _registerCubit.register(request);
                          },
                          text: 'Sign up',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 32,
                child: Center(
                  child: Wrap(
                    spacing: 4,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppTheme.authFooter,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        ),
                        child: Text('Login', style: AppTheme.authLink),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
