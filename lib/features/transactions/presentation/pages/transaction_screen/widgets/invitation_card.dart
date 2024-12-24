


import 'package:flutter/material.dart';

class InvitationCard extends StatelessWidget {
  const InvitationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          //const AvatarStack(),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Invite friends to join your next adventure!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Invite'),
          ),
        ],
      ),
    );
  }
}