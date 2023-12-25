import 'package:insta/features/auth/controller/signup_controller.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:insta/features/auth/components/light_text.dart';
import 'package:insta/features/auth/components/dark_text.dart';
import 'package:insta/features/auth/components/textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class DateOfBirth extends StatelessWidget {
  final PageController pageController;
  const DateOfBirth({
    super.key,
    required this.pageController,
    required this.dob,
  });
  final TextEditingController dob;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DarkText(text: "What's your date of birth?"),
          const LightText(
            text:
                "Use your own date of bith, even if this is for a business, a pet or something else. No one will se this unless you choose to share it.",
          ),
          Text(
            'Why do i need to provide my date of birth?',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: const Color.fromRGBO(0, 149, 246, 1.0),
            ),
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            hint: 'Birthday',
            controller: dob,
            trailing: const SizedBox.shrink(),
            hidePassword: false,
            inputType: TextInputType.name,
            ontap: () => showDatePickerDialog(context, dob),
            onCheckName: (name) {},
          ),
          const SizedBox(height: 20),
          Button(
            text: 'Next',
            ontap: () => nextButtonPressed(dob.text),
            controller: Get.find<SignUpController>().signUpLoading,
          ),
        ],
      ),
    );
  }

  Future<void> showDatePickerDialog(
      BuildContext context, TextEditingController controller) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a date'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          content: SizedBox(
            height: 300,
            width: 400,
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                selectedDayHighlightColor: Colors.blue,
              ),
              value: [DateTime.now()],
              onValueChanged: (dates) {
                final selectedDate = dates[0] as DateTime;
                final currentDate = DateTime.now();
                final difference = currentDate.difference(selectedDate);
                final yearsDifference = difference.inDays ~/ 365;

                final formattedDate = DateFormat('dd MMMM yyyy').format(
                  selectedDate,
                );

                controller.text = '$formattedDate ($yearsDifference years old)';
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle OK button if needed
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void nextButtonPressed(String text) {
    if (text.isNotEmpty) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
