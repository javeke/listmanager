import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gigshub/providers/list_provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Container(
            child: TextField(
              style: TextStyle(fontSize: 18),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add item...",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton.icon(
              icon: Icon(
                Icons.add,
                size: 25,
              ),
              label: Text("Add Item"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffc2bad8)),
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                context.read<ListProvider>().addItem({"text": controller.text});
                controller.clear();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
