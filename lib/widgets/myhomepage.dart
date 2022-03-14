import 'package:flutter/material.dart';
import 'package:personal_expences/widgets/transaction_controller.dart';
import 'package:personal_expences/widgets/transaction_list.dart';
import '../moduls/transaction.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transacation> transactions = [
    Transacation(
        id: "t1", amount: 70.55, date: DateTime.now(), title: "hostel rent"),
    Transacation(
        id: "t2", amount: 56.55, date: DateTime.now(), title: "t shirt "),
    Transacation(
        id: "t3", amount: 85.55, date: DateTime.now(), title: "icecream"),
    Transacation(
        id: "t4", amount: 84.55, date: DateTime.now(), title: "movie tickets"),
  ];

  void addExpenditure({required String title, required double amount}) async {
    final newTransaction = Transacation(
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now(),
        title: title);

    setState(() {
      transactions.add(newTransaction);
    });
  }

  void screenpopup(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => TransactionController(addExpenditure));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => screenpopup(context), icon: Icon(Icons.add))
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const Card(
            child: Text(
              "chart!!!!!!!!!!!!!!!!!!!!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          TransactionList(transactions),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => screenpopup(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
