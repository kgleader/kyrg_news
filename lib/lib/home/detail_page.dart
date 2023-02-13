import 'package:flutter/material.dart';
import '../models/news_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final NewsModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(border: Border.all()),
              child: Image.asset('assets/images/balastanImage.png',
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(),
                    ),
                    child: const Text(
                      'new',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Center(child: Text(userModel.title)),
            const SizedBox(
              height: 30,
            ),
            Text(userModel.description),
            Text(userModel.author)
          ],
        ),
      ),
    );
  }
}
