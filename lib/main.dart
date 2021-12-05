import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final myProvider = StateProvider((ref) => 100);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myValue = ref.watch(myProvider.notifier).state;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Some number $myValue'),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ref.read(myProvider.state).state++;

                print(ref.read(myProvider));
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
