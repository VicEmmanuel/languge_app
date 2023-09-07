import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/delivery_progress.dart';
import 'package:language_app/l10n/l10n.dart';
import 'package:language_app/language_translation_tutorial/hero_list.dart';
import 'package:language_app/language_translation_tutorial/language_provider/language_switcher.dart';
import 'package:language_app/riverpod_tutorial/2_state_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


///Creating a Provider
final nameProvider = Provider<String>((ref) {
  return "Hello Vic";
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: ref.watch(localeProvider),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      supportedLocales: L10n.all,
      home: HeroList(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///Using ConsumerWidget
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name =  ref.watch(nameProvider);
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Provider"),

      ),
      body: Center(child:  Text(count.toString()),) ,
    );
  }
}


///Using Consumer
class MyHomePageTwo extends StatelessWidget {
  const MyHomePageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Provider"),

      ),
      body: Center(child:  Consumer(
        builder: (context, ref, child) {
          final name =  ref.watch(nameProvider);
          return Text(name + "Two");
        }
      ),) ,
    );
  }
}

///Reading Provider For StatefulWidget
class Main extends ConsumerStatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  ConsumerState<Main> createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  void initState() {
    super.initState();
    final name =  ref.read(nameProvider);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name =  ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Provider"),

      ),
      body: Center(child:  Text(name),) ,
    );
  }
}



