import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:belajaraksara/core/widgets/general_widgets.dart';
import 'package:belajaraksara/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<SplashProvider>(context, listen: false).setUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final prov = Provider.of<SplashProvider>(context);
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GeneralWidgets.appBarCustomTransparent(),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1],
              colors: [
                AppColors.primaryColor,
                AppColors.bgGrey,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              "Aksara",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
