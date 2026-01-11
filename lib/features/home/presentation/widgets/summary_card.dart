import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart'; // تأكد من المسار

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? iconColor;

  // de elel 7t55zen el function ele 77tnafe 3edna el click
  final VoidCallback? onTap;

  const SummaryCard({
    this.onTap,
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface, // لون الكروت (رمادي غامق)
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border, width: 0.5), // حدود خفيفة
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: iconColor ?? AppColors.primary, size: 28),
                // ممكن نضيف نسبة مئوية هنا مستقبلاً
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary, // أبيض
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary, // رمادي
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
