import 'package:flutter/cupertino.dart';

import 'digimon_info.dart';
import 'digimon_model.dart';
import 'local_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController controller = ScrollController();

  LocalData get data => LocalData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Cupertino Lists'),
        ),
          child: SafeArea(
            //inicia o futurebuilder para pegar as inf do json
            child: FutureBuilder(
              //data.fetch pega as infs do json
              future: data.fetch(),
              builder: (context, snapshot) {
                //aqui se a conexao do snapshot for done e tiver data ele vai
                //retornar a cor de fundo e a lista de inf com nome, tipo e id
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return CupertinoScrollbar(
                    thickness: 6.0,
                    thicknessWhileDragging: 10.0,
                    radius: const Radius.circular(34.0),
                    radiusWhileDragging: Radius.zero,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: CupertinoListSection(
                          backgroundColor: CupertinoColors.tertiarySystemBackground,
                          children: List.generate(snapshot.requireData.length, (index) {
                            return CupertinoListTile(
                              title: Text(snapshot.requireData[index].name),
                              subtitle: Text(snapshot.requireData[index].level),
                              onTap: () {
                                Navigator.push(context,
                                    CupertinoPageRoute(
                                      title: snapshot.requireData[index].name,
                                        fullscreenDialog: true,
                                        builder: (context) {
                                       return DigimonInfo(model: snapshot.requireData[index]);
                                    })
                                );
                              },
                            );
                          })
                      ),
                    ),
                  );
                }
                return const Center(child: CupertinoActivityIndicator());
              }
            ),
          ),
        );
  }

}

