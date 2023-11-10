import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/counter_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('counter test'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counter.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // padding: const EdgeInsets.all(1),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.grey)
                        ]),
                    child: IconButton(
                        onPressed: () {
                          ref
                              .read(counterNotifierProvider.notifier)
                              .decrement();
                        },
                        icon: const Icon(
                          CupertinoIcons.minus,
                          size: 12,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    // padding: const EdgeInsets.all(1),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.grey)
                        ]),
                    child: IconButton(
                        onPressed: () {
                          ref
                              .read(counterNotifierProvider.notifier)
                              .increment();
                        },
                        icon: const Icon(
                          CupertinoIcons.plus,
                          size: 12,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
