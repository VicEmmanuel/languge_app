import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/language_translation_tutorial/language_provider/locale_provider.dart';

final localeProvider = StateNotifierProvider<LocaleProvider, Locale>((ref) {
  return LocaleProvider();
});

class LanguageSwitcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // RadioListTile<Locale>(
        //   title: Text('English'),
        //   value: Locale('en'),
        //   groupValue: locale,
        //   onChanged: (Locale? value) { // Change the parameter type to Locale?
        //     if (value != null) {
        //       ref.read(localeProvider.notifier).setLocale(value);
        //     }
        //   },
        // ),
        // RadioListTile<Locale>(
        //   title: Text('Español'),
        //   value: Locale('ar'),
        //   groupValue: locale,
        //   onChanged: (Locale? value) { // Change the parameter type to Locale?
        //     if (value != null) {
        //       ref.read(localeProvider.notifier).setLocale(value);
        //     }
        //   },
        // ),
      ],
    );
  }
}


class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Provider"),

      ),
      body:
      Column(children: [
        RadioListTile<Locale>(
          title: Text('English'),
          value: Locale('en'),
          groupValue: locale,
          onChanged: (Locale? value) { // Change the parameter type to Locale?
            if (value != null) {
              ref.read(localeProvider.notifier).setLocale(value);
            }
          },
        ),
        RadioListTile<Locale>(
          title: Text('Español'),
          value: Locale('ar'),
          groupValue: locale,
          onChanged: (Locale? value) { // Change the parameter type to Locale?
            if (value != null) {
              ref.read(localeProvider.notifier).setLocale(value);
            }
          },
        ),
      ],)
    );
  }
}
