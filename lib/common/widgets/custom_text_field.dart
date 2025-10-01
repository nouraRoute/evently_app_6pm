import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.borderColor,
    this.hintColor,
    this.label,
    this.maxLines = 1,
  });
  final String? hintText, label;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final Color? borderColor, hintColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (label != null)
          Text(
            label!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        TextFormField(
          validator: validator,
          maxLines: maxLines,
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
              color: hintColor ?? Theme.of(context).hoverColor,
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: prefixIcon,
                  ),
            border: _getBorder(borderColor ?? Theme.of(context).hintColor),
            focusedBorder: _getBorder(
              borderColor ?? Theme.of(context).hintColor,
            ),
            errorBorder: _getBorder(AppColors.errorColors),
            enabledBorder: _getBorder(
              borderColor ?? Theme.of(context).hintColor,
            ),
          ),
        ),
      ],
    );
  }

  _getBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
