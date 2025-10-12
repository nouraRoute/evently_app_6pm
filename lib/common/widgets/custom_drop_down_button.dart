import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.label,
    this.value,
  });
  final String? label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

          DropdownButtonFormField<T>(
            padding: EdgeInsets.all(0),
            initialValue: value,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),

              suffixIcon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.mainColor,
              ),
              border: _getBorder(),
              focusedBorder: _getBorder(),
              enabledBorder: _getBorder(),
            ),
            items: items,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.mainColor),
    );
  }
}
