import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
      ? Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Nenhuma Transação Cadastrada',
            style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Color.fromRGBO(0, 0, 0, 0.16)
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 200,
            child: Opacity(
              opacity: 0.16,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      )
    : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple[100],
          ),
          margin: EdgeInsets.symmetric(
            vertical: 10
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'R\$${tr.value}',
                        style: TextStyle(
                          color: Colors.purple[800]
                        ),
                      ),
                      Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                    ],
                  ),
                  flex: 3,
                ),
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.purple[800],
                    onPressed: () => onRemove(tr.id),
                  ),
                  flex: 1,
                ),
              ],
            ),
          )
        );
      },
    );
  }
}
