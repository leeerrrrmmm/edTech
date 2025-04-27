import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/data/data_sourse/data_source_program_lang.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/domain/repositories/program_lang_repo/program_lang_repo_impl.dart';
import 'package:course_ed_tech/domain/usecases/program_lang_use_cases/program_lang_use_casses.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:course_ed_tech/presentation/screens/DETAIL/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final getLanguagesUseCase = GetLanguagesUseCase(
    LanguageRepositoryImpl(dataSource: LanguageLocalDataSource()),
  );

  final List<String> catName = ['#CSS', '#UI', '#UX', '#C++'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is LoadSearchedCourses) {
                return _buildMainContent(
                  context,
                  courses: state.loadFindedCourses,
                );
              } else {
                return FutureBuilder<List<ProgramLanguageEntity>>(
                  future: getLanguagesUseCase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Ошибка загрузки данных'),
                      );
                    }
                    return _buildMainContent(
                      context,
                      courses: snapshot.data ?? [],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context, {
    required List<ProgramLanguageEntity> courses,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(),
          const SizedBox(height: 14),
          _buildSearchField(context),
          const SizedBox(height: 14),
          _buildCategories(),
          const SizedBox(height: 14),
          courses.isEmpty
              ? Center(
                child: Column(
                  children: <Widget>[
                    BuildImg(assetPath: 'assets/img/no_course.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                      child: BuildText(
                        text: S.of(context).course_not_found,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BuildText(
                      textAlign: TextAlign.center,
                      text: S.of(context).try_search_with_a_diff_keyword,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
              : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final lang = courses[index];
                  return _buildCourseItem(context, lang);
                },
              ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BuildText(
              text: 'Hello,',
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            BuildText(text: 'Lerm', fontSize: 36, fontWeight: FontWeight.bold),
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffBEBAB3)),
          ),
          child: const Center(child: Icon(CupertinoIcons.bell)),
        ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffBEBAB3)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (text) {
                context.read<SearchBloc>().add(SearchCourses(text));
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Your Courses...',
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BuildText(
          text: 'Category:',
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        ...List.generate(
          catName.length,
          (index) => _buildCategoryContainer(catName[index]),
        ),
      ],
    );
  }

  Widget _buildCategoryContainer(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BuildText(text: name, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildCourseItem(BuildContext context, ProgramLanguageEntity lang) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder:
                (context) => DetailScreen(
                  courseName: lang.name,
                  aboutCourse: lang.aboutTheCourse,
                  imgPath: lang.imgPath,
                  price: lang.price,
                  courseDuratuion: lang.courseTime,
                  lang: lang,
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 14.0),
        decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 296,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildImg(assetPath: lang.imgPath),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildText(
                    text: lang.courseTime,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff5BA092),
                  ),
                  BuildText(
                    text: lang.name,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildText(
                    overflow: TextOverflow.ellipsis,
                    text: lang.description,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
