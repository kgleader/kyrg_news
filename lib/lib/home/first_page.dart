import 'package:flutter/material.dart';

import 'give_news.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('First Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.start),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => GiveNews())));
        },
      ),
    );
  }
}
