import 'package:flutter/material.dart';
import 'package:gigshub/constants.dart';
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
                  backgroundColor:
                      MaterialStateProperty.all(Constants.lightGrey),
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                if (controller.text == "") {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Enter the name of the item"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Okay"),
                        )
                      ],
                    ),
                  );
                  return;
                }
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
