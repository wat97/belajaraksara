import 'package:belajaraksara/models/model_aksara.dart';

class DataAksara {
  // List<ModelAksara> listAksara = [];
  // Deskripsi list yang diinginkan
  List<String> letters = [
    "ha",
    "na",
    "ca",
    "ra",
    "ka",
    "da",
    "ta",
    "sa",
    "wa",
    "la",
    "pa",
    "dha",
    "ja",
    "ya",
    "nya",
    "ma",
    "ga",
    "ba",
    "tha",
    "nga",
  ];

  List<ModelAksara> get listAksara {
    List<ModelAksara> aksaraList = letters.map((letter) {
      return ModelAksara(
        iconImage:
            'assets/$letter.png', // Sesuai dengan pola yang Anda inginkan
        words: letter,
        wordsShow: letter
            .substring(0, letter.length - 1)
            .toUpperCase(), // Menghilangkan 1 karakter di akhir dan menampilkan huruf besar
      );
    }).toList();
    return aksaraList;
  }
}
