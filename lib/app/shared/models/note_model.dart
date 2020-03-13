class NoteModel {
  String descricao;
  int id;

  NoteModel({this.descricao, this.id});

  NoteModel.fromJson(Map<String, dynamic> json) {
    print('=== ENTREI AQUI! ');
    print(json);
    descricao = json['descricao'];
    id = json['id'];
  }

  Map<String, dynamic> get toJson => {
        'descricao': this.descricao,
        'id': this.id,
      };

  @override
  String toString() => '$toJson';
}
