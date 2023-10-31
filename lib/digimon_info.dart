import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'digimon_model.dart';

class DigimonInfo extends StatefulWidget {
  const DigimonInfo({

    Key? key,
    required this.model,
  }) : super(key: key);

  final DigimonModel model;

  @override
  State<DigimonInfo> createState() => _DigimonInfoState();
}

class _DigimonInfoState extends State<DigimonInfo> {

  late DigimonModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoListTile(
              leading: const Icon(Icons.auto_graph),
              title: Text(model.level),
              subtitle: Text("This is the stage..."),
            ),
            CupertinoListTile(
              leading: typeToIcon(model.type),
              title: Text(capitalized(model.type.name)),
              subtitle: Text("This is the type..."),
            ),
          ],
        ),
      ),
    )
    );
  }
  
  String capitalized(String text) {
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  Widget typeToIcon(Type type) {
    switch (type) {
      case Type.DATA:
        return const Icon(Icons.file_copy_outlined);
      case Type.VACCINE:
        return const Icon(Icons.vaccines);
      case Type.VIRUS:
        return const Icon(Icons.coronavirus);
    }
  }
}
