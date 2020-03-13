import 'dart:async';

import 'package:hello_wold_hasura/app/modules/home/home_repository.dart';
import 'package:hello_wold_hasura/app/shared/models/note_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase(this._homeRepository) {
    notesData = _homeRepository.fetchData().asObservable();
  }
  final HomeRepository _homeRepository;
  ObservableStream<List<NoteModel>> notesData;
}
