import 'package:course_ed_tech/domain/entities/USER_ENTITY/user_entity.dart';

abstract class UserRepo {
  Future<UserEntity?> getUserByUid(String uid);
}
