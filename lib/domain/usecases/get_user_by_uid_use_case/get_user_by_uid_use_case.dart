import 'package:course_ed_tech/domain/entities/USER_ENTITY/user_entity.dart';
import 'package:course_ed_tech/domain/repositories/user_repo/user_repo.dart';

class GetUserByUidUseCase {
  final UserRepo userRepo;

  GetUserByUidUseCase({required this.userRepo});

  Future<UserEntity?> getUserByUid(String uid) async {
    return userRepo.getUserByUid(uid);
  }
}
