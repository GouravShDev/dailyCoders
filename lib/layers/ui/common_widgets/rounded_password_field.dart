import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/layers/ui/common_widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool isConfirmPass;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.isConfirmPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: isConfirmPass ? Strings.confirmPass : Strings.password,
          icon: const Icon(
            Icons.lock,
          ),
          suffixIcon: isConfirmPass
              ? null
              : const Icon(
                  Icons.visibility,
                ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
