import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/layers/data/list_items.dart';
import 'package:daily_coders/layers/item/list_item.dart';
import 'package:daily_coders/layers/ui/pages/home/widgets/list_item_widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ListItem> items = List.from(listItems);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: AnimatedList(
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) =>
            ListItemWidget(item: items[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
