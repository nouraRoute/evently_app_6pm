import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/l10n/app_localizations.dart';
import 'package:evently_app_6pm/models/category_model.dart';
import 'package:evently_app_6pm/models/user_model.dart';
import 'package:evently_app_6pm/providers/events_provider.dart';
import 'package:evently_app_6pm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Provider.of<UserProvider>(context).userModel;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      style: TextStyle(
                        color: AppColors.lightBgColors,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      user?.name ?? "",
                      style: TextStyle(
                        color: AppColors.lightBgColors,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.lightBgColors,
                          size: 20,
                        ),
                        Text(
                          'Cairo , Egypt',
                          style: TextStyle(
                            color: AppColors.lightBgColors,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 33,
                  width: 33,
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
                    icon: Icon(
                      Icons.brightness_5_sharp,
                      color: AppColors.lightBgColors,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 33,
                  height: 33,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      backgroundColor: AppColors.lightBgColors,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: Text(
                      'EN',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).bottomNavigationBarTheme.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //TODO:categories scroll
            FilterView(),
          ],
        ),
      ),
    );
  }
}

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedId = Provider.of<EventsProvider>(context).selectedCatId;

    List categories = CategoryModel.categories;
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          CategoryModel currantCat = categories[index];
          bool isSelected = selectedId == currantCat.id;
          return Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.transparent),
            child: FilterChip(
              selectedColor: Theme.of(context).focusColor,
              labelStyle: TextStyle(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(46),
              ),
              side: isSelected
                  ? null
                  : BorderSide(color: Theme.of(context).focusColor),
              backgroundColor: Theme.of(
                context,
              ).bottomNavigationBarTheme.backgroundColor,
              showCheckmark: false,

              label: Row(
                spacing: 5,
                children: [
                  Icon(
                    currantCat.icon,
                    color: isSelected
                        ? Theme.of(context).cardColor
                        : AppColors.lightBgColors,
                  ),
                  Text(
                    currantCat.title,
                    style: TextStyle(
                      color: isSelected
                          ? Theme.of(context).cardColor
                          : AppColors.lightBgColors,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              onSelected: (value) {
                Provider.of<EventsProvider>(
                  context,
                  listen: false,
                ).editSelectedCat(currantCat.id);
              },
              selected: isSelected,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }
}
