import 'package:expenses_project/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  TransactionList(this.transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Text(
                    'Não há transações cadastradas.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.60,
                    child: Image.asset(
                      'assets\\images\\waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                final tr = transaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    selectedColor: Theme.of(context).colorScheme.secondary,
                    leading: CircleAvatar(
                      child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(child: Text('R\$${tr.value}'))),
                      radius: 30,
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: MediaQuery.of(context).size.width > 480
                        ? TextButton.icon(
                            onPressed: () => onRemove(tr.id),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            label: Text(
                              'Excluir',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => onRemove(tr.id),
                          ),
                  ),
                );
              },
            ),
          );
  }
}
