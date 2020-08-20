import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);
  final Function addTx;

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);
    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    addTx(
      enterTitle,
      enterAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                onSubmitted: (_) => submitData(),
                keyboardType: TextInputType.text,
                controller: titleController,
                // onChanged: (value) {
                //   title = value;
                // },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                onSubmitted: (_) => submitData(),
                // onChanged: (value) {
                //   amount = value;
                // },
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
