import 'package:flutter/material.dart';
import 'package:marboket_app/app/constants/constants.dart';
import 'package:marboket_app/app/enums/supported_locale.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  AppStoreBase() {
    // AppSharedPreferences.getString(KeyManager.language).then(
    //   (value) {
    //     switch (value) {
    //       case Constants.enLocale:
    //         locale = const Locale(Constants.enLocale);
    //         currentLocale = SupportedLocale.en;
    //         break;
    //       case Constants.viLocale:
    //         locale = const Locale(Constants.viLocale);
    //         currentLocale = SupportedLocale.vi;
    //         break;
    //       default:
    //         break;
    //     }
    //   },
    // );
  }

  @observable
  ThemeMode themeMode = ThemeMode.light;

  @observable
  Locale locale = const Locale(Constants.enLocale);

  @observable
  SupportedLocale currentLocale = SupportedLocale.en;

  @computed
  bool get isLightTheme => themeMode == ThemeMode.light;

  @computed
  bool get isEn => currentLocale == SupportedLocale.en;

  @action
  void setTheme(ThemeMode mode) {
    themeMode = mode;
  }

  @action
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @action
  void setLocale(BuildContext context, Locale newLocale) {
    locale = newLocale;
  }

  @action
  Future<void> setLanguages(BuildContext context,
      {required SupportedLocale locale}) async {
    late String languageCode;

    switch (locale) {
      case SupportedLocale.en:
        languageCode = Constants.enLocale;
        break;
      case SupportedLocale.vi:
        languageCode = Constants.viLocale;
        break;
      default:
        languageCode = Constants.enLocale;
        break;
    }
    currentLocale = locale;

    setLocale(context, Locale(languageCode));
    // AppSharedPreferences.setString(KeyManager.language, languageCode);
  }
}
