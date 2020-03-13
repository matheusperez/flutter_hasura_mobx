import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (_) {
          if (controller.notesData.status == StreamStatus.waiting ||
              controller.notesData.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list = controller.notesData.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) => ListTile(
              subtitle: Text(
                list[i].descricao,
              ),
            ),
          );
        },
      ),
    );
  }
}
