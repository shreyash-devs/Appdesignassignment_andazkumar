import 'package:flutter/material.dart';
import '../core/theme.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? highlight;
  final VoidCallback? onTap;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    this.highlight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryText, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 15,
                    ),
                  ),
                  if (highlight != null) ...[
                    const SizedBox(width: 6),
                    Text(
                      highlight!,
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondaryText,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
