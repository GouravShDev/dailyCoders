import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: SizeConfig.screenWidth * 0.8,
      decoration: BoxDecoration(
        color: ktextFieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
