import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import 'login_view.dart';

class AdministratorLoginPage extends StatefulWidget {
  const AdministratorLoginPage({super.key});

  @override
  State<AdministratorLoginPage> createState() => _AdministratorLoginPageState();
}

class _AdministratorLoginPageState extends State<AdministratorLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/news.png',
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 174, 243)),
                      child: AnimatedTextKit(
                          totalRepeatCount: 700,
                          animatedTexts: [WavyAnimatedText('Kabarlar')]))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginView())));
                },
                text: 'Администратор гана кирет',
                backgroundColor: Colors.blue,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
