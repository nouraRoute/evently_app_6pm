import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  String title;
  IconData icon;
  String? designPath;
  CategoryModel({
    required this.id,
    required this.title,
    this.designPath,
    required this.icon,
  });
  static List<CategoryModel> get categories => [
    CategoryModel(id: 1, title: 'All', icon: Icons.explore),
    CategoryModel(
      id: 2,
      title: 'Sport',
      designPath: Assets.image.sportCard.path,
      icon: Icons.pedal_bike,
    ),
    CategoryModel(
      id: 3,
      title: 'BirthDay',
      designPath: Assets.image.birthdayCard.path,
      icon: Icons.cake,
    ),
    CategoryModel(
      id: 4,
      title: 'Meeting',
      designPath: Assets.image.meetingCard.path,
      icon: Icons.meeting_room,
    ),
    CategoryModel(
      id: 5,
      title: 'Workshop',
      designPath: Assets.image.gamingCard.path,
      icon: Icons.handyman,
    ),
    CategoryModel(
      id: 6,
      title: 'Eating',
      designPath: Assets.image.eating.path,
      icon: Icons.dining,
    ),
  ];
}
