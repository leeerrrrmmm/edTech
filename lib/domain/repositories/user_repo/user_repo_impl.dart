import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_ed_tech/domain/entities/USER_ENTITY/user_entity.dart';
import 'package:course_ed_tech/domain/repositories/user_repo/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final FirebaseFirestore firebaseFirestore;

  UserRepoImpl({required this.firebaseFirestore});

  @override
  Future<UserEntity?> getUserByUid(String uid) async {
    final doc = await firebaseFirestore.collection('Users').doc(uid).get();

    if (doc.exists) {
      final data = doc.data()!;
      return UserEntity(
        uid: doc.id,
        name: data['displayName'],
        email: data['email'],
        photoUrl: data['photoUrl'],
      );
    } else {
      return null;
    }
  }
}
