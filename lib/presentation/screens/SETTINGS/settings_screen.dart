import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/core/widgets/build_text_button.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/localization/locale_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifValue = false;

  @override
  Widget build(BuildContext context) {
    final localString = S.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final currentCode = localeProvider.locale?.languageCode ?? 'en';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                // Заголовок
                BuildText(
                  text: localString.settings,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),

                // Аватар
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: BuildImg(assetPath: 'assets/img/settings.png'),
                ),

                // Список настроек
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: [
                      // Виджет: уведомления (⏬ Вынесено в метод)
                      _buildNotificationTile(
                        title: localString.notification,
                        icon: CupertinoIcons.bell_fill,
                        value: notifValue,
                        onChanged: (value) {
                          setState(() {
                            notifValue = value;
                          });
                        },
                      ),

                      // Виджет: выбор языка (⏬ Вынесено в метод)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: _buildLanguageTile(
                          title: localString.language,
                          icon: Icons.language,
                          currentCode: currentCode,
                          onLocaleChanged:
                              (value) =>
                                  localeProvider.updateLocale(Locale(value)),
                        ),
                      ),

                      // Заголовок блока информации
                      BuildText(
                        text: localString.account_information,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),

                      // Элементы аккаунта (⏬ Вынесено в отдельный виджет)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: SettingTile(
                          title: localString.name,
                          subtitle: 'Lerm', // Заглушка
                          icon: CupertinoIcons.person_fill,
                          onTap: () {},
                        ),
                      ),

                      SettingTile(
                        title: localString.email,
                        subtitle: 'lerm@example.com', // Заглушка
                        icon: CupertinoIcons.mail_solid,
                        onTap: () {},
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: SettingTile(
                          title: localString.pass,
                          subtitle: '*******', //заглушка
                          icon: CupertinoIcons.lock_fill,
                          onTap: () {},
                        ),
                      ),

                      // Кнопка выхода
                      BuildTextButton(
                        onTap: () {
                          // TODO: Реализовать logout
                        },
                        text: localString.logout,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 📌 Метод: Переключатель уведомлений
  Widget _buildNotificationTile({
    required String title,
    required IconData icon,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey),
      ),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              _buildIcon(icon),
              const SizedBox(width: 8),
              BuildText(text: title, fontSize: 20, fontWeight: FontWeight.bold),
            ],
          ),
          Switch.adaptive(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  // 📌 Метод: Смена языка
  Widget _buildLanguageTile({
    required String title,
    required IconData icon,
    required String currentCode,
    required void Function(String) onLocaleChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey),
      ),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              _buildIcon(icon),
              const SizedBox(width: 8),
              BuildText(text: title, fontSize: 20, fontWeight: FontWeight.bold),
            ],
          ),
          DropdownButton<String>(
            value: currentCode,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'ru', child: Text('Русский')),
              DropdownMenuItem(value: 'uk', child: Text('Українська')),
            ],
            onChanged: (value) {
              if (value != null) onLocaleChanged(value);
            },
          ),
        ],
      ),
    );
  }

  // 📌 Метод: Иконка в кружочке
  Widget _buildIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: const Color(0xdd65aaea),
      radius: 18,
      child: Icon(icon, color: Colors.white),
    );
  }
}

// 📌 Виджет: Универсальный элемент настройки (name, email, pass и т.д.)
class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey),
        ),
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xdd65aaea),
                  radius: 18,
                  child: Icon(icon, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildText(
                      text: title,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    Text(subtitle),
                  ],
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right_outlined),
          ],
        ),
      ),
    );
  }
}
