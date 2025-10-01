import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/models/category_model.dart';
import 'package:flutter/material.dart';

class CategorySelectorView extends StatelessWidget {
  const CategorySelectorView({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });
  final CategoryModel selectedCategory;
  final void Function(CategoryModel) onChanged;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.categories.sublist(1);
    return Column(
      spacing: 16,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
            selectedCategory.designPath!,
            fit: BoxFit.cover,
            height: (200 / 817) * MediaQuery.heightOf(context),
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              CategoryModel currantCat = categories[index];
              bool isSelected = currantCat.id == selectedCategory.id;
              return FilterChip(
                selectedColor: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(46),
                ),
                side: isSelected
                    ? null
                    : BorderSide(color: AppColors.mainColor),
                backgroundColor: isSelected
                    ? AppColors.mainColor
                    : Theme.of(context).scaffoldBackgroundColor,
                showCheckmark: false,

                label: Row(
                  spacing: 5,
                  children: [
                    Icon(
                      currantCat.icon,
                      color: isSelected
                          ? Theme.of(context).scaffoldBackgroundColor
                          : AppColors.mainColor,
                    ),
                    Text(
                      currantCat.title,
                      style: TextStyle(
                        color: isSelected
                            ? Theme.of(context).scaffoldBackgroundColor
                            : AppColors.mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                onSelected: (value) {
                  if (value) {
                    onChanged(currantCat);
                  }
                },
                selected: isSelected,
              );
            },
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }
}
