import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/main.dart';
import 'package:language_app/riverpod_tutorial/3_state_notifier_provider.dart';

///Creating a StateProvider
final counterProvider = StateProvider<int>((ref) => 0);

///Creating a StateNotifierProvider
final counterProviderNotifier = StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final countNotifier = ref.watch(counterProviderNotifier);

    ref.listen(counterProvider, (previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("This value is $next")));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Navigate to a new screen >>',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
