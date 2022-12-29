import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=0) {
      return ;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         TextField(
                            decoration: const InputDecoration(labelText: "title"),
                            controller: titleController,
                            keyboardType:  TextInputType.text,
                            onSubmitted: (_) => submitData(),
                            ),
                         TextField(
                          decoration: const InputDecoration(labelText: "amount"),
                          controller: amountController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onSubmitted: (_) => submitData(),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white),
                                onPressed: submitData,
                                child: const Text("Add transactions")))
                      ]),
                ),
              );
  }
}