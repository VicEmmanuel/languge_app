import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<bool>((ref) => true);

class MyThemePage extends ConsumerWidget {
  const MyThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Toggle"),
      ),
      body: Center(
        child: Switch(
          value: isLightTheme,
          onChanged: (value) => ref.read(themeProvider.notifier).state = value,
        ),
      ),
    );
  }
}
