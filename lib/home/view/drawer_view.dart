import 'package:flutter/material.dart';
import 'package:kgz_news/theme/app_colors.dart';

import '../../components/drawer_button.dart';
import '../../theme/app_text.dart';
import 'kyrgyz_news_media.dart';

class DriwerVidget extends StatelessWidget {
  const DriwerVidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.buttonColor,
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 165,
                child: DrawerHeader(
                  // ignore: sort_child_properties_last
                  child: Column(
                    children: [
                      DrawerButton(
                        icon: Icons.phone,
                        text: AppText.News,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DrawerButton(
                        icon: Icons.call,
                        text: AppText.AppBarText,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const KyrgyzNewsMedia()));
                        },
                      ),
                    ],
                  ),
                  decoration:
                      const BoxDecoration(color: AppColors.backgroundColor),
                ),
              ),
            ]));
  }
}
