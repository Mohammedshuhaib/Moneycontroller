import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);
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
                            // onChanged: (value) {
                            //   titleInput = value;
                            controller: titleController,
                            ),
                         TextField(
                          decoration: const InputDecoration(labelText: "amount"),
                          // onChanged: (value) => amountInput = value,
                          controller: amountController,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  addTx(titleController.text,double.parse(amountController.text));
                                },
                                child: const Text("Add transactions")))
                      ]),
                ),
              );
  }
}