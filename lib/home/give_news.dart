import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final _image = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String imageUrl = '';
  XFile? imagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> addNews() async {
    final db = FirebaseFirestore.instance;
    final newsModel = NewsModel(
        title: _title.text,
        description: _descr.text,
        author: _author.text,
        image: _image.text);
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
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Электрондук почтаңызды жазыңыз';
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
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Электрондук почтаңызды жазыңыз';
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
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Электрондук почтаңызды жазыңыз';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const ContainerImage(),
            // IconButton(
            //     onPressed: (() async {
            //       ImagePicker imagePicker = ImagePicker();
            //       XFile? file = await imagePicker.pickImage(
            //           source: ImageSource.gallery);
            //       print('${file?.path} Сурот келди');
            //       if (file == null) return;
            //       String uniqueFileName =
            //           DateTime.now().microsecondsSinceEpoch.toString();
            //       Reference referenceRoot = FirebaseStorage.instance.ref();
            //       Reference referenceDirImage =
            //           referenceRoot.child('imagesForActual');
            //       Reference referenceImageToUpload =
            //           referenceDirImage.child(uniqueFileName);
            //       try {
            //         await referenceImageToUpload.putFile(File(file.path));
            //         imageUrl = await referenceImageToUpload.getDownloadURL();
            //       } catch (error) {
            //         //some error
            //       }
            //     }),
            //     icon: const Icon(Icons.camera_alt)),
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

  imagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image;
      });
    }
  }
}

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    Key? key,
    this.images,
  }) : super(key: key);
  final List<dynamic>? images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20)),
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
