import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
// import './user_transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    // width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple[300],
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    // width: double.infinity,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.red[400],
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .add_jm()
                              .format(transactions[index].date)
                              .toString(),
                          // tx.date.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
