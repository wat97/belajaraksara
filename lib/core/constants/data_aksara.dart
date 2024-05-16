import 'dart:math';

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

  // Deskripsi list yang diinginkan
  List<String> latihan = [
    "siji",
    "dahar",
    "buku",
    "duku",
    "gula",
    "guru",
    "kali",
    "lali",
    "lucu",
    "nari",
    "ngaji",
    "sapi",
    "sapu",
    "sawah",
    "tuku",
    "turu"
  ];

  List<ModelAksara> get listAksara {
    List<ModelAksara> aksaraList = letters.map((letter) {
      return ModelAksara(
        iconImage:
            'assets/aksara/$letter.png', // Sesuai dengan pola yang Anda inginkan
        words: letter,
        wordsShow: letter
            .substring(0, letter.length - 1)
            .toUpperCase(), // Menghilangkan 1 karakter di akhir dan menampilkan huruf besar
      );
    }).toList();
    return aksaraList;
  }

  List<ModelAksara> listLatihan(int totalSoal) {
    List<ModelAksara> value = ambilAcak(latihan, totalSoal).map((letter) {
      return ModelAksara(
        iconImage:
            'assets/latihan/$letter.png', // Sesuai dengan pola yang Anda inginkan
        words: letter,
        wordsShow: letter,
      );
    }).toList();
    return value;
  }

  List<String> ambilAcak(List<String> daftar, int jumlah) {
    // Mengacak urutan item dalam daftar
    daftar.shuffle();

    // Mengambil 10 item pertama setelah diacak
    List<String> hasil = daftar.sublist(0, min(jumlah, daftar.length));
    return hasil;
  }
}
