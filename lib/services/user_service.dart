import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel user) {
    return _usersCollection.doc(user.uid).set(user.toFirestore());
  }

  Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) {
    return _usersCollection.doc(uid).update(data);
  }

  Future<void> updateUserLastActiveAt(String uid) {
    return _usersCollection.doc(uid).update({
      'lastActiveAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteUser(String uid) {
    return _usersCollection.doc(uid).delete();
  }
}