import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget trailing;
  final bool hidePassword;
  final TextInputType inputType;
  final void Function()? ontap;
  final void Function(String name)? onCheckName;
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    required this.trailing,
    required this.hidePassword,
    required this.inputType,
    this.onCheckName,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15),
      ),

      //textfield
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTap: ontap,
              onChanged: (value) {
                onCheckName!(value);
              },
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: InputBorder.none,
                label: Text(
                  hint,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              obscureText: hidePassword,
              keyboardType: inputType,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
