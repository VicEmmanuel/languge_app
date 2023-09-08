import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/delivery_progress.dart';
import 'package:language_app/l10n/l10n.dart';
import 'package:language_app/language_translation_tutorial/hero_list.dart';
import 'package:language_app/language_translation_tutorial/language_provider/language_switcher.dart';
import 'package:language_app/language_translation_tutorial/language_provider/locale_provider.dart';
import 'package:language_app/riverpod_tutorial/2_state_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_app/riverpod_tutorial/api_services/api_service.dart';
import 'package:language_app/riverpod_tutorial/api_services/response_model.dart';
import 'package:language_app/riverpod_tutorial/api_services/user_model.dart';
import 'package:language_app/riverpod_tutorial/theme_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Creating a just Provider
final nameProvider = Provider<String>((ref) {
  return "Hello Vic";
});

///
///
///

///Api Provider for Future
final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider(
  (ref) {
    return ref.watch(apiProvider).getUserTwo();
  },
);

///
///
///

///StreamProvider
final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
      const Duration(seconds: 1), ((computationCount) => computationCount));
});
///
///
///



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleProvider().loadLocaleFromPreferences();
  final preferences = await SharedPreferences.getInstance();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      locale: ref.watch(localeProvider),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: isLightTheme? ThemeData.light(): ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      home: MyThemePage()
      ,
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///Using ConsumerWidget
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Provider"),
      ),
      body: Center(
        child: Text(count.toString()),
      ),
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
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Text(name + "Two");
        }),
      ),
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
    final name = ref.read(nameProvider);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Provider"),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}

class FutureProviderHome extends ConsumerWidget {
  const FutureProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(),
        body: userData.when(
          data: (data) {
            return ListView.builder(
                itemCount: ResponseData.userModel!.data!.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                        "${ResponseData.userModel!.data![index].firstName}  ${ResponseData.userModel!.data![index].lastName}"),
                    subtitle:
                        Text("${ResponseData.userModel!.data![index].email}"),
                    leading: CircleAvatar(
                      child: Image.network(
                          "${ResponseData.userModel!.data![index].avatar}"),
                    ),
                  );
                }));
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: (() {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }),
        ));
  }
}

class StreamProviderMain extends ConsumerWidget {
  const StreamProviderMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
      ),
      body: streamData.when(
          data: ((data) => Center(
                child: Text(
                  data.toString(),
                  style: TextStyle(fontSize: 25),
                ),
              )),
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
