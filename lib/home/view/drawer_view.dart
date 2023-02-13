import 'package:flutter/material.dart';
import '../../components/drawer_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'kaktus_view.dart';

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
                        text: AppText.news,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DrawerButton(
                        icon: Icons.call,
                        text: AppText.appBarText,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const KaktusMedia()));
                        },
                      ),
                    ],
                  ),
                  decoration:
                      const BoxDecoration(color: AppColors.forAppColorGreen),
                ),
              ),
            ]));
  }
}
