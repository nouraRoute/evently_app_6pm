import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_drop_down_button.dart';
import 'package:evently_app_6pm/screens/home/settings_tab/widgets/settings_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsHeader(),
        CustomDropDownButton<String>(
          label: 'Language',
          items: [
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                'Arabic',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text(
                'English',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          onChanged: (value) {},
        ),
        CustomDropDownButton<String>(
          label: 'Theme',
          items: [
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                'Dark',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text(
                'Light',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
