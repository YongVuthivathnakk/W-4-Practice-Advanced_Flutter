import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeColorProvider colorProvider;
  const SettingsScreen({super.key, required this.colorProvider});

  @override
  Widget build(BuildContext context) {
    void onTap(ThemeColor selectedColor) {
      colorProvider.implementChangeThemeColor(selectedColor);
    }

    return Container(
      color: colorProvider.currentColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: colorProvider.currentColor.color,
            ),
          ),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == colorProvider.currentColor,
                    onTap: onTap,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
