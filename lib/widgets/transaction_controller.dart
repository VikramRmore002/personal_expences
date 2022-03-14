import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expences/widgets/transaction_list.dart';
import '../widgets/transaction_controller.dart';

class TransactionController extends StatefulWidget {
  final Function addExpense;

  TransactionController(this.addExpense);

  @override
  State<TransactionController> createState() => _TransactionControllerState();
}

class _TransactionControllerState extends State<TransactionController> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  late final ttx = titleController.text;
  late final atx = double.parse(amountController.text);

  void addexpenselogic() {
    if (ttx.isEmpty && atx <= 0) {
      return;
    }
    widget.addExpense(title: ttx, amount: atx);
    Navigator.of(context).pop();
    //  Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        // color: Colors.purple,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.purple,
              width: 3
        )),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(
                  labelText: "title",
                ),
                controller: titleController,
                textInputAction: TextInputAction.next),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "amount",
              ),
              controller: amountController,
              // textInputAction: TextInputAction.next,
              onSubmitted: (_)=> addexpenselogic(),
            ),
            TextButton(
                onPressed: addexpenselogic, child: const Text("add expenditure"))
          ],
        ),
      ),
    );
  }
}
