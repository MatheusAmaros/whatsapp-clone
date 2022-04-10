class MensagemModel {
  List<dynamic>? usuarios;
  String? imageUrl;
  String? nome;
  String? ultimaMensagem;
  DateTime? dataUltimaMensagem;
  int? quantidadeNaoLida;

  MensagemModel(this.usuarios, this.imageUrl, this.nome, this.ultimaMensagem,
      this.dataUltimaMensagem,
      {this.quantidadeNaoLida = 0});

  MensagemModel.fromMap(Map<String, dynamic> map) {
    usuarios = map['usuarios'];
    imageUrl = map['imageUrl'];
    nome = map['nome'];
    ultimaMensagem = map['ultimaMensagem'];
    dataUltimaMensagem = map['dataUltimaMensagem'].toDate();
    quantidadeNaoLida = map['quantidadeNaoLida'];
  }
}
