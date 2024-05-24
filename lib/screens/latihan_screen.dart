import 'package:belajaraksara/core/constants/fonts_custom.dart';
import 'package:belajaraksara/core/widgets/widget_bg_app.dart';
import 'package:belajaraksara/core/widgets/widget_button_primary.dart';
import 'package:belajaraksara/providers/latihan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

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
                  Container(
                    margin: EdgeInsets.only(top: 10, left: size.width * 0.1),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Soal Ke ${prov.number + 1}",
                      style: MyFonts.bitTextBold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Di Baca",
                    style: MyFonts.bitTextBold,
                  ),
                  Container(
                    height: size.height * 0.2,
                    child: Image.asset(
                      prov.currentSoal,
                      width: size.width * 0.4,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPrimary(
                    buttonText: 'Mulai',
                    onpressed: () => prov.mulaiSoal(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPrimary(
                    buttonText: prov.nextString,
                    onpressed: () => prov.nextSoal(),
                  ),
                  const Spacer(),
                  Countdown(
                    controller: prov.controller,
                    seconds: prov.countDown,
                    build: (_, double time) => Text(
                      time.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                      ),
                    ),
                    interval: const Duration(milliseconds: 100),
                    onFinished: () {
                      prov.speech.stop();
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
