import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_ed_tech/core/widgets/animated_container_button.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/core/widgets/build_text_button.dart';
import 'package:course_ed_tech/domain/entities/USER_ENTITY/user_entity.dart';
import 'package:course_ed_tech/domain/repositories/user_repo/user_repo_impl.dart';
import 'package:course_ed_tech/domain/usecases/get_user_by_uid_use_case/get_user_by_uid_use_case.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/payment_screens/payment_screen.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/saved_screen.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/your_courses_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GetUserByUidUseCase getUserByUidUseCase;
  UserEntity? userEntity;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserByUidUseCase = GetUserByUidUseCase(
      userRepo: UserRepoImpl(firebaseFirestore: FirebaseFirestore.instance),
    );
    fetchUser();
  }

  Future<void> fetchUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final user = await getUserByUidUseCase.getUserByUid(currentUser.uid);
      setState(() {
        userEntity = user;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : userEntity == null
                ? Center(child: Text('User not found'))
                : Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      BuildText(
                        text: S.of(context).profile,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      // Аватар
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 4),
                        ),
                        child: ClipOval(
                          child:
                              userEntity?.photoUrl?.isNotEmpty ?? false
                                  ? Image.network(
                                    userEntity?.photoUrl ?? '',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    'assets/img/prof_img.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Имя
                      BuildText(
                        text: userEntity?.name ?? 'No name',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8),
                      // Email
                      BuildText(
                        text: userEntity?.email ?? 'No email',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 30),
                      // Кнопки
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            children: [
                              AnimatedContainerButton(
                                text: S.of(context).your_courses,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => YourCoursesScreen(),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14.0,
                                ),
                                child: AnimatedContainerButton(
                                  text: S.of(context).saved,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => SavedScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              AnimatedContainerButton(
                                text: S.of(context).payment,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => PaymentScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 14),
                              BuildTextButton(
                                onTap: () {
                                  FirebaseAuth.instance.signOut();
                                  // Можно добавить переход на экран логина
                                },
                                text: S.of(context).logout,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
