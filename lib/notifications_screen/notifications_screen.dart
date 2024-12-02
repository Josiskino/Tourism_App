import 'package:flutter/material.dart';
import 'package:myapp/entities/notifications.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<NotificationProvider>(
          builder: (context, provider, child) {
            return Row(
              children: [
                const Text('Notifications'),
                const SizedBox(width: 8),
                if (provider.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${provider.unreadCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              final provider = context.read<NotificationProvider>();
              switch (value) {
                case 'mark_all_read':
                  provider.markAllAsRead();
                  break;
                case 'clear_all':
                  provider.clearAll();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'mark_all_read',
                child: Text('Marquer tout comme lu'),
              ),
              const PopupMenuItem(
                value: 'clear_all',
                child: Text('Tout effacer'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          if (provider.notifications.isEmpty) {
            return const Center(
              child: Text(
                'Aucune notification',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            itemCount: provider.notifications.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final notification = provider.notifications[index];
              return Dismissible(
                key: Key(notification.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  provider.removeNotification(notification.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notification supprimée'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: ListTile(
                  leading: _NotificationIcon(type: notification.type),
                  title: Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.message),
                      const SizedBox(height: 4),
                      Text(
                        _formatDate(notification.date),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    if (!notification.isRead) {
                      provider.markAsRead(notification.id);
                    }
                    // Ajoutez ici la navigation ou l'action souhaitée lors du tap
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Exemple d'ajout d'une nouvelle notification
          final provider = context.read<NotificationProvider>();
          provider.addNotification(
            NotificationModel(
              id: DateTime.now().toString(),
              title: "Nouvelle notification",
              message: "Ceci est une notification de test",
              date: DateTime.now(),
              type: 'info',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return 'Il y a ${difference.inMinutes} minutes';
      }
      return 'Il y a ${difference.inHours} heures';
    }
    return 'Il y a ${difference.inDays} jours';
  }
}

class _NotificationIcon extends StatelessWidget {
  final String type;

  const _NotificationIcon({required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'info':
        return const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.info, color: Colors.white, size: 20),
        );
      case 'alert':
        return const CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(Icons.warning, color: Colors.white, size: 20),
        );
      case 'success':
        return const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white, size: 20),
        );
      default:
        return const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.notifications, color: Colors.white, size: 20),
        );
    }
  }
}