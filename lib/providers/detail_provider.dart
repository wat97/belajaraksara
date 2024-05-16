import 'package:belajaraksara/models/model_aksara.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  ModelAksara modelAksara;
  DetailProvider(this.modelAksara);
  setUp(BuildContext context) async {}
}
