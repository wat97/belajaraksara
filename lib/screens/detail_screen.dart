import 'package:belajaraksara/core/constants/fonts_custom.dart';
import 'package:belajaraksara/core/widgets/widget_bg_app.dart';
import 'package:belajaraksara/core/widgets/widget_button_primary.dart';
import 'package:belajaraksara/providers/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<DetailProvider>(context, listen: false).setUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DetailProvider>(context);
    var size = MediaQuery.of(context).size;
    return WidgetBgApp(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Di Baca",
                  style: MyFonts.bitTextBold,
                ),
                Image.asset(
                  prov.modelAksara.iconImage,
                  width: size.width * 0.4,
                ),
                Text(
                  prov.modelAksara.wordsShow,
                  style: MyFonts.bitTextBold,
                ),
                ButtonPrimary(
                  buttonText: 'Belajar',
                  onpressed: () => null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
