import 'dart:async';

import 'package:hasura_connect/hasura_connect.dart';
import 'package:hello_wold_hasura/app/shared/interfaces/i_repository.dart';
import 'package:hello_wold_hasura/app/shared/models/note_model.dart';

class HomeRepository extends IRepository {
  Stream<List<NoteModel>> fetchData() {
    try {
      final data = hasuraConnect.subscription(listNotesSub);
      return data.map((data) {
        return (data['data']['notes'] as List)
            .map((item) => NoteModel.fromJson(item))
            .toList();
      });
    } on HasuraError catch (e) {
      print(e.message);
    }
  }
}
