import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.showVisibilityToggle = false,
    required this.label,
    required this.hint,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final bool showVisibilityToggle;
  final String label;
  final String hint;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 38,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.label, style: AppTheme.authFieldLabel),
          ),
        ),
        SizedBox(
          height: AppTheme.inputHeight,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: _obscureText,
            style: AppTheme.authInputText,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTheme.authHint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              filled: false,
              border: AppTheme.authInputBorder,
              enabledBorder: AppTheme.authInputBorder,
              focusedBorder: AppTheme.authFocusedInputBorder,
              errorBorder: AppTheme.authErrorInputBorder,
              focusedErrorBorder: AppTheme.authErrorInputBorder,
              suffixIcon: widget.showVisibilityToggle
                  ? IconButton(
                      onPressed: () => setState(() {
                        _obscureText = !_obscureText;
                      }),
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.textPrimary,
                        size: 24,
                      ),
                      tooltip: _obscureText ? 'Show password' : 'Hide password',
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
