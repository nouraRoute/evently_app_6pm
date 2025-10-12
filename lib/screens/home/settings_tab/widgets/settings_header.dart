import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:evently_app_6pm/models/user_model.dart';
import 'package:evently_app_6pm/providers/user_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Provider.of<UserProvider>(context).userModel;

    double width = MediaQuery.widthOf(context);
    double height = MediaQuery.heightOf(context);
    return Container(
      padding: EdgeInsets.all(16),
      width: width,
      height: .242 * height,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)),
      ),
      child: SafeArea(
        child: Row(
          spacing: 16,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topRight: Radius.circular(124 / 2),
                bottomLeft: Radius.circular(124 / 2),
                bottomRight: Radius.circular(124 / 2),
              ),
              child: Assets.image.logo.image(
                height: 124,
                width: 124,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user?.name ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.lightBgColors,
                  ),
                ),
                Text(
                  user?.email ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.lightBgColors,
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
