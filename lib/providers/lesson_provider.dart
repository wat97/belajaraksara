import 'package:belajaraksara/core/constants/data_aksara.dart';
import 'package:belajaraksara/models/model_aksara.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LessonProvider with ChangeNotifier {
  List<ModelAksara> listAksara = DataAksara().listAksara;
  setUp(BuildContext context) async {}

  goToDetail(ModelAksara choose, BuildContext context) {
    print("klikDetail");
    context.push(
      "/detail",
      extra: choose,
    );
  }
}
