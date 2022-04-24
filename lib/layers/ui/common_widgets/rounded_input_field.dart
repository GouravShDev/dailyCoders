import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/layers/ui/common_widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
