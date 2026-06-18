import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationService {
  final CollectionReference _notificationsCollection =
      FirebaseFirestore.instance.collection('notifications');

  Future<DocumentReference> createNotification(NotificationModel notification) {
    return _notificationsCollection.add(notification.toFirestore());
  }

  Stream<List<NotificationModel>> getNotificationsForUser(String userId) {
    return _notificationsCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationModel.fromFirestore(doc))
            .toList());
  }

  Future<void> markAsRead(String notificationId) {
    return _notificationsCollection.doc(notificationId).update({'isRead': true});
  }
}