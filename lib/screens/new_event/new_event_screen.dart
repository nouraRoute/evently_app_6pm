import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_main_button.dart';
import 'package:evently_app_6pm/common/widgets/custom_text_field.dart';
import 'package:evently_app_6pm/models/category_model.dart';
import 'package:evently_app_6pm/screens/new_event/views/category_selector_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});
  static const String routeName = '/newEventScreen';

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  CategoryModel selectedCategory = CategoryModel.categories[1];
  DateTime? selectedDate; //yyyy-MM-dd hh:mm:ss
  TimeOfDay? selectedTime; //hh:mm pm/am
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            CategorySelectorView(
              selectedCategory: selectedCategory,
              onChanged: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            CustomTextField(
              label: 'Title',
              hintText: 'Event Title',
              prefixIcon: Icon(Icons.edit_outlined),
            ),
            CustomTextField(
              label: 'Description',
              hintText: 'Event Description',
              maxLines: 5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Event Date',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: Text(
                        _getDateText(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.mainColor,
                              // decoration: TextDecoration.underline,
                              // decorationColor: AppColors.mainColor,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Event Time',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            selectedTime = time;
                          });
                        }
                      },
                      child: Text(
                        _getTimeText(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.mainColor,
                              // decoration: TextDecoration.underline,
                              // decorationColor: AppColors.mainColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            CustomMainButton(text: 'Save', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  _getTimeText() {
    if (selectedTime == null) return 'Select Time';
    return selectedTime!.format(context);
    // '${selectedTime!.hour}:${selectedTime!.minute}';
  }

  _getDateText() {
    if (selectedDate == null) return 'Select Date';
    return DateFormat('yyyy,MM,dd').format(selectedDate!);

    // selectedDate.toString().split(' ')[0];
  }
}
