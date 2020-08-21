import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx);
  final Function addTx;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }

    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);
    if (enterTitle.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enterTitle, enterAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _percentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
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
                Container(
                  height: 70.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'Choose Date'
                              : 'Picked date  ${DateFormat.yMd().format(_selectedDate)}',
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      RaisedButton(
                        color: Colors.white,
                        onPressed: _percentDataPicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: submitData,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
