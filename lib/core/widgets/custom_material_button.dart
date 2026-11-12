import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppTheme.buttonHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryOrange, AppColors.orangeLight],
          ),
          borderRadius: AppTheme.borderRadiusMedium,
          boxShadow: const [
            BoxShadow(
              color: Color(0x59FF9900),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: AppTheme.borderRadiusMedium,
            ),
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(color: AppColors.offWhite),
                )
              : Text(text, style: AppTheme.authButtonText),
        ),
      ),
    );
  }
}
