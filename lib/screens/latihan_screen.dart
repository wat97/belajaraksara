import 'package:belajaraksara/core/constants/fonts_custom.dart';
import 'package:belajaraksara/core/widgets/widget_bg_app.dart';
import 'package:belajaraksara/core/widgets/widget_button_primary.dart';
import 'package:belajaraksara/providers/latihan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatihanScreen extends StatefulWidget {
  const LatihanScreen({super.key});

  @override
  State<LatihanScreen> createState() => _LatihanScreenState();
}

class _LatihanScreenState extends State<LatihanScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<LatihanProvider>(context, listen: false).setUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LatihanProvider>(context);
    var size = MediaQuery.of(context).size;
    return WidgetBgApp(
      children: [
        if (prov.listSoal.isNotEmpty)
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
                    "Soal Ke ",
                    style: MyFonts.bitTextBold,
                  ),
                  Text(
                    "Di Baca",
                    style: MyFonts.bitTextBold,
                  ),
                  Image.asset(
                    prov.currentSoal,
                    width: size.width * 0.4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPrimary(
                    buttonText: 'Mulai',
                    onpressed: () => null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPrimary(
                    buttonText: 'Selanjutnya',
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
