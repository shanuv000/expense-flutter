import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(),
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: Colors.teal,
                // onSurface: Colors.green,
                // textStyle: const TextStyle(
                //   fontSize: 20,
                // ),
              ),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
