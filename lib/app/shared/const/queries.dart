class Queries {
  final listNotesSub = '''subscription listNotesSub{
      notes {
        descricao
        id
      }
    }''';

  final insertNoteMut = '''mutation insertNote(\$text: String!){
    insert_notes(objects: {descricao: \$text}) {
      affected_rows
    }
  }''';

  final deleteNoteMut = '''mutation deleteNote(\$id: Int!){
  delete_notes(where: {id: {_eq: \$id}}) {
      affected_rows
    }
  }''';
}
