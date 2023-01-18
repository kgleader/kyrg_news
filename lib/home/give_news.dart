import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_text_field.dart';
import '../models/news_model.dart';

class GiveNews extends StatefulWidget {
  const GiveNews({super.key});

  @override
  State<GiveNews> createState() => _GiveNewsState();
}

class _GiveNewsState extends State<GiveNews> {
  @override
  void initState() {
    super.initState();
    addNews();
  }

  final _title = TextEditingController();

  final _descr = TextEditingController();

  final _author = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> addNews() async {
    final db = FirebaseFirestore.instance;
    final newsModel = NewsModel(
        title: _title.text, description: _descr.text, author: _author.text);
    await db.collection('newsCollection').add(newsModel.toMapBol());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GiveNewsPage'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
          children: [
            CustomTextField(
              hintext: 'title',
              controller: _title,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter author text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // NewsImageContainer(),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintext: 'description',
              controller: _descr,
              maxlines: 10,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter author text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintext: 'author',
              controller: _author,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter author text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (() async {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CupertinoAlertDialog(
                          title: Text('Please waiting'),
                          content: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40),
                              child: CupertinoActivityIndicator(
                                radius: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    await addNews();
                    // ignore: use_build_context_synchronously
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                }),
                child: const Icon(Icons.publish))
          ],
        ),
      ),
    );
  }
}

// class NewsImageContainer extends StatelessWidget {
//   const NewsImageContainer({
//     Key? key,
//     this.image,
//   }) : super(key: key);
//   final List<dynamic>? image;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         height: 300,
//         decoration: BoxDecoration(
//             border: Border.all(), borderRadius: BorderRadius.circular(20)),
//         child: image != null
//             ? Wrap(
//                 children: image!
//                     .map((e) => Expanded(child: Image.file(File(e))))
//                     .toList(),
//               )
//             : Center(
//                 child: IconButton(
//                     onPressed: (() {}),
//                     icon: const Icon(
//                       Icons.camera,
//                       size: 50,
//                     )),
//               ));
//   }
// }
