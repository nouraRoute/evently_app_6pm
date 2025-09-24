import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.prefixIcon,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).hoverColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).hoverColor,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(padding: const EdgeInsets.all(16.0), child: prefixIcon),
        border: _getBorder(Theme.of(context).hintColor),
        focusedBorder: _getBorder(Theme.of(context).hintColor),
        errorBorder: _getBorder(AppColors.errorColors),
        enabledBorder: _getBorder(Theme.of(context).hintColor),
      ),
    );
  }

  _getBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
