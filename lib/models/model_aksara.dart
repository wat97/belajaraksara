// To parse this JSON data, do
//
//     final modelAksara = modelAksaraFromJson(jsonString);

import 'dart:convert';

ModelAksara modelAksaraFromJson(String str) =>
    ModelAksara.fromJson(json.decode(str));

String modelAksaraToJson(ModelAksara data) => json.encode(data.toJson());

class ModelAksara {
  final String iconImage;
  final String words;
  final String wordsShow;

  ModelAksara({
    required this.iconImage,
    required this.words,
    required this.wordsShow,
  });

  factory ModelAksara.fromJson(Map<String, dynamic> json) => ModelAksara(
        iconImage: json["icon_image"],
        words: json["words"],
        wordsShow: json["words_show"],
      );

  Map<String, dynamic> toJson() => {
        "icon_image": iconImage,
        "words": words,
        "words_show": wordsShow,
      };
}
