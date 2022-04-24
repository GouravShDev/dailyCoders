import 'package:daily_coders/core/theme/app_theme.dart';
import 'package:daily_coders/layers/item/list_item.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  // final VoidCallback? onClicked;
  const ListItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: klistColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(item.urlImage),
        ),
        title: Text(
          item.name,
          style: textStyle,
        ),
      ),
    );
  }
}
