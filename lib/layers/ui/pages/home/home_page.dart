import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/layers/data/list_items.dart';
import 'package:daily_coders/layers/item/list_item.dart';
import 'package:daily_coders/layers/ui/pages/home/widgets/bottom_navigation_bar.dart';
import 'package:daily_coders/layers/ui/pages/home/widgets/list_item_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // route name for navigation
  static const String route = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
