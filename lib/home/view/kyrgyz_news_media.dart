import 'package:flutter/material.dart';

import '../../components/custom_card.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import '../../theme/app_text_style.dart';

class KyrgyzNewsMedia extends StatefulWidget {
  const KyrgyzNewsMedia({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  State<KyrgyzNewsMedia> createState() => _KyrgyzNewsMediaState();
}

class _KyrgyzNewsMediaState extends State<KyrgyzNewsMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBarColors,
        centerTitle: true,
        title: const Text(AppText.AppBarText,
            style: AppTextStyle.AppBarTextStyles),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.menu, size: 24, color: AppColors.iconColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.search, size: 24, color: AppColors.iconColor),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        margin: const EdgeInsets.all(10),
        color: AppColors.mediaBacgroundColor,
        width: 500,
        height: 400,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 50),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(AppText.Media, style: AppTextStyle.MediaTextStyle),
                    Text(
                      AppText.Versio,
                      style: AppTextStyle.VersioTextStyle,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomCard(
              icon: Icons.star,
              text: AppText.BalooText,
              onTap: () {},
            ),
            const SizedBox(height: 14),
            CustomCard(
              icon: Icons.share,
              text: AppText.Bolyshu,
              onTap: () {},
            ),
            const SizedBox(height: 14),
            CustomCard(
              icon: Icons.chat_sharp,
              text: AppText.Synysh,
              onTap: () {},
            ),
            const SizedBox(height: 14),
            CustomCard(
              icon: Icons.call,
              text: AppText.Bailanush,
              onTap: () {},
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
