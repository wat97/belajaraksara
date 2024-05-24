import 'package:belajaraksara/models/model_aksara.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class DetailProvider with ChangeNotifier {
  ModelAksara modelAksara;
  DetailProvider(this.modelAksara);
  final String _selectedLocaleId = 'es_MX';

  SpeechToText speech = SpeechToText();
  bool _speechEnabled = false;

  bool _logEvents = false;
  bool _onDevice = false;

  String lastWords = '';
  String lastError = '';
  String lastStatus = '';

  setUp(BuildContext context) async {
    await checkMicrophoneAvailability();
  }

  // void startListening() {
  //   _logEvent('start listening');
  //   lastWords = '';
  //   lastError = '';
  //   final pauseFor = int.tryParse(_pauseForController.text);
  //   final listenFor = int.tryParse(_listenForController.text);
  //   final options = SpeechListenOptions(
  //       onDevice: _onDevice,
  //       listenMode: ListenMode.confirmation,
  //       cancelOnError: true,
  //       partialResults: true,
  //       autoPunctuation: true,
  //       enableHapticFeedback: true);
  //   // Note that `listenFor` is the maximum, not the minimum, on some
  //   // systems recognition will be stopped before this value is reached.
  //   // Similarly `pauseFor` is a maximum not a minimum and may be ignored
  //   // on some devices.
  //   speech.listen(
  //     onResult: resultListener,
  //     listenFor: Duration(seconds: listenFor ?? 30),
  //     pauseFor: Duration(seconds: pauseFor ?? 3),
  //     localeId: _currentLocaleId,
  //     onSoundLevelChange: soundLevelListener,
  //     listenOptions: options,
  //   );
  //   setState(() {});
  // }

  // void stopListening() {
  //   _logEvent('stop');
  //   speech.stop();
  //   setState(() {
  //     level = 0.0;
  //   });
  // }

  // void cancelListening() {
  //   _logEvent('cancel');
  //   speech.cancel();
  //   setState(() {
  //     level = 0.0;
  //   });
  // }

  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      debugPrint('$eventTime $eventDescription');
    }
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

  listeningApp() async {
    var available = await speech.initialize();
    print("listenApp ${available}");
    if (available) {
      speech.listen(
        onResult: (result) {
          result.recognizedWords;
          print("listen ${result.recognizedWords}");
        },
        localeId: "jv_ID",
      );
    }
  }
}
