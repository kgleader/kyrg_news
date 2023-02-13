import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.buttonColor,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.iconColor,
          ),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyle.cardTextStyles),
        ],
      ),
    );
  }
}
