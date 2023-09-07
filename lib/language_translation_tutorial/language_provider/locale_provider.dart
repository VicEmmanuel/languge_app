import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider() : super(Locale('en'));

  void setLocale(Locale locale) {
    state = locale;
  }
}

final localeProvider = StateNotifierProvider<LocaleProvider, Locale>((ref) {
  return LocaleProvider();
});

