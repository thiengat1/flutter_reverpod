import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'counterPage');
        },
        child: const Text('go to counter'),
      )),
    );
  }
}
