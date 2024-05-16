import 'package:belajaraksara/core/constants/app_colors.dart';
import 'package:belajaraksara/core/constants/data_aksara.dart';
import 'package:belajaraksara/core/widgets/general_widgets.dart';
import 'package:belajaraksara/core/widgets/widget_bg_app.dart';
import 'package:belajaraksara/core/widgets/widget_child_outline.dart';
import 'package:belajaraksara/core/widgets/widget_text_in_outline.dart';
import 'package:belajaraksara/providers/lesson_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<LessonProvider>(context, listen: false).setUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LessonProvider>(context);
    var size = MediaQuery.of(context).size;
    return WidgetBgApp(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
          ),
          child: Center(
            child:
                // Text("ada"),
                aksaraList(
              context: context,
              prov: prov,
              size: size,
            ),
          ),
        ),
      ],
    );
  }

  Widget aksaraList({
    required BuildContext context,
    required LessonProvider prov,
    required Size size,
  }) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 5,
      childAspectRatio: .92,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(
        DataAksara().listAksara.length,
        (index) => GestureDetector(
          onTap: () => prov.goToDetail(
              DataAksara().listAksara.elementAt(index), context),
          child: Container(
            color: Colors.yellow,
            margin: const EdgeInsets.all(5),
            child: WidgetChildOutline(
              path: DataAksara().listAksara.elementAt(index).iconImage,

              // textLabel: DataAksara().listAksara.elementAt(index).wordsShow,
              // textValue: DataAksara().listAksara.elementAt(index).wordsShow,
            ),
          ),
        ),
      ),
    );
  }
}
