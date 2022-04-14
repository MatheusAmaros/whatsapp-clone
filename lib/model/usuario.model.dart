class UsuarioModel {
  String? id;
  String? nome;
  String? email;

  UsuarioModel(this.id, this.nome, this.email);

  UsuarioModel.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    email = map['email'];
    id = map['id'];
  }
}
