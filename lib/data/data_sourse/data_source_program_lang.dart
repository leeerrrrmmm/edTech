import 'package:course_ed_tech/data/models/program_lang_model/model_program_language.dart';
import 'package:course_ed_tech/domain/entities/LESSONS_FIELD_ENTITY/lessons_field.dart';
import 'package:course_ed_tech/domain/entities/LESSON_ENTITY/lessons_entity.dart';
import 'package:course_ed_tech/domain/entities/QUESTION_ENTITY/question_entity.dart';
import 'package:course_ed_tech/domain/entities/QUIZ_ENTITY/quiz_entity.dart';

class LanguageLocalDataSource {
  Future<List<ProgramLanguage>> getLanguages() async {
    return [
      ProgramLanguage(
        id: 0,
        name: 'Dart',
        description: 'Язык для Flutter',
        imgPath: 'assets/img/dart_img.png',
        courseTime: '3 h 30 min',
        aboutTheCourse:
            'Узнаете о таком языке программирования как Dart, разберётесь в основах и ООП, выполните пару небольших проектов. По завершению курса можно приступить к Flutter.',
        price: 50,
        lessons: [
          LessonsEntity(
            lessonName: 'Введение в Dart',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 0,
                lessonFieldIntroduction:
                    'Познакомьтесь с языком программирования Dart — мощным инструментом для создания кроссплатформенных приложений. В этом уроке мы расскажем об истории языка, его ключевых особенностях и областях применения. Вы узнаете, почему Dart стал таким популярным выбором для разработки с Flutter, а также о его поддержке современного синтаксиса и принципов ООП.\n\n'
                    'Dart был создан компанией Google и быстро завоевал популярность благодаря своей производительности и гибкости. Он используется для создания не только мобильных приложений, но и серверных решений, а также веб-приложений. Мы поговорим о его синтаксисе, основах структуры кода и том, как этот язык помогает создавать эффективные и масштабируемые приложения.\n\n'
                    'Введение в Dart откроет вам основы его экосистемы, а также познакомит с основными библиотеками и инструментами разработки. Вы будете готовы к созданию ваших первых программ на Dart и погрузитесь в мир Flutter.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-intro',
              ),
            ],
          ),
          LessonsEntity(
            lessonName: 'Переменные и типы данных',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 1,
                lessonFieldIntroduction:
                    'В этом уроке мы рассмотрим основы работы с переменными и типами данных в языке Dart. Вы узнаете, как объявлять переменные, что такое типы данных и как их правильно использовать в своих программах. Мы подробно объясним, какие бывают типы данных в Dart, как работать с примитивными типами, а также с коллекциями, такими как списки и карты.\n\n'
                    'Важно понимать, как Dart работает с типами данных, чтобы обеспечить корректность работы программы. Например, в Dart переменные можно объявлять с указанием типа или без него, что делает код гибким и удобным для разработки. Мы также рассмотрим такие понятия, как константы и переменные, которые нельзя изменить после их инициализации.\n\n'
                    'В конце урока вы будете уверенно работать с переменными, а также научитесь правильно управлять типами данных в своих приложениях на Dart.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-variables',
              ),
            ],
          ),
          LessonsEntity(
            lessonName: 'Функции и управление потоком',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 2,
                lessonFieldIntroduction:
                    'Функции — это одна из важнейших концепций в программировании, и в Dart они играют ключевую роль. В этом уроке мы научим вас создавать функции, передавать параметры и возвращать значения. Кроме того, вы познакомитесь с основами управления потоком программы с помощью условий, циклов и исключений.\n\n'
                    'Мы разберем основные конструкции управления потоком, такие как if, else, switch, а также научимся работать с циклами — for, while и do-while. Все это необходимо для написания логики программ, которая будет выполнять нужные вам операции в зависимости от условий.\n\n'
                    'Также мы рассмотрим обработку исключений с помощью try, catch и throw. Это поможет вам научиться работать с ошибками и избегать сбоев в работе программы.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-functions',
              ),
            ],
          ),
          LessonsEntity(
            lessonName: 'Основы ООП в Dart',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 3,
                lessonFieldIntroduction:
                    'Объектно-ориентированное программирование (ООП) является основой многих современных языков программирования, и Dart не исключение. В этом уроке вы научитесь работать с классами и объектами, понимать принципы инкапсуляции, наследования и полиморфизма.\n\n'
                    'Мы расскажем, как создавать собственные классы и работать с объектами. Вы научитесь создавать методы, конструкторы и геттеры/сеттеры. Мы также погрузимся в такие важные концепции, как наследование, которое позволяет создавать новые классы на основе уже существующих, и инкапсуляция, которая скрывает детали реализации.\n\n'
                    'Этот урок позволит вам овладеть основами ООП и подготовит вас к более сложным темам в программировании на Dart.',
                lessonFieldVideoPath: 'https://www.example.com/video/dart-oop',
              ),
            ],
          ),
        ],
        quizes: [
          QuizEntity(
            quizNum: 'Quiz 1',
            quizTitle: 'Dart - Start',
            littleDescription:
                'There will be a few questions for you wich will show yours skills',
            questions: [
              Question(
                questionText: 'What is Flutter',
                answers: ['A bird', '1 + 1', 'Java Scrip', 'Kolya Lox'],
                correctAnswerIndex: 3,
              ),
              Question(
                questionText: 'What is Flutter',
                answers: ['A bird', '1 + 1', 'Java Scrip', 'Kolya Lox'],
                correctAnswerIndex: 2,
              ),
              Question(
                questionText: 'What is Flutter',
                answers: ['A. A bird', '1 + 1', 'Java Scrip', 'Kolya Lox'],
                correctAnswerIndex: 1,
              ),
              Question(
                questionText: 'What is Flutter',
                answers: ['B. A bird', '1 + 1', 'Java Scrip', 'Kolya Lox'],
                correctAnswerIndex: 3,
              ),
              Question(
                questionText: 'What is Flutter',
                answers: ['C. A bird', '1 + 1', 'Java Scrip', 'Kolya Lox'],
                correctAnswerIndex: 0,
              ),
              Question(
                questionText: 'What is Flutter',
                answers: ['D. A bird', '1 + 1', 'Java Scrip', 'Kolya Lox'],
                correctAnswerIndex: 1,
              ),
            ],
          ),
          QuizEntity(
            quizNum: 'Quiz 2',
            quizTitle: 'Dart - Begin',
            littleDescription:
                'There will be a few questions for you wich will show yours skills',
            questions: [
              Question(
                questionText: 'What is i++',
                answers: ['A bird', '1 + 2', 'increment', 'Kolya Lox'],
                correctAnswerIndex: 2,
              ),
            ],
          ),
        ],
      ),

      ProgramLanguage(
        id: 1,
        name: 'Advanced Dart',
        description: 'Продвинутые концепции Dart',
        imgPath: 'assets/img/dart_img.png',
        courseTime: '4 h 15 min',
        aboutTheCourse:
            'Углубитесь в язык Dart: научитесь работать с асинхронностью, обобщениями, расширениями классов и миксинами. Этот курс поможет писать более гибкий и чистый код, а также готовит к созданию сложных Flutter-приложений.',
        price: 70,
        lessons: [
          LessonsEntity(
            lessonName: 'Асинхронность в Dart: Future, async/await',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 0,
                lessonFieldIntroduction:
                    'Асинхронное программирование — это важная часть любого современного приложения, и Dart предоставляет мощные инструменты для работы с асинхронностью. В этом уроке вы узнаете, что такое Future и как использовать его для работы с асинхронными операциями. Мы также объясним, как использовать async и await для упрощения работы с асинхронными функциями.\n\n'
                    'Асинхронность позволяет нам выполнять операции, которые занимают много времени, не блокируя основной поток выполнения. Мы разберем, как правильно обрабатывать ошибки, происходящие в асинхронных операциях, и как работать с несколькими асинхронными задачами одновременно.\n\n'
                    'Это знание поможет вам писать более эффективные и отзывчивые приложения, которые могут обрабатывать данные в фоновом режиме, не замедляя интерфейс.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-async',
              ),
            ],
          ),
          LessonsEntity(
            lessonName: 'Stream и многопоточность',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 1,
                lessonFieldIntroduction:
                    'Работа с потоками данных является одной из важнейших задач в асинхронном программировании. В этом уроке мы изучим, как работать с потоками (Stream) и как использовать их для обработки потоковых данных. Мы рассмотрим, как подписываться на потоки, обрабатывать события и управлять подписками.\n\n'
                    'Кроме того, мы коснемся многопоточности и того, как можно эффективно использовать несколько потоков в Dart для улучшения производительности. Вы узнаете, как использовать StreamController, а также научитесь работать с комбинированными потоками и их обработкой.\n\n'
                    'Этот урок даст вам возможность научиться эффективно работать с асинхронными потоками данных и многозадачностью в Dart.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-stream',
              ),
            ],
          ),
          LessonsEntity(
            lessonName: 'Generics и типобезопасность',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 2,
                lessonFieldIntroduction:
                    'В этом уроке мы погрузимся в концепцию обобщений (Generics) и типобезопасности в Dart. Вы узнаете, как создавать обобщенные классы и функции, которые могут работать с различными типами данных, обеспечивая при этом безопасность типов.\n\n'
                    'Generics позволяют создавать более гибкие и reusable компоненты, а типобезопасность помогает избежать ошибок, связанных с несовпадением типов. Мы разберем, как использовать обобщения в коллекциях, классах и функциях, чтобы избежать проблем с типами в вашем коде.\n\n'
                    'Вы также познакомитесь с ограничениями типов и узнаете, как использовать их для создания более безопасных и универсальных решений.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-generics',
              ),
            ],
          ),
          LessonsEntity(
            lessonName: 'Mixins, Extensions и модульность',
            lessonsFields: [
              LessonsField(
                lessonFieldId: 3,
                lessonFieldIntroduction:
                    'Dart предоставляет мощные инструменты для работы с многократным наследованием и расширением функциональности классов. В этом уроке мы разберемся с такими важными концепциями, как миксины (Mixins) и расширения (Extensions), которые позволяют увеличивать функциональность классов без необходимости их изменять.\n\n'
                    'Миксины позволяют добавлять методы в классы без использования наследования, что делает код более гибким и повторно используемым. Мы рассмотрим, как создавать и использовать миксины, а также как работать с расширениями, которые позволяют добавлять функциональность к уже существующим классам.\n\n'
                    'Этот урок будет полезен для тех, кто хочет научиться работать с чистыми и гибкими архитектурными решениями, используя возможности Dart.',
                lessonFieldVideoPath:
                    'https://www.example.com/video/dart-mixins-extensions',
              ),
            ],
          ),
        ],
        quizes: [],
      ),
    ];
  }
}
