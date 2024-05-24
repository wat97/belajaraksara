import 'dart:math';

import 'package:belajaraksara/core/constants/data_aksara.dart';
import 'package:belajaraksara/core/utils/extension.dart';
import 'package:belajaraksara/models/model_aksara.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:timer_count_down/timer_controller.dart';

class LatihanProvider with ChangeNotifier {
  List<ModelAksara> listSoal = [];
  int number = 0;
  int max = 10;
  int countDown = 5;
  final SpeechToText speech = SpeechToText();
  String nextString = "Selanjutnya";
  final CountdownController controller = CountdownController(autoStart: false);

  setUp(BuildContext context) async {
    await checkMicrophoneAvailability();
    listSoal = DataAksara().listLatihan(10);

    notifyListeners();
  }

  checkMicrophoneAvailability() async {
    bool available = await speech.initialize();
    if (available) {
      notifyListeners();
      if (kDebugMode) {
        print('Microphone available: $available');
      }
    } else {
      if (kDebugMode) {
        print("The user has denied the use of speech recognition.");
      }
    }
  }

  listeningVoice() async {
    var available = await speech.initialize();
    print("listenApp ${available}");
    if (available) {
      speech.listen(
        listenFor: Duration(seconds: countDown),
        onResult: (result) {
          result.recognizedWords;
          print("listen ${result.recognizedWords}");
        },
        localeId: "jv_ID",
      );
    }
  }

  nextSoal() {
    if (number < max - 1) {
      number++;
    } else {
      nextString = "Selesai";
    }
    notifyListeners();
  }

  mulaiSoal() {
    controller.restart();
    listeningVoice();
    notifyListeners();
  }

  String get currentSoal {
    return listSoal.elementAt(number).iconImage;
  }
}
