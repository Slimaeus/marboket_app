// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  Computed<bool>? _$isLightThemeComputed;

  @override
  bool get isLightTheme =>
      (_$isLightThemeComputed ??= Computed<bool>(() => super.isLightTheme,
              name: 'AppStoreBase.isLightTheme'))
          .value;
  Computed<bool>? _$isEnComputed;

  @override
  bool get isEn => (_$isEnComputed ??=
          Computed<bool>(() => super.isEn, name: 'AppStoreBase.isEn'))
      .value;

  late final _$themeModeAtom =
      Atom(name: 'AppStoreBase.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$localeAtom = Atom(name: 'AppStoreBase.locale', context: context);

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$currentLocaleAtom =
      Atom(name: 'AppStoreBase.currentLocale', context: context);

  @override
  SupportedLocale get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(SupportedLocale value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  late final _$setLanguagesAsyncAction =
      AsyncAction('AppStoreBase.setLanguages', context: context);

  @override
  Future<void> setLanguages(BuildContext context,
      {required SupportedLocale locale}) {
    return _$setLanguagesAsyncAction
        .run(() => super.setLanguages(context, locale: locale));
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setTheme(ThemeMode mode) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setTheme');
    try {
      return super.setTheme(mode);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTheme() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.toggleTheme');
    try {
      return super.toggleTheme();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocale(BuildContext context, Locale newLocale) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setLocale');
    try {
      return super.setLocale(context, newLocale);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
locale: ${locale},
currentLocale: ${currentLocale},
isLightTheme: ${isLightTheme},
isEn: ${isEn}
    ''';
  }
}
