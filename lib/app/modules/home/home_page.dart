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
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  _addNote() async {
    FocusScope.of(context).requestFocus(FocusNode());

    controller.addNote(textController.text);

    textController.clear();
  }

  _deleteNote(int id) async {
    controller.deleteNote(id);
  }

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
          return Column(
            children: <Widget>[
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Digite sua anotação',
                  suffix: IconButton(
                    onPressed: _addNote,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                flex: 1,
                child: ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (_, i) => ListTile(
                    title: Text(
                      list[i].descricao,
                    ),
                    // leading: IconButton(
                    //   icon: Icon(Icons.edit),
                    //   onPressed: () => _deleteNote(list[i].id),
                    // ),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => _deleteNote(list[i].id),
                    ),
                  ),
                  separatorBuilder: (_, i) => Divider(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
