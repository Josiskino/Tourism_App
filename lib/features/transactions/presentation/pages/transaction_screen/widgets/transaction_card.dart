import 'package:flutter/material.dart';

import '../../../../../../main_screen/activities_screen.dart';
import '../../../../domain/entities/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;

  const TransactionCard({required this.transaction, super.key});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: _buildStatusIcon(),
            title: Text(
              '- ${widget.transaction.amount}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: _buildStatusChip(),
          ),
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Text('Payment for product'),
                  const Spacer(),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) _buildTransactionDetails(),
        ],
      ),
    );
  }

  Widget _buildStatusIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red[100],
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.arrow_downward, color: Colors.red),
    );
  }

  Widget _buildStatusChip() {
    final statusColor = getTransactionStatusColor(widget.transaction.status as String);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(widget.transaction.status as String),
    );
  }

  Widget _buildTransactionDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Receiver', widget.transaction.identifier),
          const SizedBox(height: 12),
          _buildDetailRow('Payment Method', widget.transaction.network ?? ''),
          const SizedBox(height: 12),
          _buildDetailRow('Reference', 'Ref: ${widget.transaction.transactionReference}'),
          const SizedBox(height: 12),
          _buildDetailRow('Date', widget.transaction.transactionDate.toString()),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}