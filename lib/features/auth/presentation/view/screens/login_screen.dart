import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/routes/app_routes.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/core/theme/app_theme.dart';
import 'package:shopping_app/core/utils/app_dialog.dart';
import 'package:shopping_app/core/widgets/custom_material_button.dart';
import 'package:shopping_app/core/widgets/custom_text_form_field.dart';
import 'package:shopping_app/features/auth/presentation/view_model/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "mohamed@gmail.com");
  final _passwordController = TextEditingController(text: "Mohamed@123");
  final _loginCubit = LoginCubit();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginCubit.close();
    super.dispose();
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

  void _submit() {
    FocusScope.of(context).unfocus();
    _formKey.currentState!.validate();
  }

  void _showPasswordResetInfo() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset password'),
        content: const Text(
          'Password reset will be available when an authentication service is connected.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        bloc: _loginCubit,
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialog.showLoading(context);
          }
          if (state is LoginError) {
            Navigator.of(context).pop();
            AppDialog.showError(
              context,
              _loginCubit.errorMassage ?? "Error From cubit",
            );
          }
          if (state is LoginSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(AppRoutes.appSection);
          }
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Positioned(
                  top: 26,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text('Login', style: AppTheme.authTitle),
                  ),
                ),
                Positioned(
                  top: 90,
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
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: _showPasswordResetInfo,
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.textSecondary,
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 0,
                                ),
                                minimumSize: const Size(0, 22),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomMaterialButton(
                            onPressed: () async {
                              await _loginCubit.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            },
                            text: 'Login',
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
                          'Don’t have an account?',
                          style: AppTheme.authFooter,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.register,
                          ),
                          child: Text('sign up', style: AppTheme.authLink),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
