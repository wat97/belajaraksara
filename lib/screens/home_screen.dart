import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:belajaraksara/core/widgets/general_widgets.dart';
import 'package:belajaraksara/core/widgets/widget_bg_app.dart';
import 'package:belajaraksara/core/widgets/widget_button_primary.dart';
import 'package:belajaraksara/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeProvider>(context);
    var size = MediaQuery.of(context).size;
    return WidgetBgApp(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                buttonText: 'Materi',
                onpressed: () => prov.goToLesson(context),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonPrimary(
                buttonText: 'Latihan',
                onpressed: () => prov.goToLatihan(context),
              ),
            ],
          ),
        ),
      ),
    ]);

    return Scaffold(
      appBar: GeneralWidgets.appBarCustomTransparent(),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/bg_batik.jpg",
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
