import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_user_demo/user.dart';
import 'package:flutter_user_demo/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(const User("Lewis Code", "Vietnam")));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).updateName(value),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).updateAddress(value),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(user.name),
            const SizedBox(
              height: 10,
            ),
            Text(user.address),
          ],
        ),
      ),
    );
  }
}
