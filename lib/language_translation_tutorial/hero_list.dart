import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/delivery_progress.dart';
import 'package:language_app/language_translation_tutorial/hero_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_app/language_translation_tutorial/language_provider/language_switcher.dart';

class HeroList extends  ConsumerStatefulWidget {
  final String title;

  HeroList({this.title = ''});

  @override
  ConsumerState<HeroList> createState() => _HeroListState();
}

class _HeroListState extends ConsumerState<HeroList> {
  @override
  Widget build(BuildContext context, ) {
    final locale = ref.watch(localeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Open settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DeliveryProgressTracker()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(AppLocalizations.of(context)!.appTitle),
            ),
            RadioListTile<Locale>(
              title: Text('English'),
              value: Locale('en'),
              groupValue: locale,
              onChanged: (Locale? value) { // Change the parameter type to Locale?
                if (value != null) {
                 setState(() {
                   // ref.watch(localeProvider.notifier).setLocale(value);
                   // ref.read(localeProvider.notifier).state = value;
                   ref.read(localeProvider.notifier).setLocale(value);
                 });
                }
              },
            ),
            RadioListTile<Locale>(
              title: Text('Español'),
              value: Locale('ar'),
              groupValue: locale,
              onChanged: (Locale? value) { // Change the parameter type to Locale?
                if (value != null) {
                  setState(() {
                    // ref.watch(localeProvider.notifier).setLocale(value);
                    ref.read(localeProvider.notifier).setLocale(value);
                  });
                }
              },
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  HeroCard(
                    name: 'Grace Hopper',
                    born: '9 December 1906',
                    bio: 'Devised theory of machine-independent '
                        'programming languages.',
                    // imagePath: "https://th.bing.com/th?id=OIP.4SylHaWEydBNAiXzr3XlOgHaEW&w=326&h=191&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
                  ),

                  HeroCard(
                    name: 'Alan Turing',
                    born: '23 June 1912',
                    bio: 'Father of theoretical computer science & '
                        'artificial intelligence.',
                    // imagePath:"https://th.bing.com/th?id=OIP.4SylHaWEydBNAiXzr3XlOgHaEW&w=326&h=191&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
                  ),

                  // ...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
