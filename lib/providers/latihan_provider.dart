import 'dart:math';

import 'package:belajaraksara/core/constants/data_aksara.dart';
import 'package:belajaraksara/core/utils/extension.dart';
import 'package:belajaraksara/models/model_aksara.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

class LatihanProvider with ChangeNotifier {
  List<ModelAksara> listSoal = [];
  int number = 0;
  int max = 10;
  final SpeechToText speech = SpeechToText();
  bool _hasSpeech = false;
  bool _logEvents = false;
  bool _onDevice = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  List<LocaleName> _localeNames = [];

  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      debugPrint('$eventTime $eventDescription');
    }
  }

  /// This initializes SpeechToText. That only has to be done
  /// once per application, though calling it again is harmless
  /// it also does nothing. The UX of the sample app ensures that
  /// it can only be called once.
  Future<void> initSpeechState(BuildContext context) async {
    _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.
        _localeNames = await speech.locales();

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      if (!context.mounted) return;

      // setState(() {
      _hasSpeech = hasSpeech;
      // });
      notifyListeners();
    } catch (e) {
      lastError = 'Speech recognition failed: ${e.toString()}';
      _hasSpeech = false;
      notifyListeners();
    }
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');

    lastStatus = status;
    notifyListeners();
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');

    lastError = '${error.errorMsg} - ${error.permanent}';
    notifyListeners();
  }

  void _switchLang(selectedVal) {
    _currentLocaleId = selectedVal;
    notifyListeners();
    debugPrint(selectedVal);
  }

  void _switchLogging(bool? val) {
    _logEvents = val ?? false;
    notifyListeners();
  }

  void _switchOnDevice(bool? val) {
    _onDevice = val ?? false;
    notifyListeners();
  }

  setUp(BuildContext context) async {
    await initSpeechState(context);
    listSoal = DataAksara().listLatihan(10);

    notifyListeners();
  }

  String get currentSoal {
    return listSoal.elementAt(number).iconImage;
  }
}
