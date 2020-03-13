import 'dart:async';

import 'package:hasura_connect/hasura_connect.dart';
import 'package:hello_wold_hasura/app/shared/interfaces/i_repository.dart';
import 'package:hello_wold_hasura/app/shared/models/note_model.dart';

class HomeRepository extends IRepository {
  Stream<List<NoteModel>> fetchData() async* {
    try {
      final data = hasuraConnect.subscription(listNotesSub);
      yield* data.map((data) => (data['data']['notes'] as List)
          .map((item) => NoteModel.fromJson(item))
          .toList());
    } on HasuraError catch (e) {
      print(e.message);
    }
  }

  Future<Null> insertNote(String text) async {
    try {
      await hasuraConnect.mutation(insertNoteMut, variables: {'text': text});
    } on HasuraError catch (e) {
      print(e.message);
    }
  }

  Future<Null> deleteNote(int id) async {
    try {
      await hasuraConnect.mutation(deleteNoteMut, variables: {'id': id});
    } on HasuraError catch (e) {
      print(e.message);
    }
  }
}
