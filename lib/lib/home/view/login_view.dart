import 'package:flutter/material.dart';

import '../give_news.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Электрондук почтаңыз',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Электрондук почтаңызды жазыңыз';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Электрондук почтаңыздын сыр сөзү',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Электрондук почтаңыздын сыр сөзү жазылуучу керек';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Эгерде форма жарактуу болсо, Validate чындыкты кайтарат, эгерде форма туура болсо, жалганды кайтарат
                    // форма жараксыз.
                    if (_formKey.currentState!.validate()) {
                      // Маалыматтарды иштетүү.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GiveNews()));
                    }
                  },
                  child: const Text('Кирүү'),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
