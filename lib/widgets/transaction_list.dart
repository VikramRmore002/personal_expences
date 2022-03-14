import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../moduls/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transacation> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 625 ,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (ctx, index){
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "₹" + " ${transaction[index].amount.toStringAsFixed(2)}",
                    style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 3),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction[index].title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      DateFormat.yMMMd().add_jm().format(transaction[index].date),
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        },

      ),  );
  }
}
