import 'package:flutter/material.dart';

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  bool isRead;
  final String type;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    this.isRead = false,
    required this.type,
  });
}

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];
  int _unreadCount = 0;

  List<NotificationModel> get notifications => _notifications;
  int get unreadCount => _unreadCount;

  NotificationProvider() {
    // Initialiser avec des données d'exemple
    _loadInitialNotifications();
  }

  void _loadInitialNotifications() {
    _notifications = [
      NotificationModel(
        id: '1',
        title: "Nouveau message",
        message: "Vous avez reçu un nouveau message de Jean",
        date: DateTime.now().subtract(const Duration(hours: 1)),
        type: 'info',
      ),
      NotificationModel(
        id: '2',
        title: "Rappel",
        message: "Réunion dans 30 minutes",
        date: DateTime.now().subtract(const Duration(hours: 2)),
        type: 'alert',
      ),
      NotificationModel(
        id: '3',
        title: "Succès",
        message: "Votre paiement a été validé",
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: 'success',
      ),
    ];
    _updateUnreadCount();
  }

  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification);
    _updateUnreadCount();
    notifyListeners();
  }

  void removeNotification(String id) {
    _notifications.removeWhere((notification) => notification.id == id);
    _updateUnreadCount();
    notifyListeners();
  }

  void markAsRead(String id) {
    final notification = _notifications.firstWhere((n) => n.id == id);
    notification.isRead = true;
    _updateUnreadCount();
    notifyListeners();
  }

  void markAllAsRead() {
    for (var notification in _notifications) {
      notification.isRead = true;
    }
    _updateUnreadCount();
    notifyListeners();
  }

  void clearAll() {
    _notifications.clear();
    _updateUnreadCount();
    notifyListeners();
  }

  void _updateUnreadCount() {
    _unreadCount = _notifications.where((n) => !n.isRead).length;
  }
}