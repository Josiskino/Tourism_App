import 'package:flutter/material.dart';

import '../../../../../../entities/transactions.dart';
import 'transaction_card.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = Transactions.transactions();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final transaction = transactions[index];
          return TransactionCard(transaction: transaction);
        },
        childCount: transactions.length,
      ),
    );
  }
}