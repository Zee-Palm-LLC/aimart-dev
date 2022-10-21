import 'package:cloud_firestore/cloud_firestore.dart';

import '../modules/home/models/notification_model.dart';
import '../modules/home/models/user_model.dart';

class DatabaseService {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  CollectionReference<UserModel?> get usersCollection => firebase
          .collection('Users')
          .withConverter(fromFirestore: (snapshot, options) {
        return snapshot.exists ? UserModel.fromMap(snapshot.data()!) : null;
      }, toFirestore: (object, options) {
        return object!.toMap();
      });

//ProductCollection

  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('Products');

  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('Carts');

  CollectionReference<NotificationModel?> notificationsCollection(String uid) =>
      usersCollection.doc(uid).collection("Notifications").withConverter(
        fromFirestore: (snapshot, options) {
          return snapshot.exists
              ? NotificationModel.fromMap(snapshot.data()!)
              : null;
        },
        toFirestore: (value, options) {
          return value!.toMap();
        },
      );
}
