import 'package:evently_app_6pm/common/network/auth_service.dart';
import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/models/category_model.dart';
import 'package:evently_app_6pm/models/event_model.dart';
import 'package:evently_app_6pm/models/user_model.dart';
import 'package:evently_app_6pm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    bool isFav =
        (Provider.of<UserProvider>(context).userModel?.favEvent ?? [])
            .indexWhere((element) => element.id == eventModel.id) !=
        -1;
    String catImagePAth = CategoryModel.categories
        .firstWhere((element) => element.id == eventModel.catId)
        .designPath!;
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(catImagePAth),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Text(
              eventModel.date,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventModel.title,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () async {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          ),
                        ),
                      );

                      if (isFav) {
                        await AuthService.removeFavEvent(eventModel.id!);
                      } else {
                        await AuthService.addFavEvent(eventModel);
                      }
                      UserModel userModel = (await AuthService.getUserInfo())!;
                      Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).setUser(userModel);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border_outlined,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//841
//156+48
//0.185