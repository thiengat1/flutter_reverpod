import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return 'hello lewis';
});
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Main(),
    );
  }
}

class Main extends ConsumerStatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  _MainState createState() => _MainState();
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
      body: Center(
        child: Text(name),
      ),
    );
  }
}
