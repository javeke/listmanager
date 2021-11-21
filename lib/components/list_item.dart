import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gigshub/providers/list_provider.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item}) : super(key: key);

  final item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffeeeeee), width: 1),
        ),
      ),
      child: ListTile(
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            size: 25,
            color: Color(0xffb22222),
          ),
          onPressed: () {
            context.read<ListProvider>().deleteItem(item['id']);
          },
        ),
        tileColor: Color(0xfff8f8f8),
        title: Text(
          item['text'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      ),
    );
  }
}
