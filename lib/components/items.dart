import 'package:flutter/material.dart';
import 'package:gigshub/components/add_item.dart';
import 'package:gigshub/components/list_item.dart';
import 'package:gigshub/providers/list_provider.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  void initState() {
    super.initState();
    final listState = Provider.of<ListProvider>(context, listen: false);

    listState.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AddItem(),
          Container(
            height: 300, // TODO: Adjust this value
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: Provider.of<ListProvider>(context).items.length,
              itemBuilder: (context, index) => ListItem(
                item: Provider.of<ListProvider>(context).items[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
