import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kgz_news/home/view/drawer_view.dart';

import '../models/news_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _author = TextEditingController();

  Future<void> addTodo() async {
    final db = FirebaseFirestore.instance;
    final news = NewsModel(
        title: _title.text,
        description: _description.text,
        author: _author.text);
    await db.collection('newsCollection').add(news.toMapBol());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.forAppColorWhite,
          centerTitle: true,
          title: const Text('Жаңылыктар', style: AppTextStyle.fortextStyle),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.iconColor,
                  size: 22, // Changing Drawer Icon Size
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.forAppColorGreen,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.forAppColorGreen,
              ),
            ),
          ],
          elevation: 1,
        ),
        drawer: const DriwerVidget(),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 55,
                  color: AppColors.forAppColorWhite,
                  child: const TabBar(
                    labelStyle: AppTextStyle.textLabelStyle,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    labelColor: AppColors.labelColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(
                        text: 'АКТУАЛДУУ',
                      ),
                      Tab(text: 'ВИДЕО'),
                      Tab(text: 'ПАЙДАЛУУ')
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        onTap: (() {}),
                        leading: const Image(
                            image: AssetImage('assets/images/actualduu.jpg')),
                        title: Text(
                            'Айтишниктер чачтан көп бирок Айти компанияларга бул жетишсиз $index'),
                        subtitle: const Text('17.12.2022 | көрүүчү:8600'),
                      ),
                    );
                  }),
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        onTap: (() {}),
                        leading: const Image(
                            image: AssetImage('assets/images/robotic.jpg')),
                        title: Text(
                            'Google корпорациясы дүйнөдө болуп көрбөгөндөй технология чыгарды $index'),
                        subtitle: const Text('17.12.2022 | көрүүчү:1950'),
                      ),
                    );
                  }),
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        onTap: (() {}),
                        leading: const Image(
                            image: AssetImage('assets/images/nanotech.jpg')),
                        title: Text(
                            'Nanovesicles from cells for biomedical applications $index'),
                        subtitle: const Text('02.02.2023 | көрүүчү:500000'),
                      ),
                    );
                  }),
                ),
              ]))
            ],
          ),
        ));
  }
}
